package com.techelevator.controller;

import com.techelevator.model.dao.BreweryDAO;
import com.techelevator.model.dto.Beer;
import com.techelevator.model.dto.Brewery;
import com.techelevator.model.dto.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttribute;

import javax.servlet.http.HttpServletRequest;
import java.util.List;

@Controller
public class BreweryListController {

    private BreweryDAO breweryDAO;

    @Autowired
    public BreweryListController(BreweryDAO breweryDAO) {
        this.breweryDAO = breweryDAO;
    }

    @RequestMapping("/breweryList")
    public String getLoggedInMainPage(HttpServletRequest request) {
        List<Brewery> breweries = breweryDAO.getActiveBreweries();
        List<Brewery> allBreweries = breweryDAO.getAllBreweries();
        request.setAttribute("breweries", breweries);
        request.setAttribute("allBreweries", allBreweries);

        return "/breweries/breweryList";
    }

    @RequestMapping("/breweries/{breweryId}/delete")
    public String deleteBrewery(@PathVariable int breweryId) {

        breweryDAO.makeBreweryInactive(breweryId);

        return "redirect:/breweryList";
    }

    public String showAllBreweries() {


        return "redirect:/breweryList";
    }

}
