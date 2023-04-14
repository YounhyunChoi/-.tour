package com.my.tour.dao;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.my.tour.dao.map.TourImageMap;
import com.my.tour.domain.TourImage;

@Repository
public class TourImageDaoImpl implements TourImageDao {
	@Autowired private TourImageMap tourImageMap;
	
	@Override
	public List<TourImage> selectTourImages(int tourNum) {
		return tourImageMap.selectTourImages(tourNum);
	}

	@Override
	public int insertTourImage(String tourImageName, int tourNum) {
		return tourImageMap.insertTourImage(tourImageName, tourNum);
	}

	@Override
	public void deleteTourImage(int tourNum) {
		tourImageMap.deleteTourImage(tourNum);
	}
}
