package com.techelevator.model.dao;

import com.techelevator.model.dto.BeerReview;

import javax.sound.sampled.ReverbType;
import java.util.List;

public interface BeerReviewDAO {

    public List<BeerReview> getReviewsByBeerId (int beerId);
    public BeerReview getReviewById (int id);
}
