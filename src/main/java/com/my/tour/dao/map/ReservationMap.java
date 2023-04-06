package com.my.tour.dao.map;

import java.util.List;

import com.my.tour.domain.Reservation;
import com.my.tour.domain.Tour;

public interface ReservationMap {
	List<Reservation> selectReservations(String userId);
	int insertReservation(int chargePrice, String userId, int tourNum);
	List<Tour> getTour(int tourNum);
}
