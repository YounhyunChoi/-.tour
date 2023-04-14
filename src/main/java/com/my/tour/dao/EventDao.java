package com.my.tour.dao;

import java.util.List;

import com.my.tour.domain.Event;

public interface EventDao {
	List<Event> selectEvents();
	List<Event> selectAllEvents();
	List<Event> selectEvent(int eventNum);
	void insertEventTemp(int eventTempNum, String adminId);
	void insertEvent(String eventTitle, String eventContent, String adminId);
	void updateEvent(Event event);
	void deleteEvent(int eventNum);
}
