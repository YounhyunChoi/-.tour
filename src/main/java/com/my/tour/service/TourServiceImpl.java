package com.my.tour.service;

import java.time.LocalDate;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.my.tour.dao.TourDao;
import com.my.tour.domain.Tour;

@Service("TourService")
public class TourServiceImpl implements TourService {
	@Autowired private TourDao tourDao;

	@Override
	public List<Tour> getTours() {
		return tourDao.selectTours();
	}
	
	@Override
	public List<Tour> getTour(int tourNum) {
		return tourDao.selectTour(tourNum);
	}

	@Override
	public void addTour(String tourName, String tourContent, LocalDate tourSDate, LocalDate tourEDate,
			int tourPrice, String adminId, int termNum) {
		tourDao.insertTour(tourName, tourContent, tourSDate, tourEDate, tourPrice, adminId, termNum);
	}

	@Override
	public void fixTour(Tour tour) {
		tourDao.updateTour(tour);
	}

	@Override
	public void delTour(int tourId) {
		tourDao.deleteTour(tourId);
	}
}
