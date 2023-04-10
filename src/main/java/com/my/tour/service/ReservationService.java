package com.my.tour.service;

import java.time.LocalDate;
import java.util.List;

import com.my.tour.domain.Reservation;
import com.my.tour.domain.Term;
import com.my.tour.domain.Tour;

public interface ReservationService {
	List<Reservation> getReservations(String userId);
	void addReservation(int chargePrice, LocalDate resvDate, String whetherToCancel, String userId, int tourNum);
	void delReservation(int resvNum, String userId);
	List<Tour> getTour(int tourNum);
	List<Tour> getTours();
	Term getTerm(int tourNum);
}
