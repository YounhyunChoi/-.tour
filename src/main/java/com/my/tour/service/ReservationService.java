package com.my.tour.service;

import java.time.LocalDate;
import java.util.List;

import com.my.tour.domain.Reservation;
import com.my.tour.domain.Tour;

public interface ReservationService {
	List<Reservation> getReservations();
	void addReservation(LocalDate resvDate, String userId, int tourNum);
	List<Tour> getTours();
}
