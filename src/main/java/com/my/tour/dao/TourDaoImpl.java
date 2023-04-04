package com.my.tour.dao;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.my.tour.dao.map.TourMap;
import com.my.tour.domain.Tour;

@Repository("TourDao")
public class TourDaoImpl implements TourDao {
	@Autowired
	private TourMap tourMap;

	@Override
	public List<Tour> selectTours() {
		return tourMap.selectTours();
	}
	
	@Override
	public List<Tour> selectTour() {
		return tourMap.selectTour();
	}
}
