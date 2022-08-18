package com.techelevator.model.dao;

import com.techelevator.model.dto.Beer;
import java.util.List;

public interface BeerDAO {

    public List<Beer> getBeersByBrewery(int brewery_id);
    public Beer getBeerById(int id);
    public void updateBeer(int id, String name, String beerType, double abv, String image, String description, boolean activityStatus);
}
