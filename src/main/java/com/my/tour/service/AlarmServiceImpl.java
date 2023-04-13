package com.my.tour.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.my.tour.dao.AlarmDao;
import com.my.tour.domain.Alarm;

@Service
public class AlarmServiceImpl implements AlarmService{
	@Autowired private AlarmDao alarmDao;
	
	@Override
	public List<Alarm> getAlarms(String userId){
		return alarmDao.selectAlarms(userId);
	}
	
	@Override
	public void addAlarm(String alarmContent, String userId) {
		alarmDao.insertAlarm(alarmContent, userId);
	}
	
	@Override
	public void fixAlarm(String userId) {
		alarmDao.updateAlarm(userId);
	}
	
	@Override
	public void delAlarm(int alarmNum) {
		alarmDao.deleteAlarm(alarmNum);
	}
}
