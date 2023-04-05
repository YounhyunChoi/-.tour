package com.my.tour.web;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.my.tour.domain.Charge;
import com.my.tour.service.ChargeService;

import jakarta.servlet.http.HttpSession;


@RestController
@RequestMapping("charge")
public class ChargeController {
	@Autowired private ChargeService chargeService;
	
	@GetMapping("get")
	public List<Charge> getCharges() {
		return chargeService.getCharges();
	}
	
	@GetMapping("getCharge")
	public List<Charge> selectCharge(HttpSession session) {
		return chargeService.selectCharge((String)session.getAttribute("userId"));
	}
	@PostMapping("add")
	public void addCharge(int chargePrice, HttpSession session) {
		chargeService.addCharge(chargePrice, (String)session.getAttribute("userId"));
	}
}
