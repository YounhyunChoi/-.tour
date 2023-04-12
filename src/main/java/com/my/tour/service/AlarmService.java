package com.my.tour.service;

import java.util.List;

import com.my.tour.domain.Alarm;

public interface AlarmService {
	List<Alarm> getAlarms(String userId);
	void addAlarm(String alarmContent, String userId);
	void fixAlarm(String userId, String whetherToCheck);
	void delAlarm(int alarmNum);
}
