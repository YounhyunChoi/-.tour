package com.my.tour.dao;

import java.util.List;

import com.my.tour.domain.Charge;

public interface ChargeDao {
	List<Charge> selectCharges();
	void insertCharge(int chargePrice, String userId, int resvNum);
}
