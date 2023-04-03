package com.my.tour.service;

import java.time.LocalDate;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.my.tour.dao.ReservationDao;
import com.my.tour.domain.Reservation;

@Service
public class ReservationServiceImpl implements ReservationService{
	@Autowired private ReservationDao reservationDao;
	
	@Override
	public List<Reservation> getReservations(){
		return reservationDao.selectReservations();
	}
	
	
	@Override
	public int addReservation(int resvNum, LocalDate resvDate) {
		return reservationDao.insertReservation(resvNum, resvDate);
	}
}
