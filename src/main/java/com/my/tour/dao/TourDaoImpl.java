package com.my.tour.dao;

import java.time.LocalDate;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.my.tour.dao.map.TourMap;
import com.my.tour.domain.Tour;

@Repository("TourDao")
public class TourDaoImpl implements TourDao {
	@Autowired private TourMap tourMap;

	@Override
	public List<Tour> selectTours() {
		return tourMap.selectTours();
	}
	
	@Override
	public List<Tour> selectTour(int tourNum) {
		return tourMap.selectTour(tourNum);
	}

	@Override
	public void insertTour(String tourName, String tourContent, LocalDate tourSDate, LocalDate tourEDate,
			int tourPrice, String adminId, int termNum) {
		tourMap.insertTour(tourName, tourContent, tourSDate, tourEDate, tourPrice, adminId, termNum);
	}

	@Override
	public void updateTour(Tour tour) {
		tourMap.updateTour(tour);
	}

	@Override
	public void deleteTour(int tourId) {
		tourMap.deleteTour(tourId);
	}
}
