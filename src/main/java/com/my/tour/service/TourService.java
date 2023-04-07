package com.my.tour.service;

import java.time.LocalDate;
import java.util.List;

import com.my.tour.domain.Tour;

public interface TourService {
	List<Tour> getTours();
	List<Tour> getTour(int tourNum);
	void addTour(String tourName, String tourContent, LocalDate tourSDate, LocalDate tourEDate, int tourPrice, String adminId, int termNum);
	void fixTour(Tour tour);
	void delTour(int tourId);
}
