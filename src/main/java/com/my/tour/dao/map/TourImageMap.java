package com.my.tour.dao.map;

import java.util.List;

import com.my.tour.domain.TourImage;

public interface TourImageMap {
	List<TourImage> selectTourImages();
	int insertTourImage(String tourImageName, int tourNum);
}
