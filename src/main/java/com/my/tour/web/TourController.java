package com.my.tour.web;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import com.my.tour.domain.Tour;
import com.my.tour.service.TourService;

@RestController("tourController")
@RequestMapping("tour")
public class TourController {
	@Autowired private TourService tourService;
	
	@GetMapping("get")
	public List<Tour> getTours() {
		return tourService.getTours();
	}
	
	@GetMapping
	public ModelAndView tourList(ModelAndView mv) {
		mv.setViewName("tour/tourList");
		return mv;
	}
	
	@GetMapping("view/{tourNum}")
	public ModelAndView tourView(ModelAndView mv, @PathVariable int tourNum) {
		mv.setViewName("tour/tourView");
		return mv;
	}
}
