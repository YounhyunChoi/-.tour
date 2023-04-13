package com.my.tour.dao.map;

import java.util.List;

import com.my.tour.domain.Event;

public interface EventMap {
	List<Event> selectEvents();
	List<Event> selectAllEvents();
	List<Event> selectEvent(int eventNum);
	int insertEventTemp(int eventTempNum, String adminId);
	int insertEvent(String eventTitle, String eventContent, String adminId);
	int updateEvent(Event event);
	int deleteEvent(int eventNum);
}
