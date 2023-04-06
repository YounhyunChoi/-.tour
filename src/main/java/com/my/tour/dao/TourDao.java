package com.my.tour.dao;

import java.time.LocalDate;
import java.util.List;

import com.my.tour.domain.Tour;

public interface TourDao {
	List<Tour> selectTours();
	List<Tour> selectTour(int tourNum);
	void insertTour(String tourName, String tourContent, LocalDate tourSDate, LocalDate tourEDate, int tourPrice, String adminId, int termNum);
	void updateTour(Tour tour);
	void deleteTour(int tourId);
}
