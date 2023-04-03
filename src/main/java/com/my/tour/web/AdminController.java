package com.my.tour.web;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import jakarta.servlet.http.HttpSession;

@RestController
@RequestMapping("admin")
public class AdminController {
	@GetMapping("main")
	public ModelAndView main(ModelAndView mv, HttpSession session) {
		mv.setViewName("admin/main");
		return mv;
	}
	
	@GetMapping("logout")
	public ModelAndView logout(HttpSession session, ModelAndView mv) {
		session.invalidate();
		
		mv.setViewName("redirect:/");
		return mv;
	}
}
