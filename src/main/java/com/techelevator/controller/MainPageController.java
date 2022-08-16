package com.techelevator.controller;

import com.techelevator.model.dao.BreweryDAO;
import com.techelevator.model.dao.UserDAO;
import com.techelevator.model.dto.Brewery;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;
import java.util.List;

@Controller
public class MainPageController {

    private BreweryDAO breweryDAO;

    @Autowired
    public MainPageController(BreweryDAO breweryDAO) {
        this.breweryDAO = breweryDAO;
    }

    @RequestMapping("/")
    public String getMainPage(HttpServletRequest request) {

        List<Brewery> breweries = breweryDAO.getActiveBreweries();
        request.setAttribute("breweries", breweries);
        return "mainPage";

    }

}
