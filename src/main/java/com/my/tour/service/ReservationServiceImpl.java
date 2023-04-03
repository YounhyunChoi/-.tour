package com.my.tour.service;

import java.time.LocalDate;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.my.tour.dao.ReservationDao;
import com.my.tour.dao.TourDao;
import com.my.tour.domain.Reservation;
import com.my.tour.domain.Tour;

@Service
public class ReservationServiceImpl implements ReservationService{
	@Autowired private ReservationDao reservationDao;
	@Autowired private TourDao tourDao;
	
	@Override
	public List<Reservation> getReservations(){
		return reservationDao.selectReservations();
	}
	
	@Override
	public List<Tour> getTours(){
		return tourDao.selectTours();
	}
	
	@Override
	public void addReservation(LocalDate resvDate, String userId, int tourNum) {
		reservationDao.insertReservation(resvDate, userId, tourNum);
	}
}
