package com.techelevator.model.dao;

import com.techelevator.model.dto.Beer;
import java.util.List;

public interface BeerDAO {
    List<Beer> getBeersByBrewery(int brewery_id);
    List<Beer> getAllBeersByBrewery(int brewery_id);
    List<Beer> getAllBeers();
    Beer getBeerById(int id);
    void updateBeer(int id, String name, String beerType, double abv, String description, boolean activityStatus);
    void addBeer(int breweryId, String name, String image, String description, double abv, String beerType, boolean activityStatus);
    int getNextId();
    void insertImageByBeerId(String fileName, int parseInt);
    void makeBeerInactive(int id);
}
