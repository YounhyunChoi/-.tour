package com.my.tour.service;

import java.time.LocalDate;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.my.tour.dao.ReviewDao;
import com.my.tour.dao.ReviewImageDao;
import com.my.tour.dao.TourDao;
import com.my.tour.dao.TourImageDao;
import com.my.tour.domain.ReviewDto;
import com.my.tour.domain.ReviewImage;
import com.my.tour.domain.Tour;
import com.my.tour.domain.TourDto;
import com.my.tour.domain.TourImage;

@Service("TourService")
public class TourServiceImpl implements TourService {
	@Autowired private TourDao tourDao;
	@Autowired private TourImageDao tourImageDao;
	@Autowired private ReviewDao reviewDao;
	@Autowired private ReviewImageDao reviewImageDao;

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
	public List<ReviewDto> getReview(int tourNum) {
		return reviewDao.selectReviewByTourNum(tourNum);
	}

	@Override
	public List<ReviewImage> getReviewImages(int reviewNum) {
		return reviewImageDao.selectReviewImages(reviewNum);
	}

	@Override
	public void addTourTemp(int tourTempNum, String adminId) {
		tourDao.insertTourTemp(tourTempNum, adminId);
	}
	
	@Override
	public void addTour(String tourName, String tourContent, LocalDate tourSDate, LocalDate tourEDate,
			int tourPrice, int discountPrice, String adminId) {
		tourDao.insertTour(tourName, tourContent, tourSDate, tourEDate, tourPrice, discountPrice, adminId);
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
	public void delTourImage(int tourNum) {
		tourImageDao.deleteTourImage(tourNum);
	}
}
