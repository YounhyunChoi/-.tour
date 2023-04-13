package com.my.tour.dao;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.my.tour.dao.map.EventImageMap;
import com.my.tour.domain.EventImage;

@Repository
public class EventImageDaoImpl implements EventImageDao {
	@Autowired private EventImageMap eventImageMap;
	
	@Override
	public List<EventImage> selectEventImages(int eventNum) {
		return eventImageMap.selectEventImages(eventNum);
	}
	
	@Override
	public int insertEventImage(String eventImageName, int eventNum) {
		return eventImageMap.insertEventImage(eventImageName, eventNum);
	}
	
	@Override
	public int deleteEventImage(int eventNum) {
		return eventImageMap.deleteEventImage(eventNum);
	}
}
