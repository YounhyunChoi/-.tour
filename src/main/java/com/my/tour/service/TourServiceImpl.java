package com.my.tour.service;

import java.time.LocalDate;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.my.tour.dao.TourDao;
import com.my.tour.dao.TourImageDao;
import com.my.tour.domain.Tour;
import com.my.tour.domain.TourDto;
import com.my.tour.domain.TourImage;

@Service("TourService")
public class TourServiceImpl implements TourService {
	@Autowired private TourDao tourDao;
	@Autowired private TourImageDao tourImageDao;

	@Override
	public List<Tour> getTours() {
		return tourDao.selectTours();
	}
	
	@Override
	public List<Tour> getAllTours() {
		return tourDao.selectAllTours();
	}
	
	@Override
	public List<Tour> getTour(int tourNum) {
		return tourDao.selectTour(tourNum);
	}
	
	@Override
	public List<TourDto> getTourList() {
		return tourDao.selectTourList();
	}

	@Override
	public void addTourTemp(int tourTempNum, String adminId) {
		tourDao.insertTourTemp(tourTempNum, adminId);
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
	public void delTour(int tourNum) {
		tourDao.deleteTour(tourNum);
	}

	@Override
	public List<TourImage> getTourImages(int tourNum) {
		return tourImageDao.selectTourImages(tourNum);
	}

	@Override
	public int addTourImage(String tourImageName, int tourNum) {
		return tourImageDao.insertTourImage(tourImageName, tourNum);
	}

	@Override
	public int delTourImage(int tourNum) {
		return tourImageDao.deleteTourImage(tourNum);
	}
}
