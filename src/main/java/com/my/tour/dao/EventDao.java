package com.my.tour.dao;

import java.util.List;

import com.my.tour.domain.Event;

public interface EventDao {
	List<Event> selectEvents();
	List<Event> selectAllEvents();
	List<Event> selectEvent(int eventNum);
	int insertEventTemp(String adminId, int eventSize);
	int insertEvent(String eventTitle, String eventContent, String adminId);
	int updateEvent(Event evnet);
	int deleteEvent(int eventNum);
}
