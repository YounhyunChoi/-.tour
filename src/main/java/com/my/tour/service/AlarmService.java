package com.my.tour.service;

import java.util.List;

import com.my.tour.domain.Alarm;

public interface AlarmService {
	List<Alarm> getAlarms(String userId);
	void addAlarm(String alarmContent, String userId);
	void delAlarm(int alarmNum);
}
