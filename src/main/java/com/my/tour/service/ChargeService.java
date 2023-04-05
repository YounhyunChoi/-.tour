package com.my.tour.service;

import java.util.List;

import com.my.tour.domain.Charge;

public interface ChargeService {
	List<Charge> getCharges();
	List<Charge> selectCharge(String userId);
	void addCharge(int chargePrice, String userId);
	
}
