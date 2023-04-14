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
	public List<Review> getReviews(int resvNum) {
		return reviewDao.selectReviews(resvNum);
	}

	@Override
	public List<ReviewDto> getReview(int reviewNum) {
		return reviewDao.selectReview(reviewNum);
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
	public List<ReviewImage> getReviewImages(int reivewNum) {
		return reviewImageDao.selectReviewImages(reivewNum);
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
	public void addReview(String reviewTitle, String reviewContent, double score,
						String userId, int tourNum, int resvNum) {
		reviewDao.insertReview(reviewTitle, reviewContent, score, userId, tourNum, resvNum);
	}

	@Override
	public void addReviewImage(String reviewImageName, int reviewNum) {
		reviewImageDao.insertReviewImage(reviewImageName, reviewNum);
	}
	
	@Override
	public void delReviewImage(int reviewNum) {
		reviewImageDao.deleteReviewImage(reviewNum);
	}
	
	@Override
	public void fixReview(String reviewTitle, String reviewContent, double score) {
		reviewDao.updateReview(reviewTitle, reviewContent, score);
	}
	
	@Override
	public void delReview(int reviewNum) {
		reviewDao.deleteReview(reviewNum);
	}
}
