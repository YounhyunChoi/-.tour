package com.my.tour.dao;



import java.time.LocalDate;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.my.tour.dao.map.ReservationMap;
import com.my.tour.domain.Reservation;
import com.my.tour.domain.ReservationDto;

@Repository
public class ReservationDaoImpl implements ReservationDao{
	@Autowired private ReservationMap reservationMap;
	
	@Override
	public List<Reservation> selectReservations(String userId){
		return reservationMap.selectReservations(userId);
	}
	
	@Override
	public List<ReservationDto> selectResvsWithTour(String userId){
		return reservationMap.selectResvsWithTour(userId);
	}
	
	@Override
	public void insertReservation(int chargePrice,String userId, int tourNum, LocalDate resvEDate) {
		 reservationMap.insertReservation(chargePrice, userId, tourNum, resvEDate);
	}
	
	@Override
	public void updateReservation(int resvNum) {
		reservationMap.updateReservation(resvNum);
	}
	
	@Override
	public void deleteReservation(int resvNum, String userId) {
		reservationMap.deleteReservation(resvNum, userId);
	}
}
