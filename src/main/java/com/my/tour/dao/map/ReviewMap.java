package com.my.tour.dao.map;

import java.util.List;

import com.my.tour.domain.Review;
import com.my.tour.domain.ReviewDto;

public interface ReviewMap {
	List<Review> selectReviews(int resvNum);
	List<ReviewDto> selectReviewDtos();
	List<ReviewDto> selectReviewByReviewNum(int reviewNum);
	List<ReviewDto> selectReviewByTourNum(int tourNum);
	List<ReviewDto> selectMyReviews(String userId);
	List<ReviewDto> selectMyReview(String userId, int tourNum);
	int insertReview(String reviewTitle, String reviewContent, double score,
					String userId, int tourNum, int resvNum);
	int updateReview(Review reivew);
	int deleteReview(int reviewNum);
}
