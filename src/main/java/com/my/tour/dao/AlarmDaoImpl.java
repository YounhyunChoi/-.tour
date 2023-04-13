package com.my.tour.dao;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.my.tour.dao.map.AlarmMap;
import com.my.tour.domain.Alarm;

@Repository
public class AlarmDaoImpl implements AlarmDao{
	@Autowired private AlarmMap alarmMap;
	
	@Override
	public List<Alarm> selectAlarms(String userId){
		return alarmMap.selectAlarms(userId);
	}
	
	@Override
	public void insertAlarm(String alarmContent, String userId) {
		alarmMap.insertAlarm(alarmContent, userId);
	}
	
	@Override
	public void updateAlarm(String userId) {
		alarmMap.updateAlarm(userId);
	}
	@Override
	public void deleteAlarm(int alarmNum) {
		alarmMap.deleteAlarm(alarmNum);
	}
}
