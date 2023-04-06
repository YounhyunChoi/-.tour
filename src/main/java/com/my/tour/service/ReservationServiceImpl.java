package com.my.tour.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.my.tour.dao.ReservationDao;
import com.my.tour.dao.TermDao;
import com.my.tour.dao.TourDao;
import com.my.tour.domain.Reservation;
import com.my.tour.domain.Term;
import com.my.tour.domain.Tour;

@Service
public class ReservationServiceImpl implements ReservationService{
	@Autowired private ReservationDao reservationDao;
	@Autowired private TourDao tourDao;
	@Autowired private TermDao termDao;
	
	@Override
	public List<Reservation> getReservations(String userId){
		return reservationDao.selectReservations(userId);
	}
	
	@Override
	public List<Tour> getTour(int tourNum){
		return tourDao.selectTour(tourNum);
	}
	
	@Override
	public Term getTerm(int tourNum) {
		return termDao.selectTerm(tourNum);
	}
	
	@Override
	public void addReservation(int chargePrice, String userId, int tourNum) {
		reservationDao.insertReservation(chargePrice, userId, tourNum);
	}
}
