package com.my.tour.service;

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
}
