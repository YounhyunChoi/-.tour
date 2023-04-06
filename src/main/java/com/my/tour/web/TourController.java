package com.my.tour.web;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import com.my.tour.AdminAccess;
import com.my.tour.GetAccess;
import com.my.tour.domain.Tour;
import com.my.tour.service.TourService;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;

@RestController("tourController")
@RequestMapping("tour")
public class TourController {
	@Autowired private TourService tourService;
	
	//user
	@GetMapping("get")
	@GetAccess
	public List<Tour> getTours(HttpServletRequest request) {
		return tourService.getTours();
	}
	
	@GetMapping
	public ModelAndView tourList(ModelAndView mv) {
		mv.setViewName("tour/tourList");
		return mv;
	}
	
	@GetMapping("view")
	public ModelAndView tourView(ModelAndView mv, HttpSession session) {
		mv.setViewName("tour/tourView");
		mv.addObject("userId", session.getAttribute("userId"));
		return mv;
	}
	
	//admin
	@PostMapping("adminAdd")
	public void addTour(@RequestBody Tour tour, HttpSession session) {
		tourService.addTour(tour.getTourName(), tour.getTourContent(), 
				tour.getTourSDate(), tour.getTourEDate(), tour.getTourPrice(),
				(String)session.getAttribute("userId"), tour.getTermNum());
	}
	
	@PutMapping("adminFix")
	public void fixTour(@RequestBody Tour tour) {
		tourService.fixTour(tour);
	}
	
	@DeleteMapping("adminDel/{tourId}")
	public void delTour(@PathVariable int tourId) {
		tourService.delTour(tourId);
	}
	
	@GetMapping("adminList")
	@AdminAccess
	public ModelAndView adminTourList(ModelAndView mv, HttpSession session) {
		mv.setViewName("admin/tour/tourList");
		return mv;
	}
	
	@GetMapping("adminAddView")
	@AdminAccess
	public ModelAndView adminAddTour(ModelAndView mv, HttpSession session) {
		mv.setViewName("admin/tour/addTour");
		mv.addObject("adminId", session.getAttribute("userId"));
		return mv;
	}
	
	@GetMapping("adminFixView")
	@AdminAccess
	public ModelAndView adminFixTour(ModelAndView mv, HttpSession session) {
		mv.setViewName("admin/tour/fixTour");
		return mv;
	}
}
