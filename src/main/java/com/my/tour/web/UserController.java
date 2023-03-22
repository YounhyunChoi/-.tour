package com.my.tour.web;


import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.CookieValue;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.my.tour.domain.User;

import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@Controller
@RequestMapping("user")
public class UserController {
	@GetMapping("nav")
	public String navigation() {
		return "navigation/01";
	}
	
	@GetMapping("login")
	public String logIn(@CookieValue(required=false)String userId, 
			@ModelAttribute("user") User user, HttpServletRequest request) {
		if(userId != null) {
			user.setUserId(userId);
			request.setAttribute("rememberId", "checked");
		}
		request.setAttribute("previousPage", 
				(String)request.getHeader("REFERER").substring(6));
		return "user/01";
	}
	
	@PostMapping("login")
	public String login(@ModelAttribute("user") User user, String rememberId,
			HttpSession session, HttpServletResponse response,
			HttpServletRequest request) {
		session.setAttribute("userId", user.getUserId());
		session.setAttribute("nickName", "user");
		
		if(rememberId != null && rememberId.equals("on")) {
			Cookie cookie = new Cookie("userId", user.getUserId());
			cookie.setMaxAge(10);
			response.addCookie(cookie);
		}
		
		String url = (String)request.getAttribute("previousPage");
		if(url == null || url.equals("localhost/user/logIn")) url = "redirect:/";
		
		return url;
	}
	
	@GetMapping("logout")
	public String logout(HttpSession session) {
		session.invalidate();
		
		return "redirect:/";
	}
}
