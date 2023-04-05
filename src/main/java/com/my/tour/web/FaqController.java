package com.my.tour.web;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import com.my.tour.GetAccess;
import com.my.tour.domain.Faq;
import com.my.tour.service.FaqService;

import jakarta.servlet.http.HttpServletRequest;

@RestController
@RequestMapping("faq")
public class FaqController {
	@Autowired private FaqService faqService;
	
	
	@GetMapping("get")
	@GetAccess
	public List<Faq> getFaqs(HttpServletRequest request) {
		return faqService.getFaqs();
	}
	
	@GetMapping
	public ModelAndView faqMain(ModelAndView mv) {
		mv.setViewName("faq/faqMain");
		return mv;
	}
	
	
}
