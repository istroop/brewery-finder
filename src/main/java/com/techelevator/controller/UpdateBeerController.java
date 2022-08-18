package com.techelevator.controller;

import com.techelevator.model.dao.BeerDAO;
import com.techelevator.model.dao.BreweryDAO;
import com.techelevator.model.dto.Beer;
import com.techelevator.model.dto.Brewery;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;

@Controller
public class UpdateBeerController {

    private BeerDAO beerDAO;

    @Autowired
    public UpdateBeerController(BeerDAO beerDAO) {
        this.beerDAO = beerDAO;
    }

    @RequestMapping(value = "/beer/{beerId}/update")
    public String getUpdatePage(HttpServletRequest request, @PathVariable int beerId) {

        Beer beer = beerDAO.getBeerById(beerId);
        request.setAttribute("beer", beer);

        return "beers/updateBeer";
    }

    @RequestMapping(path="/beer/{breweryId}", method=RequestMethod.POST)
    public String updateBrewery(@Valid @ModelAttribute Beer beer, @PathVariable int beerId) {

        return "redirect:/beer/" + beerId;
    }
}