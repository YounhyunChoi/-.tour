package com.my.tour.web;


import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.CookieValue;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
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
	
	@GetMapping("getUserDto")
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
		
		if(request.getHeader("REFERER") != null) {
			request.setAttribute("previousPage", 
								(String)request.getHeader("REFERER").substring(6));
		}
		
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
	public void signUp(@RequestBody User user) {	
		userService.addUser(user);
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
	public void findPw(HttpSession session, String userId) {
		session.setAttribute("userIdTemp", userId);
	}
	
	@GetMapping("fixPw")
	@UserAccess
	public ModelAndView fixPw(ModelAndView mv, HttpSession session) {
		mv.setViewName("user/fixPw");
		
		return mv;
	}
	
	@PutMapping("fixPw")
	public void fixPw(ModelAndView mv, HttpSession session, 
					@RequestBody User user) {
		user.setUserId((String) session.getAttribute("userIdTemp"));
		userService.fixUser(user);
	}
	
	@GetMapping("fixUser")
	public ModelAndView fixUser(ModelAndView mv, HttpSession session, 
								HttpServletRequest request) {
		mv.setViewName("user/fixUser");
		User user = (userService.getUser((String) session.getAttribute("userId")).get(0));
		mv.addObject("user", user);
		
		if(user.getMktgAgreement().equals("Y")) {
			request.setAttribute("mktgAgreement", "checked");
		}
		
		return mv;
	}
	
	@PutMapping("fixUser")
	public void fixUser(@RequestBody User user, HttpSession session) {
		user.setUserId((String) session.getAttribute("userId"));
		userService.fixUser(user);
	}
	
	@DeleteMapping("delUser")
	public void delUser(HttpSession session) {
		userService.deleteUser((String) session.getAttribute("userId"));
		session.invalidate();
	}
	
	@GetMapping("afterFixUser")
	public ModelAndView afterFixUser(ModelAndView mv) {
		mv.setViewName("user/afterFixUser");
		
		return mv;
	}
	
	@GetMapping("afterDelUser")
	public ModelAndView afterDelUser(ModelAndView mv) {
		mv.setViewName("user/afterDelUser");
		
		return mv;
	}
	
	@GetMapping("myPage")
	public ModelAndView myPage(ModelAndView mv) {
		mv.setViewName("user/myPage");
		
		return mv;
	}
}
