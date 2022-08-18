package com.techelevator.controller;

import com.techelevator.model.dao.BeerDAO;
import com.techelevator.model.dao.BeerReviewDAO;
import com.techelevator.model.dto.Beer;
import com.techelevator.model.dto.BeerReview;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;
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
    public String getBeerInfoPage(@PathVariable("beerId") int id, HttpServletRequest request) {

        Beer beer = beerDAO.getBeerById(id);
        request.setAttribute("beer", beer);

        List<BeerReview> reviewList = beerReviewDAO.getReviewsByBeerId(id);
        request.setAttribute("reviews", reviewList);

        return "beerInfoPage";
    }
}
