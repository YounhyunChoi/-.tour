package com.my.tour.dao;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.my.tour.dao.map.ReviewMap;
import com.my.tour.domain.Review;
import com.my.tour.domain.ReviewDto;

@Repository
public class ReviewDaoImpl implements ReviewDao {
	@Autowired private ReviewMap reviewMap;
	
	@Override
	public List<Review> selectReviews() {
		return reviewMap.selectReviews();
	}

	@Override
	public List<Review> selectReviews(int resvNum) {
		return reviewMap.selectReviews(resvNum);
	}
	
	@Override
	public List<ReviewDto> selectReview(int reviewNum) {
		return reviewMap.selectReview(reviewNum);
	}

	@Override
	public List<ReviewDto> selectMyReviews(String userId) {
		return reviewMap.selectMyReviews(userId);
	}

	@Override
	public List<ReviewDto> selectMyReview(String userId, int tourNum) {
		return reviewMap.selectMyReview(userId, tourNum);
	}
	
	@Override
	public void insertReview(String reviewTitle, String reviewContent, double score,
							String userId, int tourNum, int resvNum) {
		reviewMap.insertReview(reviewTitle, reviewContent, score, userId, tourNum, resvNum);
	}
	
	@Override
	public void updateReview(Review reivew) {
		reviewMap.updateReview(reivew);
	}
	
	@Override
	public void deleteReview(int reviewNum) {
		reviewMap.deleteReview(reviewNum);
	}
}
