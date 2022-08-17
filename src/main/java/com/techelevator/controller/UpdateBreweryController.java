package com.techelevator.controller;

import com.techelevator.model.dao.BreweryDAO;
import com.techelevator.model.dto.Brewery;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpRequest;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import javax.servlet.http.HttpServletRequest;

@Controller
public class UpdateBreweryController {

    private BreweryDAO breweryDAO;

    @Autowired
    public UpdateBreweryController(BreweryDAO breweryDAO) {
        this.breweryDAO = breweryDAO;
    }

    @RequestMapping(value = "/breweries/{breweryId}/update", method = RequestMethod.GET)
    public String getMainPage(HttpServletRequest request, @PathVariable int breweryId) {

        Brewery brewery = breweryDAO.getBreweryById(breweryId);
        request.setAttribute("brewery", brewery);

        return "updateBrewery";
    }

    @RequestMapping(path="/breweries/{breweryId}", method=RequestMethod.POST)
    public String updateBrewery(@PathVariable int breweryId) {
        return "breweryInfoPage";
    }
}