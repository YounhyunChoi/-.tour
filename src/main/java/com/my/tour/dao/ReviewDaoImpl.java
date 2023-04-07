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
	public List<ReviewDto> selectMyReviews(String userId) {
		return reviewMap.selectMyReviews(userId);
	}
	
	@Override
	public int insertReview(String reviewTitle, String reviewContent, int score) {
		return reviewMap.insertReview(reviewTitle, reviewContent, score);
	}
	
	@Override
	public int updateReview(String reviewTitle, String reviewContent, int score) {
		return reviewMap.updateReview(reviewTitle, reviewContent, score);
	}
	
	@Override
	public int deleteReview(int reviewNum) {
		return reviewMap.deleteReview(reviewNum);
	}
}
