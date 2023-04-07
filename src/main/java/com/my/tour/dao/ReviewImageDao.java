package com.my.tour.dao;

import java.util.List;

import com.my.tour.domain.ReviewImage;

public interface ReviewImageDao {
	List<ReviewImage> selectReviewImages(int reviewNum);
	List<ReviewImage> selectReviewImage(int reviewNum);
}
