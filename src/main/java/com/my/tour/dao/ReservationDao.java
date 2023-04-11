package com.my.tour.dao;

import java.time.LocalDate;
import java.util.List;

import com.my.tour.domain.Reservation;

public interface ReservationDao {
	List<Reservation> selectReservations(String userId);
	void insertReservation(int chargePrice, LocalDate resvDate, String whetherToCancel, String userId, int tourNum);
	void updateReservation(int resvNum, String whetherToCancel);
	void deleteReservation(int resvNum, String userId);
}
