package com.my.tour.web;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
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
public class ResvController {
	@Autowired private ReservationService reservationService;
	
	
	
	@GetMapping("get")
	public List<Reservation> getReservations(HttpSession session) {
		return reservationService.getReservations((String)session.getAttribute("userId"));
	}
	
	@GetMapping("getTours")
	public List<Tour> getTours() {
		return reservationService.getTours();
	}
	
	@GetMapping("getTour")
	public List<Tour> getTour(int tourNum) {
		return reservationService.getTour(tourNum);
	}
	
	@GetMapping("list")
	public ModelAndView ResvList(ModelAndView mv) {
		mv.setViewName("reservation/reservationList");
		return mv;
	}
	
	@GetMapping("add")
	public ModelAndView addReservation(ModelAndView mv) {
		mv.setViewName("reservation/addReservation");
		return mv;
	}
	
	@PostMapping("add")
	public void addReservation(HttpSession session, int tourNum, int chargeNum) {
		reservationService.addReservation((String)session.getAttribute("userId"), tourNum, chargeNum);
	}
}
