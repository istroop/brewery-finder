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
        String sqlSearchForReview ="SELECT br.id as id, beer_id, user_id, user_name, rating, review " +
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
            thisReview.setRating(review.getDouble("rating"));
            thisReview.setReview(review.getString("review"));
        }

        return thisReview;
    }
}
