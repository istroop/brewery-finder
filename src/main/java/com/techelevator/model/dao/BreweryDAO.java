package com.techelevator.model.dao;

import com.techelevator.model.dto.Brewery;

import java.util.List;

public interface BreweryDAO {

    List<Brewery> getActiveBreweries();
    List<Brewery> getAllBreweries();
    Brewery getBreweryById (int id);
    void updateBrewery(int id, String hoursOfOperation, String phone, String history,
                              String address, Boolean activityStatus);
    void newBrewery (int id, String name, String hoursOfOperation, String phone, String history, String image,
            String address, Boolean activityStatus);
    int getNextId();
    void insertImageByBreweryId(String imageName, int breweryId);
    void makeBreweryInactive(int id);
    List<String> getBreweryImages(int breweryId);
    int getNextImageId();
    void insertBreweryImage(String imageName, int breweryId);
}


