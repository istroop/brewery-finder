package com.techelevator.controller;

import com.techelevator.model.dao.BeerDAO;
import com.techelevator.model.dao.UserDAO;
import com.techelevator.services.uploads.UploadProvider;
import com.techelevator.model.dto.Beer;
import com.techelevator.model.dto.Brewery;
import com.techelevator.model.dto.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;

@Controller
public class NewBeerController {

    private BeerDAO beerDAO;

    private UserDAO userDAO;

    private UploadProvider uploadProvider;

    @Autowired
    public NewBeerController(BeerDAO beerDAO, UserDAO userDAO, UploadProvider uploadProvider) {
        this.beerDAO = beerDAO;
        this.userDAO = userDAO;
        this.uploadProvider = uploadProvider;
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

        int id = beerDAO.getNextId();
        beerDAO.addBeer(Integer.parseInt(breweryId), beer.getName(), "", beer.getDescription(),
                beer.getAbv(), beer.getBeerType(), true);

        return "redirect:/breweries/" + breweryId + "/newBeer/" + id + "/newImage";
    }

    @RequestMapping("breweries/{breweryId}/newBeer/{beerId}/newImage")
    public String displayUploadImage(ModelMap modelHolder, @PathVariable String breweryId, @PathVariable String beerId) {
        return "beers/beerImageUpload";
    }

    @RequestMapping(path="/breweries/{breweryId}/newBeer/{beerId}/2", method =RequestMethod.POST)
    public String uploadImage(MultipartFile file, HttpServletRequest request, @Valid @ModelAttribute Brewery brewery,
                              @PathVariable String breweryId, @PathVariable String beerId)
    {
        String fileName = "";
        if(file != null && !file.isEmpty()) {
            try {
                //come up with a file name first
                String defaultFileName = "beer_" + beerId;


                //save the file with the chosen name
                fileName = uploadProvider.uploadFile( file, defaultFileName );

                // save to database
                beerDAO.insertImageByBeerId(fileName, Integer.parseInt(beerId));
            }
            catch(Throwable ex) {}
        }
        else {beerDAO.insertImageByBeerId("default.jpg", Integer.parseInt(beerId));}
        //int id = beerDAO.getNextId() - 1;
        return "redirect:/breweries/" + breweryId;
    }

}
