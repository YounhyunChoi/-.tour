package com.my.tour.web;


import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.CookieValue;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import com.my.tour.domain.UserDto;
import com.my.tour.service.UserService;

import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@RestController
@RequestMapping("user")
public class UserController {
	@Autowired private UserService userService;
	
	@GetMapping("nav")
	public ModelAndView navigation(ModelAndView mv) {
		mv.setViewName("navigation/01");
		return mv;
	}
	
	@GetMapping("get")
	public List<UserDto> getUsers() {
		return userService.getUsers();
	}
	
	@GetMapping("login")
	public ModelAndView logIn(@CookieValue(required=false)String userId, 
			@ModelAttribute("user") UserDto user, HttpServletRequest request,
			ModelAndView mv) {
		if(userId != null) {
			user.setUserId(userId);
			request.setAttribute("saveId", "checked");
		}
		request.setAttribute("previousPage", 
				(String)request.getHeader("REFERER").substring(6));
		
		mv.setViewName("user/01");
		return mv;
	}
	
	@PostMapping("login")
	public ModelAndView login(@ModelAttribute("user") UserDto user, String saveId,
			HttpSession session, HttpServletResponse response,
			HttpServletRequest request, ModelAndView mv) {
		session.setAttribute("userId", user.getUserId());
		
		if(saveId != null && saveId.equals("on")) {
			Cookie cookie = new Cookie("userId", user.getUserId());
			cookie.setMaxAge(10);
			response.addCookie(cookie);
		}
		
		String url = (String)request.getAttribute("previousPage");
		if(url == null || url.equals("localhost/user/logIn")) url = "redirect:/";
		
		mv.setViewName(url);
		return mv;
	}
	
	@GetMapping("logout")
	public ModelAndView logout(HttpSession session, ModelAndView mv) {
		session.invalidate();
		
		mv.setViewName("redirect:/");
		return mv;
	}
}
