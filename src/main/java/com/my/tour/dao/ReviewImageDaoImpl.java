package com.my.tour.dao;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.my.tour.dao.map.ReviewImageMap;
import com.my.tour.domain.ReviewImage;

@Repository
public class ReviewImageDaoImpl implements ReviewImageDao {
	@Autowired ReviewImageMap reviewImageMap;

	@Override
	public List<ReviewImage> selectReviewImages(int reviewNum) {
		return reviewImageMap.selectReviewImages(reviewNum);
	}
	
	@Override
	public List<ReviewImage> selectReviewImage(int reviewNum) {
		return reviewImageMap.selectReviewImages(reviewNum);
	}

	@Override
	public int insertReviewImage(String reviewImageName, int reviewNum) {
		return reviewImageMap.insertReviewImage(reviewImageName, reviewNum);
	}

	@Override
	public int deleteReviewImage(int reviewNum) {
		return reviewImageMap.deleteReviewImage(reviewNum);
	}
}
