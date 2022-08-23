package com.techelevator.controller;

import com.techelevator.model.dao.BeerDAO;
import com.techelevator.model.dto.Beer;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import javax.servlet.http.HttpServletRequest;
import java.util.List;

@Controller
public class MasterBeerListController {

    private BeerDAO beerDAO;

    @Autowired
    public MasterBeerListController(BeerDAO beerDAO) {
        this.beerDAO = beerDAO;
    }

    @RequestMapping("/beerDirectory")
    public String getMasterBeerList(HttpServletRequest request) {

        List<Beer> allBeers = beerDAO.getAllBeers();
        request.setAttribute("beers", allBeers);

        return "/beers/masterBeerList";
    }

}
