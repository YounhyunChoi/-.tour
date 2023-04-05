package com.my.tour.dao;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.my.tour.dao.map.ChargeMap;
import com.my.tour.domain.Charge;

@Repository
public class ChargeDaoImpl implements ChargeDao {
	@Autowired ChargeMap chargeMap;
	
	@Override
	public List<Charge> selectCharges() {
		return chargeMap.selectCharges();
	}
	@Override
	public List<Charge> selectCharge(String userId) {
		return chargeMap.selectCharge(userId);
	}
	@Override
	public void insertCharge(int chargePrice, String userId) {
		chargeMap.insertCharge(chargePrice, userId);
	}
}
