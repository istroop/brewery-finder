package com.techelevator.controller;

import com.techelevator.model.dao.BeerDAO;
import com.techelevator.model.dao.BreweryDAO;
import com.techelevator.model.dto.Beer;
import com.techelevator.model.dto.Brewery;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;
import java.util.List;

@Controller
public class InactiveBeerListController {

    private BeerDAO beerDAO;

    @Autowired
    public InactiveBeerListController(BeerDAO beerDAO) {
        this.beerDAO = beerDAO;
    }

    @RequestMapping("/breweries/{breweryId}/inactiveBeers")
    public String getInactiveBeers(HttpServletRequest request, @PathVariable int breweryId) {

        List<Beer> inactiveBeers = beerDAO.getInactiveBeersByBrewery(breweryId);
        request.setAttribute("beers", inactiveBeers);
        return "/beers/inactiveBeerList";
    }

    @RequestMapping("/breweries/{breweryId}/reactivate")
    public String reactivateBeers(HttpServletRequest request, @PathVariable int breweryId){
        return "redirect:/breweries/" + breweryId;
    }

}
