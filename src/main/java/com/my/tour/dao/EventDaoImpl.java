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
	public void insertEventTemp(int eventTempNum, String adminId) {
		eventMap.insertEventTemp(eventTempNum, adminId);
	}
	
	@Override
	public void insertEvent(String eventTitle, String eventContent, String adminId) {
		eventMap.insertEvent(eventTitle, eventContent, adminId);
	}
	
	@Override
	public void updateEvent(Event event) {
		eventMap.updateEvent(event);
	}
	
	@Override
	public void deleteEvent(int eventNum) {
		eventMap.deleteEvent(eventNum);
	}
}
