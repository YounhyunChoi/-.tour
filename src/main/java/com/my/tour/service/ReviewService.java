package com.my.tour.service;

import java.util.List;

import com.my.tour.domain.Review;
import com.my.tour.domain.ReviewDto;
import com.my.tour.domain.ReviewImage;

public interface ReviewService {
	List<Review> getReviews();
	List<ReviewDto> getMyReviews(String userId);
	List<ReviewImage> getReviewImage(int reviewNum);
	String getTourName(int tourNum);
	int addReview(String reviewTitle, String reviewContent, int score);
	int fixReview(String reviewTitle, String reviewContent, int score);
	int delReview(int reviewNum);
}
