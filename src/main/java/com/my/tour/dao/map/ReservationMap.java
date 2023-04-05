package com.my.tour.dao.map;

import java.util.List;

import com.my.tour.domain.Reservation;

public interface ReservationMap {
	List<Reservation> selectReservations();
	
	int insertReservation(String userId, int tourNum, int chargeNum);
	
}
