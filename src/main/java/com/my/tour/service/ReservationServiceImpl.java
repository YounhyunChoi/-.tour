package com.my.tour.service;

import java.time.LocalDate;
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
	public void addReservation(int chargePrice, LocalDate resvDate, String whetherToCancel, String userId, int tourNum) {
		reservationDao.insertReservation(chargePrice, resvDate, whetherToCancel, userId, tourNum);
	}
	
	@Override
	public void fixReservation(int resvNum, String whetherToCancel) {
		reservationDao.updateReservation(resvNum, whetherToCancel);
	}
	@Override
	public void delReservation(int resvNum, String userId) {
		reservationDao.deleteReservation(resvNum, userId);
	}
	
	@Override
	public List<Tour> getTour(int tourNum){
		return tourDao.selectTour(tourNum);
	}
	
	@Override
	public 	List<Tour> getTours(){
		return tourDao.selectTours();
	}

	@Override
	public Term getTerm(int tourNum) {
		return termDao.selectTerm(tourNum);
	}
	
}
