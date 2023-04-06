package com.my.tour.service;

import java.util.List;

import com.my.tour.domain.Reservation;
import com.my.tour.domain.Term;
import com.my.tour.domain.Tour;

public interface ReservationService {
	List<Reservation> getReservations(String userId);
	void addReservation(int chargePrice, String userId, int tourNum);
	List<Tour> getTour(int tourNum);
	List<Tour> getTours();
	Term getTerm(int tourNum);
}
