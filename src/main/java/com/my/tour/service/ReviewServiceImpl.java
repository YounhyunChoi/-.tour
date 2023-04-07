package com.my.tour.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.my.tour.dao.ReviewDao;
import com.my.tour.dao.ReviewImageDao;
import com.my.tour.dao.TourDao;
import com.my.tour.domain.Review;
import com.my.tour.domain.ReviewDto;
import com.my.tour.domain.ReviewImage;

@Service
public class ReviewServiceImpl implements ReviewService {
	@Autowired private ReviewDao reviewDao;
	@Autowired private ReviewImageDao reviewImageDao;
	@Autowired private TourDao tourDao;
	
	@Override
	public List<Review> getReviews() {
		return reviewDao.selectReviews();
	}

	@Override
	public List<ReviewDto> getMyReviews(String userId) {
		return reviewDao.selectMyReviews(userId);
	}
	
	@Override
	public List<ReviewImage> getReviewImage(int reivewNum) {
		return reviewImageDao.selectReviewImage(reivewNum);
	}

	@Override
	public String getTourName(int tourNum) {
		return tourDao.selectTour(tourNum).get(0).getTourName();
	}
	
	@Override
	public int addReview(String reviewTitle, String reviewContent, int score) {
		return reviewDao.insertReview(reviewTitle, reviewContent, score);
	}
	
	@Override
	public int fixReview(String reviewTitle, String reviewContent, int score) {
		return reviewDao.updateReview(reviewTitle, reviewContent, score);
	}
	
	@Override
	public int delReview(int reviewNum) {
		return reviewDao.deleteReview(reviewNum);
	}
}
