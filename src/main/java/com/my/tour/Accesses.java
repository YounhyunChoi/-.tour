package com.my.tour;

import org.aspectj.lang.JoinPoint;
import org.aspectj.lang.ProceedingJoinPoint;
import org.aspectj.lang.annotation.Around;
import org.aspectj.lang.annotation.Aspect;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.web.servlet.ModelAndView;

import com.my.tour.service.AdminService;
import com.my.tour.service.AdminServiceImpl;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;

@Component
@Aspect
public class Accesses {
	@Autowired private AdminService adminService;
	
	@Around("@annotation(com.my.tour.UserAccess) && args(mv, session, ..)")
	public ModelAndView userAccessRight(JoinPoint jp, ModelAndView mv,
									HttpSession session) {
		if(session.getAttribute("userId") != null) {
			mv.setViewName("redirect:/");
		}
		
		return mv;
	}
	
	@Around("execution(* com.my.tour.web.AdminController.*(..)) && args(mv, session, ..)")
	public ModelAndView adminAccessRight(JoinPoint jp, ModelAndView mv,
									HttpSession session) {
		if(session.getAttribute("userId") == null ||
				adminService.getAdmin((String) session.getAttribute("userId")).size() == 0) {
			mv.setViewName("redirect:/");
		}
		
		return mv;
	}
	
	@Around("@annotation(com.my.tour.GetAccess) && args(request, ..)")
	public Object getAccessRight(JoinPoint jp, HttpServletRequest request) throws Throwable {
		Object obj = ((ProceedingJoinPoint) jp).proceed();

		if (request.getHeader("REFERER") == null){
			obj = null;
		}
		
		return obj;
	}
}
