package com.techelevator.model.dao.jdbc;

import com.techelevator.model.dao.BreweryDAO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.support.rowset.SqlRowSet;
import org.springframework.stereotype.Component;
import com.techelevator.model.dto.Brewery;

import javax.sql.DataSource;
import java.util.ArrayList;
import java.util.List;

@Component
public class JDBCBreweryDAO implements BreweryDAO{


    private JdbcTemplate jdbcTemplate;

    @Autowired
    public JDBCBreweryDAO(DataSource dataSource) {
        jdbcTemplate = new JdbcTemplate(dataSource);
    }

    @Override
    public List<Brewery> getActiveBreweries() {
        String sqlSearchForBreweries = "SELECT id FROM brewery WHERE active_status = TRUE";

        SqlRowSet breweriesSet = jdbcTemplate.queryForRowSet(sqlSearchForBreweries);
        List<Brewery> breweries = new ArrayList<>();

        while (breweriesSet.next()) {
            Brewery brewery = getBreweryById(breweriesSet.getInt("id"));
            breweries.add(brewery);
        }

        return breweries;
    }

    @Override
    public Brewery getBreweryById(int id) {
        String sqlSearchForBrewery ="SELECT id, name, brewer, hours_of_operation, phone, history, address, image, " +
                "active_status "+
                "FROM brewery "+
                "WHERE id = ? ";

        SqlRowSet brewery = jdbcTemplate.queryForRowSet(sqlSearchForBrewery, id);
        Brewery thisBrewery = null;
        if(brewery.next()) {
            thisBrewery = new Brewery();
            thisBrewery.setId(brewery.getInt("id"));
            thisBrewery.setName(brewery.getString("name"));
            thisBrewery.setBrewer(brewery.getInt("brewer"));
            thisBrewery.setHoursOfOperation(brewery.getString("hours_of_operation"));
            thisBrewery.setPhone(brewery.getString("phone"));
            thisBrewery.setHistory(brewery.getString("history"));
            thisBrewery.setImage(brewery.getString("image"));
            thisBrewery.setAddress(brewery.getString("address"));
            thisBrewery.setActivityStatus(brewery.getBoolean("active_status"));
        }

        return thisBrewery;
    }

    @Override
    public void updateBrewery(int id, String hoursOfOperation, String phone, String history, String image, String address, Boolean activityStatus) {
        String updateBrewery = "UPDATE brewery SET hours_of_operation = ?, phone = ?, history = ?, image = ?, " +
                "address = ?, active_status = ? WHERE id = ?";
        jdbcTemplate.update(updateBrewery, hoursOfOperation, phone, history, image, address, activityStatus, id);
    }

    @Override
    public void newBrewery (int brewer, String name, String hoursOfOperation, String phone, String history, String image,
                            String address, Boolean activityStatus){
        jdbcTemplate.update("INSERT INTO brewery(name, brewer, hours_of_operation, phone, history, image, address, active_status)" +
                "VALUES ( ?,?,?,?,?,?,?,?);", name, brewer, hoursOfOperation, phone, history, image, address, activityStatus);

    }

}
