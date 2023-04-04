package com.my.tour.web;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import com.my.tour.domain.Tour;
import com.my.tour.domain.Wish;
import com.my.tour.service.WishService;

import jakarta.servlet.http.HttpSession;

@RestController("WishController")
@RequestMapping("wish")
public class WishController {
	@Autowired
	private WishService wishService;
	
	@GetMapping("get")
	public List<Wish> getWishes() {
		return wishService.getWishes();
	}
	
	@GetMapping
	public ModelAndView wishList(ModelAndView mv) {
		mv.setViewName("wish/wishList");
		return mv;
	}
	
	@PostMapping("add")
	public void addWish(@RequestBody Tour tour, HttpSession session) {
		String userId = (String)session.getAttribute("userId");
		wishService.addWish(userId, tour.getTourNum());
	}
	
	@DeleteMapping("del/{tourNum}")
	public void delWish(@PathVariable int tourNum) {
		wishService.delWish(tourNum);
	}
}
