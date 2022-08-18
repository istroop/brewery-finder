package com.techelevator.controller;

import javax.validation.Valid;

import com.techelevator.model.dao.BreweryDAO;
import com.techelevator.model.dto.Brewery;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.techelevator.model.dto.User;


@Controller
public class NewBreweryController {

    private BreweryDAO breweryDAO;

    @Autowired
    public NewBreweryController(BreweryDAO breweryDAO) {
        this.breweryDAO = breweryDAO;
    }

    @RequestMapping("breweries/new")
    public String displayNewBreweryForm(ModelMap modelHolder) {

        return "breweries/newBrewery";
    }

    @RequestMapping(path="/breweries", method=RequestMethod.POST)
    public String createBrewery(@SessionAttribute User currentUser,
                                @Valid @ModelAttribute Brewery brewery,
                                BindingResult result,
                                RedirectAttributes flash) {
        if(result.hasErrors()) {
            flash.addFlashAttribute("brewery", brewery);
            flash.addFlashAttribute(BindingResult.MODEL_KEY_PREFIX + "brewery", result);
            return "redirect:/breweries/new";
        }

        breweryDAO.newBrewery(brewery.getBrewer(), brewery.getName(), brewery.getHoursOfOperation(), brewery.getPhone(), brewery.getHistory(), brewery.getImage(), brewery.getAddress(), true);

        String userName = currentUser.getUserName();

        return "redirect:/users/" + userName;
    }

}
