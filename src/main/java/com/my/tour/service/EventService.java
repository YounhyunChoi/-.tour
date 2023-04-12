package com.my.tour.service;

import java.util.List;

import com.my.tour.domain.Event;
import com.my.tour.domain.EventImage;

public interface EventService {
	List<Event> getEvents();
	List<Event> getAllEvents();
	List<Event> getEvent(int eventNum);
	void addEventTemp(String adminId, int eventNum);
	void addEvent(String eventTitle, String eventContent, String adminId);
	void fixEvent(Event event);
	void delEvent(int eventNum);
	List<EventImage> getEventImages(int eventNum);
	void addEventImage(String eventImageName, int eventNum);
	void delEventImage(int eventNum);
}
