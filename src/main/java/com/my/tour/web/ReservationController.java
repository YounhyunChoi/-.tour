package com.my.tour.web;


import java.time.LocalDate;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import com.my.tour.domain.Reservation;
import com.my.tour.domain.Tour;
import com.my.tour.service.ReservationService;

import jakarta.servlet.http.HttpSession;


@RestController
@RequestMapping("reservation")
public class ReservationController {
	@Autowired private ReservationService reservationService;
	
	@GetMapping("get")
	public List<Reservation> getReservations(HttpSession session) {
		return reservationService.getReservations((String)session.getAttribute("userId"));
	}
	
	@GetMapping("adminGet")
	public List<Reservation> getReservations(String userId) {
		return reservationService.getReservations(userId);
	}
	
	@GetMapping("tours")
	public List<Tour> getTours(){
		return reservationService.getTours();
	}
	
	@GetMapping("list")
	public ModelAndView reservationList(ModelAndView mv) {
		mv.setViewName("reservation/reservationList");
		return mv;
	}
	
	@GetMapping("add")
	public ModelAndView addReservation(ModelAndView mv, int tourNum) {
		Tour tour = reservationService.getTour(tourNum).get(0);
		mv.setViewName("reservation/addReservation");
		mv.addObject("tour", tour);
		mv.addObject("term", reservationService.getTerm(tour.getTermNum()));
		return mv;
	}
	
	@PostMapping("add")
	public void addReservation(int chargePrice, LocalDate resvDate, String whetherToCancel, HttpSession session, int tourNum) {
		resvDate = LocalDate.now();
		whetherToCancel = "N";
		reservationService.addReservation(chargePrice, resvDate, whetherToCancel, (String)session.getAttribute("userId"), tourNum);
	}
	
	@GetMapping("del")
	public ModelAndView delReservation(ModelAndView mv) {
		mv.setViewName("admin/reservation/delReservation");
		return mv;
	}
	
	@DeleteMapping("del")
	public void delReservation(int resvNum, String userId) {
		reservationService.delReservation(resvNum, userId);
	}
}
