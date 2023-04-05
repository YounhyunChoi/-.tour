package com.my.tour.dao;

import java.util.List;

import com.my.tour.domain.Review;

public interface ReviewDao {
	List<Review> selectReviews();
	int insertReview(String reviewTitle, String reviewContent, int score);
	int updateReview(String reviewTitle, String reviewContent, int score);
	int deleteReview(int reviewNum);
}
