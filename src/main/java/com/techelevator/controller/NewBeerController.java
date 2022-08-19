package com.techelevator.controller;

import com.techelevator.model.dao.BeerDAO;
import com.techelevator.model.dao.BreweryDAO;
import com.techelevator.model.dao.UserDAO;
import com.techelevator.model.dto.Beer;
import com.techelevator.model.dto.Brewery;
import com.techelevator.model.dto.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.validation.Valid;

@Controller
public class NewBeerController {

    private BeerDAO beerDAO;

    private UserDAO userDAO;

    @Autowired
    public NewBeerController(BeerDAO beerDAO, UserDAO userDAO) {
        this.beerDAO = beerDAO;
        this.userDAO = userDAO;
    }

    @RequestMapping("breweries/{breweryId}/addBeer")
    public String displayNewBreweryForm(@PathVariable String breweryId) {

        return "beers/newBeer";
    }

    @RequestMapping(path="/breweries/{breweryId}/newBeer", method=RequestMethod.POST)
    public String createBrewery(@SessionAttribute User currentUser,
                                @Valid @ModelAttribute Beer beer,
                                BindingResult result,
                                RedirectAttributes flash, @PathVariable String breweryId) {
        if(result.hasErrors()) {
            flash.addFlashAttribute("beer", beer);
            flash.addFlashAttribute(BindingResult.MODEL_KEY_PREFIX + "beer", result);
            return "redirect:/breweries/{breweryId}/addBeer";
        }

        beerDAO.addBeer(Integer.parseInt(breweryId), beer.getName(), beer.getImage(), beer.getDescription(),
                beer.getAbv(), beer.getBeerType(), true);

        return "redirect:/breweries/" + breweryId;
    }

}
