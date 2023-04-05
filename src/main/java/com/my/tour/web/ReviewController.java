package com.my.tour.web;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import com.my.tour.domain.Review;
import com.my.tour.service.ReviewService;

@RestController
@RequestMapping("review")
public class ReviewController {
	@Autowired private ReviewService reviewService;
	
	@GetMapping("add")
	public ModelAndView addReview(ModelAndView mv) {
		mv.setViewName("review/addReview");
		return mv;
	}
	
	@PostMapping("add")
	public int addReview(String reviewTitle, String reviewContent, int score) {
		return reviewService.addReview(reviewTitle, reviewContent, score);
	}
	
	@GetMapping("get")
	public ModelAndView getReview(ModelAndView mv) {
		mv.setViewName("review/getReview");
		return mv;
	}
	
	@PostMapping("get")
	public List<Review> getReviews() {
		return reviewService.getReviews();
	}
	
	@GetMapping("fix")
	public ModelAndView fixReview(ModelAndView mv) {
		mv.setViewName("review/fixReview");
		return mv;
	}
	
	@PutMapping("fix")
	public int fixReview(String reviewTitle, String reviewContent, int score) {
		return reviewService.fixReview(reviewTitle, reviewContent, score);
	}
	
	@DeleteMapping("del")
	public int delReview(int reviewNum) {
		return reviewService.delReview(reviewNum);
	}
}
