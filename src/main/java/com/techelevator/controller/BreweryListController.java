package com.techelevator.controller;

import com.techelevator.model.dao.BreweryDAO;
import com.techelevator.model.dto.Brewery;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;
import java.util.List;

@Controller
public class BreweryListController {

    private BreweryDAO breweryDAO;

    public BreweryListController (BreweryDAO breweryDAO) {
        this.breweryDAO = breweryDAO;
    }
    @RequestMapping("/breweryList")
    public String getBreweryListPage(HttpServletRequest request) {

        List<Brewery> breweries = breweryDAO.getActiveBreweries();
        request.setAttribute("breweries", breweries);
        return "breweryListPage";

    }
}
