package com.my.tour.web;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.my.tour.domain.Term;
import com.my.tour.service.TermService;

@RestController
@RequestMapping("term")
public class TermController {
	@Autowired TermService termService;
	
	@GetMapping("get")
	public Term getTerm(int termNum) {
		return termService.getTerm(termNum);
	}
}
