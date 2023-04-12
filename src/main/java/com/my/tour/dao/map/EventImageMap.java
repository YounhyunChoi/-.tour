package com.my.tour.dao.map;

import java.util.List;

import com.my.tour.domain.EventImage;

public interface EventImageMap {
	List<EventImage> selectEventImages(int eventNum);
	int insertEventImage(String eventImageName, int eventNum);
	int deleteEventImage(int eventNum);
}
		