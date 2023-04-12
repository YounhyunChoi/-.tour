package com.my.tour.web;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import com.my.tour.domain.Faq;
import com.my.tour.service.FaqService;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;


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
	
	@GetMapping("adminFaqList")
	@AdminAccess
	public ModelAndView adminFaqMain(ModelAndView mv, HttpSession session) {
		mv.setViewName("admin/faq/faqList");
		return mv;
	}
	
	@GetMapping("add")
	@AdminAccess
	public ModelAndView addFaq(ModelAndView mv, HttpSession session) {
		mv.setViewName("admin/faq/addFaq");
		return mv;
	}
	
	@PostMapping("add")
	public void addFaq(String faqQuestion, String faqAnswer, HttpSession session){
		faqService.addFaq(faqQuestion, faqAnswer, (String)session.getAttribute("userId"));
	}
	
	@GetMapping("change")
	@AdminAccess
	public ModelAndView chagneFaq(ModelAndView mv, HttpSession session) {
		mv.setViewName("admin/faq/changeFaq");
		return mv;
	}
	
	@PostMapping("change")
	public void chagneFaq(String oldFaqQuestion, String newFaqQuestion, String newFaqAnswer, HttpSession session) {
		faqService.delFaq(oldFaqQuestion);
		faqService.addFaq(newFaqQuestion, newFaqAnswer, (String)session.getAttribute("userId"));
	}
	
	
	@DeleteMapping("del")
	public void delFaq(String faqQuestion) {
		faqService.delFaq(faqQuestion);
	}
}
