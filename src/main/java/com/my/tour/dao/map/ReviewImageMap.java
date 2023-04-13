package com.my.tour.dao.map;

import java.util.List;

import com.my.tour.domain.ReviewImage;

public interface ReviewImageMap {
	List<ReviewImage> selectReviewImages(int reviewNum);
	int insertReviewImage(String reviewImageName, int reviewNum);
	int deleteReviewImage(int reviewNum);
}
