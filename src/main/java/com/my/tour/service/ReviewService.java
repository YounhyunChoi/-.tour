package com.my.tour.service;

import java.util.List;

import com.my.tour.domain.Reservation;
import com.my.tour.domain.Review;
import com.my.tour.domain.ReviewDto;
import com.my.tour.domain.ReviewImage;
import com.my.tour.domain.Tour;

public interface ReviewService {
	List<Review> getReviews();
	List<Review> getReviews(int resvNum);
	List<ReviewDto> getReview(int reviewNum);
	List<ReviewDto> getMyReviews(String userId);
	List<ReviewDto> getMyReview(String userId, int tourNum);
	List<ReviewImage> getReviewImages(int reviewNum);
	List<Reservation> getReservations(String userId);
	List<Tour> getTour(int tourNum);
	int addReview(String reviewTitle, String reviewContent, double score,
				String userId, int tourNum, int resvNum);
	int addReviewImage(String reviewImageName, int reviewNum);
	int delReviewImage(int reviewNum);
	int fixReview(String reviewTitle, String reviewContent, double score);
	int delReview(int reviewNum);
}
