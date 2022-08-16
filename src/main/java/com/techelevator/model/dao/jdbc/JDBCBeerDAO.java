package com.techelevator.model.dao.jdbc;

import com.techelevator.model.dao.BeerDAO;
import com.techelevator.model.dto.Beer;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.support.rowset.SqlRowSet;
import org.springframework.stereotype.Component;

import javax.sql.DataSource;
import java.util.ArrayList;
import java.util.List;

@Component
public class JDBCBeerDAO implements BeerDAO {

    private JdbcTemplate jdbcTemplate;

    @Autowired
    public JDBCBeerDAO(DataSource dataSource) {
        jdbcTemplate = new JdbcTemplate(dataSource);
    }

    @Override
    public List<Beer> getBeersByBrewery(int brewery_id) {
        String sqlSearchForBeers = "SELECT id FROM beer WHERE brewery_id = ?";

        SqlRowSet beerSet = jdbcTemplate.queryForRowSet(sqlSearchForBeers);
        List<Beer> beers = new ArrayList<>();

        while (beerSet.next()) {
            Beer beer = getBeerById(beerSet.getInt("id"));
            beers.add(beer);
        }

        return beers;
    }

    @Override
    public Beer getBeerById(int id) {
        String sqlSearchForBeer ="SELECT id, brewery_id, name, image, description, abv, beer_type " +
                "FROM beer "+
                "WHERE id = ? ";

        SqlRowSet beer = jdbcTemplate.queryForRowSet(sqlSearchForBeer, id);
        Beer thisBeer = null;
        if(beer.next()) {
            thisBeer = new Beer();
            thisBeer.setId(beer.getInt("id"));
            thisBeer.setBreweryId(beer.getInt("brewery_id"));
            thisBeer.setName(beer.getString("name"));
            thisBeer.setDescription(beer.getString("description"));
            thisBeer.setAbv(beer.getDouble("abv"));
            thisBeer.setBeerType(beer.getString("beer_type"));
        }

        return thisBeer;
    }
}
