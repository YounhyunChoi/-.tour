package com.my.tour.dao.map;

import java.util.List;

import com.my.tour.domain.Alarm;

public interface AlarmMap {
	List<Alarm> selectAlarms(String userId);
	int insertAlarm(String alarmContent, String userId);
	int updateAlarm(String userId, String whetherToCheck);
	int deleteAlarm(int alarmNum);
}
