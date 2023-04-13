package com.my.tour.dao;

import java.util.List;

import com.my.tour.domain.EventImage;

public interface EventImageDao {
	List<EventImage> selectEventImages(int eventNum);
	int insertEventImage(String eventImageName, int eventNum);
	int deleteEventImage(int eventNum);
}
