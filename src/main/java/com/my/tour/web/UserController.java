package com.my.tour.web;


import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.CookieValue;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import com.my.tour.GetAccess;
import com.my.tour.UserAccess;
import com.my.tour.domain.User;
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
		mv.setViewName("navigation/navigation");
		
		return mv;
	}
	
	@GetMapping("modal")
	public ModelAndView modal(ModelAndView mv) {
		mv.setViewName("navigation/modal");
		
		return mv;
	}
	
	@GetMapping("get")
	@GetAccess
	public List<UserDto> getUser(HttpServletRequest request, String userId) {
		return userService.getUserOrAdmin(userId);
	}
	
	@GetMapping("login")
	@UserAccess
	public ModelAndView logIn(ModelAndView mv, HttpSession session,
							@CookieValue(required=false)String userId, 
							@ModelAttribute("user") UserDto user,
							HttpServletRequest request) {
		if(userId != null) {
			user.setUserId(userId);
			request.setAttribute("saveId", "checked");
		}
		request.setAttribute("previousPage", 
				(String)request.getHeader("REFERER").substring(6));
		
		mv.setViewName("user/login");
		
		return mv;
	}
	
	@PostMapping("login")
	public ModelAndView login(@ModelAttribute("user") UserDto user, String saveId,
							HttpSession session, HttpServletResponse response,
							HttpServletRequest request, ModelAndView mv) {
		session.setAttribute("userId", user.getUserId());
		if(userService.getUserDto(user.getUserId()).size() == 1) {
			if(saveId != null && saveId.equals("on")) {	
				Cookie cookie = new Cookie("userId", user.getUserId());
				cookie.setMaxAge(10);
				response.addCookie(cookie);
			}
			
			String url = (String)request.getAttribute("previousPage");
			
			if(url == null || url.equals("localhost/user/logIn")) {
				url = "redirect:/";
			} else {
				url = "redirect:/" + url;
			}
			
			mv.setViewName(url);
		} else {
			mv.setViewName("redirect:/admin/main");
		}
		
		return mv;
	}
	
	@GetMapping("logout")
	public ModelAndView logout(HttpSession session, ModelAndView mv) {
		session.invalidate();
		mv.setViewName("redirect:/");
		
		return mv;
	}
	
	@GetMapping("signUp")
	@UserAccess
	public ModelAndView signUp(ModelAndView mv, HttpSession session) {
		mv.setViewName("user/signUp");
		
		return mv;
	}
	
	@PostMapping("signUp")
	public ModelAndView signUp(@RequestBody User user, ModelAndView mv) {	
		userService.addUser(user);		
		
		return mv;
	}
	
	@GetMapping("afterSignUp")
	@UserAccess
	public ModelAndView afterSignUp(ModelAndView mv, HttpSession session, 
									HttpServletRequest request) {
		mv.addObject("userId", request.getParameter("userId"));
		mv.setViewName("user/afterSignUp");
		
		return mv;
	}

	@GetMapping("getUsers")
	@GetAccess
	public List<User> getUsers(HttpServletRequest request) {
		return userService.getUsers();
	}
	
	@GetMapping("findId")
	@UserAccess
	public ModelAndView findId(ModelAndView mv, HttpSession session) {
		mv.setViewName("user/findId");
		
		return mv;
	}
	
	@GetMapping("findPw")
	@UserAccess
	public ModelAndView findPw(ModelAndView mv, HttpSession session) {
		mv.setViewName("user/findPw");
		
		return mv;
	}
	
	@PostMapping("findPw")
	public ModelAndView findPw(ModelAndView mv, HttpSession session, String userId) {
		session.setAttribute("userIdTemp", userId);
		
		return mv;
	}
	
	@GetMapping("fixPw")
	@UserAccess
	public ModelAndView fixPw(ModelAndView mv, HttpSession session) {
		mv.setViewName("user/fixPw");
		
		return mv;
	}
	
	@PostMapping("fixPw")
	public ModelAndView fixPw(ModelAndView mv, HttpSession session, 
							@RequestBody User user) {
		user.setUserId((String) session.getAttribute("userIdTemp"));
		userService.fixUser(user);
		
		return mv;
	}
	
}
