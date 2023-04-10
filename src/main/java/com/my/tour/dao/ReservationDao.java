package com.my.tour.dao;

import java.util.List;

import com.my.tour.domain.Reservation;

public interface ReservationDao {
	List<Reservation> selectReservations(String userId);
	void insertReservation(int chargePrice, String userId, int tourNum);
	void deleteReservation(int resvNum, String userId);
}
