package com.my.tour.dao;

import java.util.List;

import com.my.tour.domain.Tour;

public interface TourDao {
	List<Tour> selectTours();
}
