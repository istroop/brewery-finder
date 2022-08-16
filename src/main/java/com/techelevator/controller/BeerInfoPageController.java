package com.techelevator.controller;

import com.techelevator.model.dao.BeerDAO;
import com.techelevator.model.dto.Beer;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;

@Controller
public class BeerInfoPageController {

    private BeerDAO beerDAO;

    @Autowired
    public BeerInfoPageController(BeerDAO beerDAO) {
        this.beerDAO = beerDAO;
    }

    @RequestMapping("/beer/{beerId}")
    public String getBeerInfoPage(@PathVariable("beerId") int id, HttpServletRequest request) {

        Beer beer = beerDAO.getBeerById(id);
        request.setAttribute("beer", beer);

        return "beerInfoPage";
    }
}
