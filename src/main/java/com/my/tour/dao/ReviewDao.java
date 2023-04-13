package com.my.tour.dao;

import java.util.List;

import com.my.tour.domain.Review;
import com.my.tour.domain.ReviewDto;

public interface ReviewDao {
	List<Review> selectReviews();
	List<Review> selectReview(int reviewNum);
	List<ReviewDto> selectMyReviews(String userId);
	int insertReview(String reviewTitle, String reviewContent, double score);
	int updateReview(String reviewTitle, String reviewContent, double score);
	int deleteReview(int reviewNum);
}
