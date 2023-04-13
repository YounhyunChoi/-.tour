package com.my.tour.web;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
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
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.my.tour.domain.Tour;
import com.my.tour.domain.TourDto;
import com.my.tour.domain.TourImage;
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
	
	@GetMapping("getList")
	@GetAccess
	public List<TourDto> getTourList(HttpServletRequest request) {
		List<TourDto> tourList = tourService.getTourList();
		for(TourDto tourDto: tourList) {
			tourDto.setTourImageName(tourService.getTourImages(tourDto.getTourNum()).get(0).getTourImageName());
		}
		
		return tourList;
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
	@GetMapping("adminList")
	@AdminAccess
	public ModelAndView adminTourList(ModelAndView mv, HttpSession session) {
		mv.setViewName("admin/tour/tourList");
		return mv;
	}
	
	@GetMapping("add")
	@AdminAccess
	public ModelAndView addTour(ModelAndView mv, HttpSession session) {
		mv.setViewName("admin/tour/addTour");
		
		if(tourService.getAllTours().size() == 0) {
			tourService.addTourTemp(1, (String) session.getAttribute("userId"));
		} else if(!tourService.getAllTours().get(0).getTourName().equals("temp")) {
			tourService.addTourTemp(tourService.getTours().get(0).getTourNum() + 1,
									(String) session.getAttribute("userId"));
		}

		mv.addObject("tourNum", tourService.getAllTours().get(0).getTourNum());
		
		return mv;
	}
	
	@PostMapping("add")
	public void addTour(@RequestBody Tour tour, HttpSession session) {
		tourService.delTour(tourService.getAllTours().get(0).getTourNum());
		tourService.addTour(tour.getTourName(), tour.getTourContent(), 
				tour.getTourSDate(), tour.getTourEDate(), tour.getTourPrice(), tour.getDiscountPrice(),
				(String)session.getAttribute("userId"));
	}
	
	@GetMapping("fix")
	@AdminAccess
	public ModelAndView fixTour(ModelAndView mv, HttpSession session, int tourNum) {
		mv.setViewName("admin/tour/fixTour");
		mv.addObject("tourNum", tourNum);
		return mv;
	}
	
	@PutMapping("fix")
	public void fixTour(@RequestBody Tour tour) {
		tourService.fixTour(tour);
	}
	
	@DeleteMapping("del/{tourNum}")
	public void delTour(@PathVariable int tourNum) {
		tourService.delTour(tourNum);
	}
	
	//images
	@GetMapping("getTourImages")
	@AdminAccess
	public List<String> getTourImages(int tourNum) {
		List<String> tourImageName = new ArrayList<String>();
		if(tourService.getTourImages(tourNum).size() != 0) {
			for(TourImage tourImage : tourService.getTourImages(tourNum)) {
				tourImageName.add(tourImage.getTourImageName());			
			}
		}
		
		return tourImageName;
	}
	
	@PostMapping("addTourImages")
	public boolean addTourImages(@RequestParam("tourImage") List<MultipartFile> tourImage) {
		int tourNum = tourService.getAllTours().get(0).getTourNum();
		String filename = "";
		
		tourService.delTourImage(tourNum);
		
		if(tourImage.size() > 4) {
			return false;
		} else {
			for(MultipartFile multipartfile: tourImage) {
				System.out.println(multipartfile);
				filename = "tour" + multipartfile.getOriginalFilename();
				if(!filename.equals("tour")) {
					saveFile(attachPath + "/" + filename, multipartfile);
					tourService.addTourImage(filename, tourNum);
				}
			}
			return true;
		}
	}
	
	private void saveFile(String filename, MultipartFile file) {
		try {
			file.transferTo(new File(filename));
		} catch(IOException e) {}
	}
	
	@DeleteMapping("delTourImages")
	public void delTourImages(int tourNum) {
		tourService.delTourImage(tourNum);
	}
}
