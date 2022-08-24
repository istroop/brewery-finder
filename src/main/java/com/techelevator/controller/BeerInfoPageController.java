package com.techelevator.controller;

import com.techelevator.model.dao.BeerDAO;
import com.techelevator.model.dao.BeerReviewDAO;
import com.techelevator.model.dao.BreweryDAO;
import com.techelevator.model.dto.Beer;
import com.techelevator.model.dto.BeerReview;
import com.techelevator.model.dto.Brewery;
import com.techelevator.model.dto.User;
import com.techelevator.services.uploads.UploadProvider;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;
import java.util.List;

@Controller
public class BeerInfoPageController {

    private BeerDAO beerDAO;
    private BeerReviewDAO beerReviewDAO;
    private UploadProvider uploadProvider;
    private BreweryDAO breweryDAO;

    @Autowired
    public BeerInfoPageController(BeerDAO beerDAO, BeerReviewDAO beerReviewDAO, UploadProvider uploadProvider,
                                  BreweryDAO breweryDAO) {
        this.beerDAO = beerDAO;
        this.beerReviewDAO = beerReviewDAO;
        this.uploadProvider = uploadProvider;
        this.breweryDAO = breweryDAO;
    }

    @RequestMapping("/beer/{beerId}")
    public String getBeerInfoPage(@SessionAttribute User currentUser, @PathVariable("beerId") int id, HttpServletRequest request) {

        Beer beer = beerDAO.getBeerById(id);
        request.setAttribute("beer", beer);

        Brewery brewery = breweryDAO.getBreweryById(beer.getBreweryId());
        request.setAttribute("brewery", brewery);

        List<BeerReview> reviewList = beerReviewDAO.getReviewsByBeerId(id);

        for(BeerReview review: reviewList){
            List<String> images = beerReviewDAO.getReviewImages(review.getId());
            review.setReviewImages(images);

            List<String> responses = beerReviewDAO.getReviewResponses(review.getId());
            review.setReviewResponses(responses);
        }
        request.setAttribute("reviews", reviewList);

        double averageRating = 0.0;
        for(BeerReview review: reviewList) {
            averageRating += review.getRating();
        }
        request.setAttribute("averageRating", Math.round(averageRating/reviewList.size() * 100.0) / 100.0);
        request.setAttribute("currentUser", currentUser);

        return "beers/beerInfoPage";
    }

    @RequestMapping("/beer/{beerId}/reviews/new")
    public String displayNewReviewForm(@PathVariable("beerId") int id, ModelMap modelHolder) {

        modelHolder.addAttribute("beerId", id);

        return "beers/reviews/newReview";
    }


    @RequestMapping(path="/beer/{beerId}/reviews", method=RequestMethod.POST)
    public String createReview(@SessionAttribute User currentUser, @PathVariable("beerId") int id,
                               @Valid @ModelAttribute BeerReview review,
                               BindingResult result,
                               RedirectAttributes flash) {

        if(result.hasErrors()) {
            flash.addFlashAttribute("review", review);
            flash.addFlashAttribute(BindingResult.MODEL_KEY_PREFIX + "review", result);
            return "redirect:/beer/{beerId}/reviews/new";
        }

        beerReviewDAO.createNewReview(review.getBeerId(), currentUser.getId(), review.getRating(),
                review.getReview(),
                review.getReviewTitle());

        return "redirect:/beer/{beerId}";

    }

    @RequestMapping(value = "/beer/{beerId}/update")
    public String getUpdatePage(HttpServletRequest request, @PathVariable int beerId) {

        Beer beer = beerDAO.getBeerById(beerId);
        request.setAttribute("beer", beer);

        return "beers/updateBeer";
    }

    @RequestMapping(path="/beer/{beerId}", method=RequestMethod.POST)
    public String updateBeer(@Valid @ModelAttribute Beer beer, @PathVariable int beerId) {
        beerDAO.updateBeer(beerId, beer.getName(), beer.getBeerType(), beer.getAbv(), beer.getDescription(), beer.isActivityStatus());
        return "redirect:/beer/" + beerId;
    }

    @RequestMapping("beer/{beerId}/delete")
    public String deleteBeer(@PathVariable("beerId") int id) {
        beerDAO.makeBeerInactive(id);

        return "redirect:/breweryList";
    }

    @RequestMapping("/beer/{beerId}/review/{reviewId}/reviewImages")
    public String addReviewImage(@PathVariable("beerId") int id, @PathVariable String reviewId){
        return "beers/reviews/newReviewImage";
    }

    @RequestMapping(path="/beer/{beerId}/review/{reviewId}/2", method =RequestMethod.POST)
    public String uploadImage(MultipartFile file, HttpServletRequest request, @Valid @ModelAttribute Brewery brewery,
                              @PathVariable String beerId, @PathVariable String reviewId) {
        int currentId = beerReviewDAO.getNextId();
        String fileName = "";

        if(file != null && !file.isEmpty()) {
            try {
                //come up with a file name first
                String defaultFileName = "review_" + currentId;


                //save the file with the chosen name
                fileName = uploadProvider.uploadFile( file, defaultFileName );

                // save to database
                beerReviewDAO.insertImage(Integer.parseInt(reviewId), fileName);
            }
            catch(Throwable ex) {}
        }
        return "redirect:/beer/" + beerId;
    }

    @RequestMapping(value = "/beer/{beerId}/review/{reviewId}/response")
    public String reviewResponse(@PathVariable int beerId, @PathVariable int reviewId,
                                 @RequestParam("response") String response) {

        beerReviewDAO.insertResponse(reviewId, response);
        return "redirect:/beer/" + beerId;
    }
}
