package com.my.tour.web;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import com.my.tour.service.ReviewService;

@RestController
@RequestMapping("review")
public class ReviewController {
	@Autowired private ReviewService reviewService;
	
	@GetMapping("add")
	public ModelAndView addReview(ModelAndView mv) {
		mv.setViewName("review/addreview");
		return mv;
	}
	
	@PostMapping("add")
	public int addReview(String reviewTitle, String reviewContent, int score) {
		return reviewService.addReview(reviewTitle, reviewContent, score);
	}
	
	@GetMapping("fix")
	public ModelAndView fixReview(ModelAndView mv) {
		mv.setViewName("review/fixreview");
		return mv;
	}
	
	@PutMapping("fix")
	public int fixReview(String reviewTile, String reviewContent, int score) {
		return reviewService.fixReview(reviewTile, reviewContent, score);
	}
	
	@DeleteMapping("del")
	public int delReview(@PathVariable int reviewNum) {
		return reviewService.delReview(reviewNum);
	}
}
