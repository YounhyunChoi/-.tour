package com.my.tour.dao.map;

import java.time.LocalDate;
import java.util.List;

import com.my.tour.domain.Reservation;
import com.my.tour.domain.Tour;

public interface ReservationMap {
	List<Reservation> selectReservations(String userId);
	int insertReservation(int chargePrice, LocalDate resvDate, String whetherToCancel, String userId, int tourNum);
	int deleteReservation(int resvNum, String userId);
	List<Tour> getTour(int tourNum);
	
}
