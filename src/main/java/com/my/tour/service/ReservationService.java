package com.my.tour.service;

import java.time.LocalDate;
import java.util.List;

import com.my.tour.domain.Reservation;
import com.my.tour.domain.Tour;

public interface ReservationService {
	List<Reservation> getReservations();
	int addReservation(int resvNum, LocalDate resvDate);
}
