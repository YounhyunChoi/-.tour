package com.my.tour.dao;

import java.util.List;

import com.my.tour.domain.Review;
import com.my.tour.domain.ReviewDto;

public interface ReviewDao {
	List<Review> selectReviews();
	List<ReviewDto> selectMyReviews(String userId);
	int insertReview(String reviewTitle, String reviewContent, int score);
	int updateReview(String reviewTitle, String reviewContent, int score);
	int deleteReview(int reviewNum);
}
