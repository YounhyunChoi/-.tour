package com.my.tour.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.my.tour.dao.ReviewDao;
import com.my.tour.domain.Review;

@Service
public class ReviewServiceImpl implements ReviewService {
	@Autowired private ReviewDao reviewDao;
	
	@Override
	public List<Review> getReviews() {
		return reviewDao.selectReviews();
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
