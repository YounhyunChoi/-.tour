package com.my.tour.dao;

import java.util.List;

import com.my.tour.domain.TourImage;

public interface TourImageDao {
	List<TourImage> selectTourImages(int tourNum);
	int insertTourImage(String tourImageName, int tourNum);
	void deleteTourImage(int tourNum);
}
