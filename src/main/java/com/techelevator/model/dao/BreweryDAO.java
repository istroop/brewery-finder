package com.techelevator.model.dao;

import com.techelevator.model.dto.Brewery;

import java.util.List;

public interface BreweryDAO {

    public List<Brewery> getActiveBreweries();
    public Brewery getBreweryById (int id);

}
