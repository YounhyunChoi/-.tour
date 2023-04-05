package com.my.tour;

import org.aspectj.lang.JoinPoint;
import org.aspectj.lang.ProceedingJoinPoint;
import org.aspectj.lang.annotation.After;
import org.aspectj.lang.annotation.Aspect;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.web.servlet.ModelAndView;

import com.my.tour.service.AdminService;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;

@Component
@Aspect
public class Accesses {
	@Autowired private AdminService adminService;
	
	@After("@annotation(com.my.tour.UserAccess) && args(mv, session, ..)")
	public ModelAndView userAccessRight(JoinPoint jp, ModelAndView mv,
									HttpSession session) {
		if(session.getAttribute("userId") != null) {
			mv.setViewName("redirect:/");
		}
		
		return mv;
	}
	
	@After("@annotation(com.my.tour.AdminAccess) && args(mv, session, ..)")
	public ModelAndView adminAccessRight(JoinPoint jp, ModelAndView mv,
									HttpSession session) {
		if(session.getAttribute("userId") == null ||
				adminService.getAdmin((String) session.getAttribute("userId")).size() == 0) {
			mv.setViewName("redirect:/");
		}
		
		return mv;
	}
	
	@After("@annotation(com.my.tour.GetAccess) && args(request, ..)")
	public Object getAccessRight(JoinPoint jp, HttpServletRequest request) throws Throwable {
		Object obj = ((ProceedingJoinPoint) jp).proceed();

		if (request.getHeader("REFERER") == null){
			obj = null;
		}
		
		return obj;
	}
}
