package com.techelevator.controller;

import com.techelevator.model.dao.BeerDAO;
import com.techelevator.model.dao.BeerReviewDAO;
import com.techelevator.model.dto.Beer;
import com.techelevator.model.dto.BeerReview;
import com.techelevator.model.dto.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;
import java.util.List;

@Controller
public class BeerInfoPageController {

    private BeerDAO beerDAO;
    private BeerReviewDAO beerReviewDAO;

    @Autowired
    public BeerInfoPageController(BeerDAO beerDAO, BeerReviewDAO beerReviewDAO) {
        this.beerDAO = beerDAO;
        this.beerReviewDAO = beerReviewDAO;
    }

    @RequestMapping("/beer/{beerId}")
    public String getBeerInfoPage(@SessionAttribute User currentUser, @PathVariable("beerId") int id, HttpServletRequest request) {

        Beer beer = beerDAO.getBeerById(id);
        request.setAttribute("beer", beer);

        List<BeerReview> reviewList = beerReviewDAO.getReviewsByBeerId(id);
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
    public String displayNewBreweryForm(@PathVariable("beerId") int id, ModelMap modelHolder) {

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

    @RequestMapping("beer/{beerId}/delete")
    public String deleteBeer(@PathVariable("beerId") int id) {
        beerDAO.makeBeerInactive(id);

        return "redirect:/breweryList";
    }


}
