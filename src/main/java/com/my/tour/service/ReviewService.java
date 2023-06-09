package com.my.tour.service;

import java.util.List;

import com.my.tour.domain.Comment;
import com.my.tour.domain.Reservation;
import com.my.tour.domain.Review;
import com.my.tour.domain.ReviewDto;
import com.my.tour.domain.ReviewImage;
import com.my.tour.domain.Tour;

public interface ReviewService {
	List<Review> getReviews(int resvNum);
	List<ReviewDto> getReviewDtos();
	List<ReviewDto> getReview(int reviewNum);
	List<Comment> getComments(int reviewNum);
	List<ReviewDto> getMyReviews(String userId);
	List<ReviewDto> getMyReview(String userId, int tourNum);
	List<ReviewImage> getReviewImages(int reviewNum);
	List<Reservation> getReservations(String userId);
	List<Tour> getTour(int tourNum);
	void addReview(String reviewTitle, String reviewContent, double score,
				String userId, int tourNum, int resvNum);
	void addReviewImage(String reviewImageName, int reviewNum);
	void delReviewImage(int reviewNum);
	void fixReview(Review reivew);
	void delReview(int reviewNum);
}
