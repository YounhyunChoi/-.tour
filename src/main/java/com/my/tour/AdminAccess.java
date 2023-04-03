package com.my.tour;

import org.aspectj.lang.JoinPoint;
import org.aspectj.lang.annotation.Around;
import org.aspectj.lang.annotation.Aspect;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.web.servlet.ModelAndView;

import com.my.tour.service.AdminService;
import com.my.tour.service.AdminServiceImpl;

import jakarta.servlet.http.HttpSession;

@Component
@Aspect
public class AdminAccess {
	@Autowired private AdminService adminService = new AdminServiceImpl();
	
	@Around("execution(* com.my.tour.web.AdminController.*(..)) && args(mv, session, ..)")
	public ModelAndView accessRight(JoinPoint jp, ModelAndView mv,
									HttpSession session) throws Throwable {
		if(session.getAttribute("userId") == null ||
				adminService.getAdmin((String) session.getAttribute("userId")).size() == 0) {
			mv.setViewName("redirect:/");
		}
		
		return mv;
	}
}
