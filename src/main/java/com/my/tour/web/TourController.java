package com.my.tour.web;

import java.io.File;
import java.io.IOException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.my.tour.AdminAccess;
import com.my.tour.GetAccess;
import com.my.tour.domain.Tour;
import com.my.tour.domain.TourImage;
import com.my.tour.domain.TourImageDto;
import com.my.tour.service.TourService;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;

@RestController("tourController")
@RequestMapping("tour")
public class TourController {
	@Autowired private TourService tourService;
	@Value("${attachPath}") private String attachPath;
	
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
	
	@DeleteMapping("adminDel/{tourNum}")
	public void delTour(@PathVariable int tourNum) {
		tourService.delTour(tourNum);
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
	
	@GetMapping("adminFixDelView")
	@AdminAccess
	public ModelAndView adminFixDelTour(ModelAndView mv, HttpSession session) {
		mv.setViewName("admin/tour/fixDelTour");
		mv.addObject("adminId", session.getAttribute("userId"));
		return mv;
	}
	
	//images
	@GetMapping("getTourImages")
	public List<TourImage> getTourImages() {
		return tourService.getTourImages();
	}
	
	@PostMapping("addTourImage")
	public void addTourImage(TourImageDto tourImageDto, Tour tour) {
		String filename = tourImageDto.getTourImage().getOriginalFilename();
		saveFile(attachPath + "/" + filename, tourImageDto.getTourImage());
		
		tourService.addTourImage(filename, tour.getTourNum());
	}
	
	private void saveFile(String filename, MultipartFile file) {
		try {
			file.transferTo(new File(filename));
		} catch(IOException e) {}
	}
}
