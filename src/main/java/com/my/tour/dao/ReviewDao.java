package com.my.tour.dao;

import java.util.List;

import com.my.tour.domain.Review;
import com.my.tour.domain.ReviewDto;

public interface ReviewDao {
	List<Review> selectReviews();
	List<Review> selectReviews(int resvNum);
	List<ReviewDto> selectReview(int reviewNum);
	List<ReviewDto> selectMyReviews(String userId);
	List<ReviewDto> selectMyReview(String userId, int tourNum);
	void insertReview(String reviewTitle, String reviewContent, double score,
					String userId, int tourNum, int resvNum);
	void updateReview(Review reivew);
	void deleteReview(int reviewNum);
}
