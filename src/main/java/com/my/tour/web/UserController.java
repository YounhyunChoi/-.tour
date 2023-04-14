package com.my.tour.web;

import java.io.File;
import java.io.IOException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.web.bind.annotation.CookieValue;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.my.tour.domain.Logo;
import com.my.tour.domain.LogoDto;
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
	@Value("${attachPath}") private String attachPath;
	
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
			session.setAttribute("previousPage", 
								(String)request.getHeader("REFERER").substring(17));
		}
		
		mv.setViewName("user/login");
		
		return mv;
	}
	
	@PostMapping("login")
	public ModelAndView login(@ModelAttribute("user") UserDto user, String saveId,
							HttpSession session, HttpServletResponse response, ModelAndView mv) {
		session.setAttribute("userId", user.getUserId());
		if(userService.getUserDto(user.getUserId()).size() == 1) {
			if(saveId != null && saveId.equals("on")) {	
				Cookie cookie = new Cookie("userId", user.getUserId());
				cookie.setMaxAge(10);
				response.addCookie(cookie);
			} 
			
			String url = (String)session.getAttribute("previousPage");
			
			if(url == null || url.equals("localhost/user/logIn")) {
				url = "redirect:/";
			} else {
				url = "redirect:/" + url;
			}
			
			mv.setViewName(url);
		} else {
			mv.setViewName("redirect:/user/adminMain");
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
	@UserAccess
	public ModelAndView findPw(ModelAndView mv, HttpSession session, String userId) {
		mv.setViewName("user/fixPw");
		
		return mv;
	}
	
	@PutMapping("fixPw")
	public void fixPw(ModelAndView mv, HttpSession session, 
					@RequestBody User user) {
		userService.fixUser(user);
	}
	
	@GetMapping("fixUser")
	@LoginAccess
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
		userService.fixUser(user);
	}
	
	@DeleteMapping("delUser")
	public void delUser(HttpSession session) {
		userService.deleteUser((String) session.getAttribute("userId"));
		session.invalidate();
	}
	
	@GetMapping("afterFixUser")
	@LoginAccess
	public ModelAndView afterFixUser(ModelAndView mv, HttpSession session) {
		mv.setViewName("user/afterFixUser");
		
		return mv;
	}
	
	@GetMapping("afterDelUser")
	public ModelAndView afterDelUser(ModelAndView mv, HttpSession session) {
		mv.setViewName("user/afterDelUser");
		
		return mv;
	}
	
	@GetMapping("myPage")
	@LoginAccess
	public ModelAndView myPage(ModelAndView mv, HttpSession session) {
		mv.setViewName("user/myPage");
		
		return mv;
	}
	
	@GetMapping("adminNav")
	public ModelAndView adminNavigation(ModelAndView mv) {
		mv.setViewName("admin/navigation/navigation");
		
		return mv;
	}
	
	@GetMapping("adminMain")
	@AdminAccess
	public ModelAndView adminMain(ModelAndView mv, HttpSession session) {
		mv.setViewName("admin/main");
		
		return mv;
	}
	
	@GetMapping("getLogos")
	public List<Logo> getLogos() {
		return userService.getLogos();
	}
	
	@PostMapping("addLogo")
	public void addLogo(LogoDto logoDto) {
		String filename = "logo" + logoDto.getLogoImage().getOriginalFilename();
		if(!filename.equals("logo")) {
			saveFile(attachPath + "/" + filename, logoDto.getLogoImage());
			
			userService.addLogo(filename);
		}
	}
	
	private void saveFile(String filename, MultipartFile file) {
		try {
			file.transferTo(new File(filename));
		} catch(IOException e) {}
	}
}
