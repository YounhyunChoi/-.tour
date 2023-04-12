package com.my.tour.dao;

import java.util.List;

import com.my.tour.domain.Alarm;

public interface AlarmDao {
	List<Alarm> selectAlarms(String userId);
	void insertAlarm(String alarmContent, String userId);
	void deleteAlarm(int alarmNum);
}
