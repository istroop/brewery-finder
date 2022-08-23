package com.techelevator.controller;

import com.techelevator.model.dao.BeerDAO;
import com.techelevator.model.dao.BreweryDAO;
import com.techelevator.model.dto.Beer;
import com.techelevator.model.dto.Brewery;
import com.techelevator.model.dto.User;
import com.techelevator.services.uploads.UploadProvider;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;
import java.util.List;

@Controller
public class BreweryInfoPageController {

    private BreweryDAO breweryDAO;
    private BeerDAO beerDAO;
    private UploadProvider uploadProvider;

    @Autowired
    public BreweryInfoPageController(BreweryDAO breweryDAO, BeerDAO beerDAO, UploadProvider uploadProvider) {
        this.breweryDAO = breweryDAO;
        this.beerDAO = beerDAO;
        this.uploadProvider = uploadProvider;
    }

    @RequestMapping("/breweries/{breweryId}")
    public String getBreweryInfoPage(@SessionAttribute User currentUser, HttpServletRequest request, @PathVariable int breweryId) {

        Brewery brewery = breweryDAO.getBreweryById(breweryId);
        request.setAttribute("brewery", brewery);

        List<Beer> beers = beerDAO.getBeersByBrewery(breweryId);
        request.setAttribute("beers", beers);

        List<String> images = breweryDAO.getBreweryImages(breweryId);
        request.setAttribute("images", images);

        request.setAttribute("currentUser", currentUser);

        return "breweries/breweryInfoPage";
    }

    @RequestMapping("/breweries/{breweryId}/allBeers")
    public String getAllBeersPage(@SessionAttribute User currentUser, HttpServletRequest request, @PathVariable int breweryId) {

        Brewery brewery = breweryDAO.getBreweryById(breweryId);
        request.setAttribute("brewery", brewery);

        List<Beer> beers = beerDAO.getAllBeersByBrewery(breweryId);
        request.setAttribute("beers", beers);

        request.setAttribute("currentUser", currentUser);

        return "breweries/beerList";
    }

    @RequestMapping("/breweries/{breweryId}/uploadImage")
    public String uploadBreweryImage(@PathVariable int breweryId, HttpServletRequest request) {
        String name = breweryDAO.getBreweryById(breweryId).getName();
        request.setAttribute("name", name);
        return "/breweries/uploadImage";
    }

    @RequestMapping(path="/breweries/{breweryId}/img", method = RequestMethod.POST)
    public String uploadImage(MultipartFile file, HttpServletRequest request, @Valid @ModelAttribute Brewery brewery,
                             @PathVariable int breweryId) {
        int currentId = breweryDAO.getNextImageId();
        String fileName = "";

        if(file != null && !file.isEmpty()) {
            try {
                //come up with a file name first
                String defaultFileName = brewery.getName() + "_" + currentId;


                //save the file with the chosen name
                fileName = uploadProvider.uploadFile( file, defaultFileName );

                // save to database
                breweryDAO.insertBreweryImage(fileName, breweryId);
            }
            catch(Throwable ex) {}
        }
        return "redirect:/breweries/" + breweryId;
    }

}