package com.my.tour.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.my.tour.dao.ReservationDao;
import com.my.tour.dao.ReviewDao;
import com.my.tour.dao.ReviewImageDao;
import com.my.tour.dao.TourDao;
import com.my.tour.domain.Reservation;
import com.my.tour.domain.Review;
import com.my.tour.domain.ReviewDto;
import com.my.tour.domain.ReviewImage;
import com.my.tour.domain.Tour;

@Service
public class ReviewServiceImpl implements ReviewService {
	@Autowired private ReviewDao reviewDao;
	@Autowired private ReviewImageDao reviewImageDao;
	@Autowired private TourDao tourDao;
	@Autowired private ReservationDao reservationDao;
	
	@Override
	public List<Review> getReviews() {
		return reviewDao.selectReviews();
	}

	@Override
	public List<ReviewDto> getMyReviews(String userId) {
		return reviewDao.selectMyReviews(userId);
	}

	@Override
	public List<ReviewDto> getMyReview(String userId, int tourNum) {
		return reviewDao.selectMyReview(userId, tourNum);
	}
	
	@Override
	public List<ReviewImage> getReviewImage(int reivewNum) {
		return reviewImageDao.selectReviewImage(reivewNum);
	}

	@Override
	public List<Reservation> getReservations(String userId) {
		return reservationDao.selectReservations(userId);
	}

	@Override
	public List<Tour> getTour(int tourNum) {
		return tourDao.selectTour(tourNum);
	}
	
	@Override
	public int addReview(String reviewTitle, String reviewContent, double score,
						String userId, int tourNum) {
		return reviewDao.insertReview(reviewTitle, reviewContent, score, userId, tourNum);
	}

	@Override
	public int addReviewImage(String reviewImageName, int reviewNum) {
		return reviewImageDao.insertReviewImage(reviewImageName, reviewNum);
	}
	
	@Override
	public int delReviewImage(int reviewNum) {
		return reviewImageDao.deleteReviewImage(reviewNum);
	}
	
	@Override
	public int fixReview(String reviewTitle, String reviewContent, double score) {
		return reviewDao.updateReview(reviewTitle, reviewContent, score);
	}
	
	@Override
	public int delReview(int reviewNum) {
		return reviewDao.deleteReview(reviewNum);
	}
}
