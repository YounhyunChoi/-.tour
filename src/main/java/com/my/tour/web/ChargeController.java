package com.my.tour.web;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import com.my.tour.domain.Charge;
import com.my.tour.service.ChargeService;

@RestController
@RequestMapping("charge")
public class ChargeController {
	@Autowired private ChargeService chargeService;
	
	@GetMapping("get")
	public List<Charge> getCharges() {
		return chargeService.getCharges();
	}
	
	@PostMapping("add")
	public ModelAndView addCharge(ModelAndView mv) {
		return mv;
	}
}
