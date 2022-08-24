package com.techelevator.model.dao;

import com.techelevator.model.dto.BeerReview;

import javax.sound.sampled.ReverbType;
import java.util.List;

public interface BeerReviewDAO {

    List<BeerReview> getReviewsByBeerId (int beerId);
    BeerReview getReviewById (int id);
    void createNewReview(int beerId, int userId, int rating, String review, String reviewTitle);
    List<String> getReviewImages(int id);
    int getNextId();
    void insertImage(int reviewId, String image);
    List<String> getReviewResponses(int id);
    void insertResponse(int reviewId, String response);
}
