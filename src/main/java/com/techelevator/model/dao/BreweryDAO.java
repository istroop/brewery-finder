package com.techelevator.model.dao;

import com.techelevator.model.dto.Brewery;

import java.util.List;

public interface BreweryDAO {

    public List<Brewery> getActiveBreweries();
    public Brewery getBreweryById (int id);
    public void updateBrewery(int id, String hoursOfOperation, String phone, String history,
                              String address, Boolean activityStatus);
    public void newBrewery (int id, String name, String hoursOfOperation, String phone, String history, String image,
            String address, Boolean activityStatus);
    public int getNextId();
    public void insertImageByBreweryId(String imageName, int breweryId);
    public void makeBreweryInactive(int id);
}


