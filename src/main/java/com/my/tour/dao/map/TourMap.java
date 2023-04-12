package com.my.tour.dao.map;

import java.time.LocalDate;
import java.util.List;

import com.my.tour.domain.Tour;
import com.my.tour.domain.TourDto;

public interface TourMap {
	List<Tour> selectTours();
	List<Tour> selectAllTours();
	List<Tour> selectTour(int tourNum);
	List<TourDto> selectTourList();
	int insertTourTemp(int tourTempNum, String adminId);
	int insertTour(String tourName, String tourContent, LocalDate tourSDate, LocalDate tourEDate, int tourPrice, String adminId, int termNum);
	int updateTour(Tour tour);
	int deleteTour(int tourNum);
}
