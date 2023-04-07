package com.my.tour.dao.map;

import java.util.List;

import com.my.tour.domain.Review;
import com.my.tour.domain.ReviewDto;

public interface ReviewMap {
	List<Review> selectReviews();
	List<ReviewDto> selectMyReviews(String userId);
	int insertReview(String reviewTitle, String reviewContent, int score);
	int updateReview(String reviewTitle, String reviewContent, int score);
	int deleteReview(int reviewNum);
}
