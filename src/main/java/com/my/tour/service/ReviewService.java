package com.my.tour.service;

import java.util.List;

import com.my.tour.domain.Review;

public interface ReviewService {
	List<Review> getReviews();
	int addReview(String reviewTitle, String reviewContent, int score);
	int fixReview(String reviewTitle, String reviewContent, int score);
	int delReview(int reviewNum);
}
