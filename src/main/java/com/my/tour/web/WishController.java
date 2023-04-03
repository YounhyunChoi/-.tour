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
import com.my.tour.domain.User;
import com.my.tour.domain.Wish;
import com.my.tour.service.WishService;

@RestController("WishController")
@RequestMapping("wish")
public class WishController {
	@Autowired
	private WishService wishService;
	
	@GetMapping("get")
	public List<Wish> getWishes() {
		return wishService.getWishes();
	}
	
	@GetMapping("getTours")
	public List<Tour> getTours() {
		return wishService.getTours();
	}
	
	@GetMapping
	public ModelAndView wishList(ModelAndView mv) {
		mv.setViewName("wish/wishList");
		return mv;
	}
	
	@PostMapping("add")
	public void addWish(@RequestBody Wish wish,
						@RequestBody User user,
						@RequestBody Tour tour) {
		wishService.addWish(wish.getWishNum(), user.getUserId(), tour.getTourNum());
	}
	
	@DeleteMapping("del/{tourNum}")
	public void delWish(@PathVariable int tourNum) {
		wishService.delWish(tourNum);
	}
}
