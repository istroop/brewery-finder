package com.techelevator.controller;

import com.techelevator.model.dao.BreweryDAO;
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
public class UpdateBreweryController {

    private BreweryDAO breweryDAO;

    @Autowired
    public UpdateBreweryController(BreweryDAO breweryDAO) {
        this.breweryDAO = breweryDAO;
    }

    @RequestMapping(value = "/breweries/{breweryId}/update")
    public String getUpdatePage(HttpServletRequest request, @PathVariable int breweryId) {

        Brewery brewery = breweryDAO.getBreweryById(breweryId);
        request.setAttribute("brewery", brewery);

        return "breweries/updateBrewery";
    }

    @RequestMapping(path="/breweries/{breweryId}", method=RequestMethod.POST)
    public String updateBrewery(@Valid @ModelAttribute Brewery brewery, @PathVariable int breweryId) {

        breweryDAO.updateBrewery(breweryId, brewery.getHoursOfOperation(), brewery.getPhone(),
                brewery.getHistory(), brewery.getImage(), brewery.getAddress(), brewery.getActivityStatus());
        return "redirect:/breweries/" + breweryId;
    }
}