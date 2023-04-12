package com.my.tour.dao.map;

import java.util.List;

import com.my.tour.domain.Review;
import com.my.tour.domain.ReviewDto;

public interface ReviewMap {
	List<Review> selectReviews();
	List<ReviewDto> selectMyReviews(String userId);
	List<ReviewDto> selectMyReview(String userId, int tourNum);
	int insertReview(String reviewTitle, String reviewContent, double score,
					String userId, int tourNum);
	int updateReview(String reviewTitle, String reviewContent, double score);
	int deleteReview(int reviewNum);
}
