package com.my.tour.dao;

import java.time.LocalDate;
import java.util.List;

import com.my.tour.domain.Tour;
import com.my.tour.domain.TourDto;

public interface TourDao {
	List<Tour> selectTours();
	List<Tour> selectAllTours();
	List<Tour> selectTour(int tourNum);
	List<TourDto> selectTourList();
	void insertTourTemp(int tourTempNum, String adminId);
	void insertTour(String tourName, String tourContent, LocalDate tourSDate, LocalDate tourEDate, int tourPrice,int discountPrice, String adminId);
	void updateTour(Tour tour);
	void deleteTour(int tourNum);
}
