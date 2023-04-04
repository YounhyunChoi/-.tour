package com.my.tour.web;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import com.my.tour.GetAccess;
import com.my.tour.domain.Tour;
import com.my.tour.service.TourService;

import jakarta.servlet.http.HttpServletRequest;

@RestController("tourController")
@RequestMapping("tour")
public class TourController {
	@Autowired private TourService tourService;
	
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
	public ModelAndView tourView(ModelAndView mv) {
		mv.setViewName("tour/tourView");
		return mv;
	}
}
