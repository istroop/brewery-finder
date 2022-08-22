package com.techelevator.model.dao.jdbc;

import com.techelevator.model.dao.BeerReviewDAO;
import com.techelevator.model.dto.Beer;
import com.techelevator.model.dto.BeerReview;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.support.rowset.SqlRowSet;
import org.springframework.stereotype.Component;

import javax.sql.DataSource;
import java.util.ArrayList;
import java.util.List;

@Component
public class JDBCBeerReviewDAO implements BeerReviewDAO {

    private JdbcTemplate jdbcTemplate;

    @Autowired
    public JDBCBeerReviewDAO(DataSource dataSource) {
        jdbcTemplate = new JdbcTemplate(dataSource);
    }

    @Override
    public List<BeerReview> getReviewsByBeerId(int beerId) {
        String sqlSearchForReviews = "SELECT id FROM beer_review WHERE beer_id = ?";

        SqlRowSet reviewSet = jdbcTemplate.queryForRowSet(sqlSearchForReviews, beerId);
        List<BeerReview> reviews = new ArrayList<>();

        while (reviewSet.next()) {
            BeerReview review = getReviewById(reviewSet.getInt("id"));
            reviews.add(review);
        }

        return reviews;
    }

    @Override
    public BeerReview getReviewById(int id) {
        String sqlSearchForReview ="SELECT br.id as id, beer_id, user_id, user_name, rating, review, review_title " +
                "FROM beer_review br JOIN app_user au on au.id = br.user_id "+
                "WHERE br.id = ? ";

        SqlRowSet review = jdbcTemplate.queryForRowSet(sqlSearchForReview, id);
        BeerReview thisReview = null;
        if(review.next()) {
            thisReview = new BeerReview();
            thisReview.setId(review.getInt("id"));
            thisReview.setBeerId(review.getInt("beer_id"));
            thisReview.setUserId(review.getInt("user_id"));
            thisReview.setUsername(review.getString("user_name"));
            thisReview.setRating(review.getInt("rating"));
            thisReview.setReview(review.getString("review"));
            thisReview.setReviewTitle(review.getString("review_title"));
        }

        return thisReview;
    }

    public void createNewReview(int beerId, int userId, int rating, String review,
                                String reviewTitle) {


        String sql = "INSERT INTO beer_review (beer_id, user_id, rating, review, review_title)" +
                "VALUES (?,?,?,?,?)";
        jdbcTemplate.update(sql, beerId, userId, rating, review, reviewTitle);
    }

    @Override
    public List<String> getReviewImages(int id) {
        String sql = "SELECT image FROM beer_review_images WHERE beer_review_id = ?";
        SqlRowSet output = jdbcTemplate.queryForRowSet(sql, id);
        List<String> imageList = new ArrayList<>();

        while (output.next()) {
            imageList.add(output.getString("image"));
        }
        return imageList;
    }

    @Override
    public int getNextId() {
        SqlRowSet output = jdbcTemplate.queryForRowSet("SELECT max(id) as id from beer_review_images");
        if(output.next()) {
            return output.getInt("id") + 1;
        }
        else return -1;
    }

    @Override
    public void insertImage(int reviewId, String image) {
        jdbcTemplate.update("INSERT INTO beer_review_images (beer_review_id, image) VALUES (?, ?)", reviewId, image);
    }

}
