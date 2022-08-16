package com.techelevator.controller;

import com.techelevator.model.dao.BeerDAO;
import com.techelevator.model.dao.BreweryDAO;
import com.techelevator.model.dao.UserDAO;
import com.techelevator.model.dto.Beer;
import com.techelevator.model.dto.Brewery;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;
import java.util.List;

@Controller
public class BreweryInfoPageController {

    private BreweryDAO breweryDAO;
    private BeerDAO beerDAO;

    @Autowired
    public BreweryInfoPageController(BreweryDAO breweryDAO, BeerDAO beerDAO) {
        this.breweryDAO = breweryDAO;
        this.beerDAO = beerDAO;
    }

    @RequestMapping("/breweries/{breweryId}")
    public String getBreweryInfoPage(@PathVariable("breweryId") int id, HttpServletRequest request) {

        Brewery brewery = breweryDAO.getBreweryById(id);
        request.setAttribute("brewery", brewery);

        List<Beer> beers = beerDAO.getBeersByBrewery(id);
        request.setAttribute("beers", beers);

        return "breweryInfoPage";
    }

}