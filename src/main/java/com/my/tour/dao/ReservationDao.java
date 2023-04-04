package com.my.tour.dao;

import java.time.LocalDate;
import java.util.List;

import com.my.tour.domain.Reservation;

public interface ReservationDao {
	List<Reservation> selectReservations();
	void insertReservation(LocalDate resvDate, String userId, int tourNum);
}
