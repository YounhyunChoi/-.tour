package com.my.tour.service;

import java.util.List;

import com.my.tour.domain.Reservation;
import com.my.tour.domain.Tour;

public interface ReservationService {
	List<Reservation> getReservations(String userId);
	void addReservation(String userId, int tourNum, int chargeNum);
	List<Tour> getTours();
	List<Tour> getTour(int tourNum);
}
