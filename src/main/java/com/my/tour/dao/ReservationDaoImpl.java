package com.my.tour.dao;

import java.time.LocalDate;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.my.tour.dao.map.ReservationMap;
import com.my.tour.domain.Reservation;

@Repository
public class ReservationDaoImpl implements ReservationDao{
	@Autowired private ReservationMap reservationMap;
	
	@Override
	public List<Reservation> selectReservations(){
		return reservationMap.selectReservations();
	}
	
	@Override
	public void insertReservation(LocalDate resvDate, String userId, int tourNum) {
		 reservationMap.insertReservation(resvDate, userId, tourNum);
	}
}