package com.my.tour.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.my.tour.dao.EventDao;
import com.my.tour.dao.EventImageDao;
import com.my.tour.domain.Event;
import com.my.tour.domain.EventImage;

@Service
public class EventServiceImpl implements EventService {
	@Autowired private EventDao eventDao;
	@Autowired private EventImageDao eventImageDao;
	
	@Override
	public List<Event> getEvents(){
		return eventDao.selectEvents();
	}
	
	@Override
	public List<Event> getAllEvents(){
		return eventDao.selectAllEvents();
	}
	
	@Override
	public List<Event> getEvent(int eventNum){
		return eventDao.selectEvent(eventNum);
	}
	
	@Override
	public void addEventTemp(String adminId, int eventNum) {
		eventDao.insertEventTemp(adminId, eventNum);
	}
	
	@Override
	public void addEvent(String eventTitle, String eventContent, String adminId) {
		eventDao.insertEvent(eventTitle, eventContent, adminId);
	}
	
	@Override
	public void fixEvent(Event event) {
		eventDao.updateEvent(event);
	}
	
	@Override
	public void delEvent(int eventNum) {
		eventDao.deleteEvent(eventNum);
	}
	
	@Override
	public List<EventImage> getEventImages(int eventNum){
		return eventImageDao.selectEventImages(eventNum);
	}
	
	@Override
	public void addEventImage(String adminId, int eventNum) {
		eventImageDao.insertEventImage(adminId, eventNum);
	}
	
	@Override
	public void delEventImage(int eventNum) {
		eventImageDao.deleteEventImage(eventNum);
	}
}
