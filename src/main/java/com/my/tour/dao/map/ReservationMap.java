package com.my.tour.dao.map;


import java.time.LocalDate;
import java.util.List;

import com.my.tour.domain.Reservation;
import com.my.tour.domain.ReservationDto;

public interface ReservationMap {
	List<Reservation> selectReservations(String userId);
	List<ReservationDto> selectResvsWithTour(String userId);
	int insertReservation(int chargePrice, String userId, int tourNum, LocalDate resvEDate);
	int updateReservation(int resvNum);
	int deleteReservation(int resvNum, String userId);
}
