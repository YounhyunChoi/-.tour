package com.my.tour.service;

import java.time.LocalDate;
import java.util.List;

import com.my.tour.domain.ReviewDto;
import com.my.tour.domain.ReviewImage;
import com.my.tour.domain.Tour;
import com.my.tour.domain.TourDto;
import com.my.tour.domain.TourImage;

public interface TourService {
	List<Tour> getTours();
	List<Tour> getAllTours();
	List<Tour> getTour(int tourNum);
	List<TourDto> getTourList();
	List<ReviewDto> getReview(int tourNum);
	List<ReviewImage> getReviewImages(int reviewNum);
	void addTourTemp(int tourTempNum, String adminId);
	void addTour(String tourName, String tourContent, LocalDate tourSDate, LocalDate tourEDate, int tourPrice, int discountPrice, String adminId);
	void fixTour(Tour tour);
	void delTour(int tourNum);
	List<TourImage> getTourImages(int tourNum);
	int addTourImage(String tourImageName, int tourNum);
	void delTourImage(int tourNum);
}
