package com.my.tour.dao.map;

import java.util.List;

import com.my.tour.domain.Charge;

public interface ChargeMap {
	List<Charge> selectCharges();
	int insertCharge(int chargePrice, String userId);
}
