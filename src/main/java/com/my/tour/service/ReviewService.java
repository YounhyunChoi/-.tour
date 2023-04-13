package com.my.tour.service;

import java.util.List;

import com.my.tour.domain.Reservation;
import com.my.tour.domain.Review;
import com.my.tour.domain.ReviewDto;
import com.my.tour.domain.ReviewImage;
import com.my.tour.domain.Tour;

public interface ReviewService {
	List<Review> getReviews();
	List<Review> getReview(int reviewNum);
	List<ReviewDto> getMyReviews(String userId);
	List<ReviewImage> getReviewImages(int reviewNum);
	List<Reservation> getReservations(String userId);
	List<Tour> getTour(int tourNum);
	int addReview(String reviewTitle, String reviewContent, double score);
	int addReviewImage(String reviewImageName, int reviewNum);
	int delReviewImage(int reviewNum);
	int fixReview(String reviewTitle, String reviewContent, double score);
	int delReview(int reviewNum);
}
