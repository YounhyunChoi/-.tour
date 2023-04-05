package com.my.tour.dao;


import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.my.tour.dao.map.ReservationMap;
import com.my.tour.domain.Reservation;

@Repository
public class ReservationDaoImpl implements ReservationDao{
	@Autowired private ReservationMap reservationMap;
	
	@Override
	public List<Reservation> selectReservations(String userId){
		return reservationMap.selectReservations(userId);
	}
	
	@Override
	public void insertReservation(String userId, int tourNum, int chargeNum) {
		 reservationMap.insertReservation(userId, tourNum, chargeNum);
	}
}
