package com.my.tour.dao;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.my.tour.dao.map.EventMap;
import com.my.tour.domain.Event;

@Repository
public class EventDaoImpl implements EventDao {
	@Autowired private EventMap eventMap;
	
	@Override
	public List<Event> selectEvents(){
		return eventMap.selectEvents();
	}
	
	@Override
	public List<Event> selectAllEvents(){
		return eventMap.selectAllEvents();
	}
	
	@Override
	public List<Event> selectEvent(int eventNum){
		return eventMap.selectEvent(eventNum);
	}
	
	@Override
	public int insertEventTemp(String adminId, int eventNum) {
		return eventMap.insertEventTemp(adminId, eventNum);
	}
	
	@Override
	public int insertEvent(String eventTitle, String eventContent, String adminId) {
		return eventMap.insertEvent(eventTitle, eventContent, adminId);
	}
	
	@Override
	public int updateEvent(Event event) {
		return eventMap.updateEvent(event);
	}
	
	@Override
	public int deleteEvent(int eventNum) {
		return eventMap.deleteEvent(eventNum);
	}
}
