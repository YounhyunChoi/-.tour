package com.my.tour.service;

import java.time.LocalDate;
import java.util.List;

import com.my.tour.domain.Reservation;
import com.my.tour.domain.ReservationDto;
import com.my.tour.domain.Term;
import com.my.tour.domain.Tour;

public interface ReservationService {
	List<Reservation> getReservations(String userId);
	List<ReservationDto> getResvsWithTour(String userId);
	void addReservation(int chargePrice,String userId, int tourNum, LocalDate resvEDate);
	void fixReservation(int resvNum);
	void delReservation(int resvNum, String userId);
	List<Tour> getTour(int tourNum);
	Term getTerm(int tourNum);
}
