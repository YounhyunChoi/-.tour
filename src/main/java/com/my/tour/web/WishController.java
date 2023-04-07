package com.my.tour.web;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import com.my.tour.GetAccess;
import com.my.tour.LoginAccess;
import com.my.tour.domain.Wish;
import com.my.tour.service.WishService;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;

@RestController("WishController")
@RequestMapping("wish")
public class WishController {
	@Autowired
	private WishService wishService;
	
	@GetMapping("get")
	@GetAccess
	public List<Wish> getWishes(HttpServletRequest request, HttpSession session) {
		return wishService.getWishes((String)session.getAttribute("userId"));
	}
	
	@GetMapping
	@LoginAccess
	public ModelAndView wishList(ModelAndView mv, HttpSession session) {
		mv.setViewName("wish/wishList");
		mv.addObject("userId", session.getAttribute("userId"));
		return mv;
	}
	
	@PostMapping("add")
	public void addWish(int tourNum, HttpSession session) {
		wishService.addWish((String)session.getAttribute("userId"), tourNum);
	}
	
	@DeleteMapping("del/{tourNum}")
	public void delWish(@PathVariable int tourNum) {
		wishService.delWish(tourNum);
	}
}
