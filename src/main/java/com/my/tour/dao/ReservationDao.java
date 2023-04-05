package com.my.tour.dao;

import java.util.List;

import com.my.tour.domain.Reservation;

public interface ReservationDao {
	List<Reservation> selectReservations();
	void insertReservation(String userId, int tourNum, int chargeNum);
}
