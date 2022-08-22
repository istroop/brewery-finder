package com.techelevator.controller;

import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;

import com.techelevator.model.dao.BreweryDAO;
import com.techelevator.model.dto.Brewery;
import com.techelevator.services.uploads.UploadProvider;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.techelevator.model.dto.User;


@Controller
public class NewBreweryController {

    private BreweryDAO breweryDAO;
    private UploadProvider uploadProvider;
    private ImageDemoController imageDemoController;

    @Autowired
    public NewBreweryController(BreweryDAO breweryDAO, UploadProvider uploadProvider) {
        this.breweryDAO = breweryDAO;
        this.uploadProvider = uploadProvider;
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
        };

        int id = breweryDAO.getNextId();
        breweryDAO.newBrewery(brewery.getBrewer(), brewery.getName(), brewery.getHoursOfOperation(), brewery.getPhone(), brewery.getHistory(), brewery.getImage(), brewery.getAddress(), true);

        return "redirect:/breweries/" + id + "/newImage";
    }

    @RequestMapping("breweries/{breweryId}/newImage")
    public String displayUploadImage(ModelMap modelHolder, @PathVariable String breweryId) {
        return "breweries/breweryImageUpload";
    }

    @RequestMapping(path="/breweries/{breweryId}/2", method =RequestMethod.POST)
    public String uploadImage(MultipartFile file, HttpServletRequest request, @Valid @ModelAttribute Brewery brewery,
                              @PathVariable String breweryId)
    {
        String fileName = "";
        if(file != null && !file.isEmpty())
        {
            try
            {
                //come up with a file name first
                String defaultFileName = "brewery_#" + breweryId;


                //save the file with the chosen name
                fileName = uploadProvider.uploadFile( file, defaultFileName );

                // save to database
                breweryDAO.insertImageByBreweryId(fileName, Integer.parseInt(breweryId));
            }
            catch(Throwable ex)
            {

            }
        }
        int id = breweryDAO.getNextId() - 1;
        return "redirect:/breweries/" + id;
    }
}
