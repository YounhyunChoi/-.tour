package com.my.tour.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.my.tour.dao.ChargeDao;
import com.my.tour.domain.Charge;

@Service
public class ChargeServiceImpl implements ChargeService{
	@Autowired private ChargeDao chargeDao;
	
	@Override
	public List<Charge> getCharges(){
		return chargeDao.selectCharges();
	}
	
	@Override
	public List<Charge> selectCharge(String userId) {
		return chargeDao.selectCharge(userId);
	}
	@Override
	public void addCharge(int chargePrice, String userId) {
		chargeDao.insertCharge(chargePrice, userId);
	}
}
