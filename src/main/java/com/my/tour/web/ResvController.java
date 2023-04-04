package com.my.tour.web;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import com.my.tour.domain.Reservation;
import com.my.tour.domain.Tour;
import com.my.tour.service.ReservationService;


@RestController
@RequestMapping("reservation")
public class ResvController {
	@Autowired private ReservationService reservationService;
	
	
	
	@GetMapping("get")
	public List<Reservation> getReservations() {
		return reservationService.getReservations();
	}
	
	@GetMapping("getTours")
	public List<Tour> getTours() {
		return reservationService.getTours();
	}
	
	@GetMapping("getTour")
	public List<Tour> getTour() {
		return reservationService.getTour();
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
	
	
	
	
}
