package com.my.tour.dao;

import java.util.List;

import com.my.tour.domain.Charge;

public interface ChargeDao {
	List<Charge> selectCharges();
	List<Charge> selectCharge(String userId);
	void insertCharge(int chargePrice, String userId);
}
