package com.my.tour.dao.map;

import java.time.LocalDate;
import java.util.List;

import com.my.tour.domain.Reservation;

public interface ReservationMap {
	List<Reservation> selectReservations();
	int insertReservation(LocalDate resvDate, String userId, int tourNum);
	
}
