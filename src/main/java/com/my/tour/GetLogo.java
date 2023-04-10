package com.my.tour;

import org.aspectj.lang.JoinPoint;
import org.aspectj.lang.ProceedingJoinPoint;
import org.aspectj.lang.annotation.Around;
import org.aspectj.lang.annotation.Aspect;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.web.servlet.ModelAndView;

import com.my.tour.service.AdminService;

@Component
@Aspect
public class GetLogo {
	@Autowired private AdminService adminService;
	
	@Around("execution(org.springframework.web.servlet.ModelAndView com.my.tour.web..*(..))")
	public ModelAndView getLogo(JoinPoint jp) throws Throwable {
		ModelAndView mv = (ModelAndView) ((ProceedingJoinPoint) jp).proceed();
		
		if(adminService.getLogos().size() != 0) {
			mv.addObject("logoName", adminService.getLogos().get(0).getLogoName());
		}
		
		return mv;
	}
}
