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
    public List<Beer> getAllBeersByBrewery(int brewery_id) {
        String sqlSearchForBeers = "SELECT id FROM beer WHERE brewery_id = ?";

        SqlRowSet beerSet = jdbcTemplate.queryForRowSet(sqlSearchForBeers, brewery_id);
        List<Beer> beers = new ArrayList<>();

        while (beerSet.next()) {
            Beer beer = getBeerById(beerSet.getInt("id"));
            beers.add(beer);
        }

        return beers;
    }

    @Override
    public List<Beer> getAllBeers() {
        String sqlSearchForBeers = "SELECT beer.id, brewery_id, brewer, beer.name, beer.image, description, abv, beer_type, beer.active_status " +
                "FROM beer  JOIN brewery b on beer.brewery_id = b.id ";
        SqlRowSet beerSet = jdbcTemplate.queryForRowSet(sqlSearchForBeers);
        List<Beer> beers = new ArrayList<>();

        while(beerSet.next()) {
            Beer thisBeer = new Beer();
            thisBeer.setId(beerSet.getInt("id"));
            thisBeer.setBreweryId(beerSet.getInt("brewery_id"));
            thisBeer.setImage(beerSet.getString("image"));
            thisBeer.setName(beerSet.getString("name"));
            thisBeer.setDescription(beerSet.getString("description"));
            thisBeer.setAbv(beerSet.getDouble("abv"));
            thisBeer.setBeerType(beerSet.getString("beer_type"));
            thisBeer.setActivityStatus(beerSet.getBoolean("active_status"));
            thisBeer.setBrewer(beerSet.getInt("brewer"));
            beers.add(thisBeer);
        }

        return beers;
    }

    @Override
    public List<Beer> getBeersByBrewery(int brewery_id) {
        String sqlSearchForBeers = "SELECT id FROM beer WHERE brewery_id = ?";

        SqlRowSet beerSet = jdbcTemplate.queryForRowSet(sqlSearchForBeers, brewery_id);
        List<Beer> beers = new ArrayList<>();

        while (beerSet.next()) {
            Beer beer = getBeerById(beerSet.getInt("id"));
            if (beer.isActivityStatus()) {
                beers.add(beer);
            }
        }

        return beers;
    }

    @Override
    public Beer getBeerById(int id) {
        String sqlSearchForBeer ="SELECT beer.id, brewery_id, brewer, beer.name, beer.image, description, abv, beer_type, beer.active_status " +
                "FROM beer  JOIN brewery b on beer.brewery_id = b.id "+
                "WHERE beer.id = ?";

        SqlRowSet beer = jdbcTemplate.queryForRowSet(sqlSearchForBeer, id);
        Beer thisBeer = null;
        if(beer.next()) {
            thisBeer = new Beer();
            thisBeer.setId(beer.getInt("id"));
            thisBeer.setBreweryId(beer.getInt("brewery_id"));
            thisBeer.setImage(beer.getString("image"));
            thisBeer.setName(beer.getString("name"));
            thisBeer.setDescription(beer.getString("description"));
            thisBeer.setAbv(beer.getDouble("abv"));
            thisBeer.setBeerType(beer.getString("beer_type"));
            thisBeer.setActivityStatus(beer.getBoolean("active_status"));
            thisBeer.setBrewer(beer.getInt("brewer"));
        }

        return thisBeer;
    }

    @Override
    public void updateBeer(int id, String name, String beerType, double abv, String description, boolean activityStatus) {
        String sqlUpdateBeer = "UPDATE beer " +
                "SET name = ?, beer_type = ?, abv = ?, description = ?, active_status = ? WHERE id = ?";
        jdbcTemplate.update(sqlUpdateBeer, name, beerType, abv, description, activityStatus, id);
    }

    @Override
    public void addBeer(int breweryId, String name, String image, String description, double abv, String beerType, boolean activityStatus) {
        String sqlAddBeer = "INSERT INTO beer " +
                "(brewery_id, name, image, description, abv, beer_type, active_status) VALUES " +
                "(?, ?, ?, ?, ?, ?, ?)";
        jdbcTemplate.update(sqlAddBeer, breweryId, name, image, description, abv, beerType, activityStatus);
    }

    @Override
    public int getNextId() {
        String sqlMaxId = "SELECT max(id) as id FROM beer";
        SqlRowSet row = jdbcTemplate.queryForRowSet(sqlMaxId);
        if(row.next()){
            return row.getInt("id") + 1;
        }
        return -1;
    }

    @Override
    public void insertImageByBeerId(String fileName, int parseInt) {
        String insertImageSQL = "UPDATE beer SET image = ? WHERE id = ?";
        jdbcTemplate.update(insertImageSQL, fileName, parseInt);
    }

    @Override
    public void makeBeerInactive(int id) {
        String sql = "UPDATE beer SET active_status=false WHERE id = ?";
        jdbcTemplate.update(sql, id);
    }
}
