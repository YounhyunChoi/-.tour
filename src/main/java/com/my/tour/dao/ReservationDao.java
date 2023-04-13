package com.my.tour.dao;

import java.time.LocalDate;
import java.util.List;

import com.my.tour.domain.Reservation;
import com.my.tour.domain.ReservationDto;

public interface ReservationDao {
	List<Reservation> selectReservations(String userId);
	List<ReservationDto> selectResvsWithTour(String userId);
	void insertReservation(int chargePrice,String userId, int tourNum, LocalDate resvEDate);
	void updateReservation(int resvNum);
	void deleteReservation(int resvNum, String userId);
}
