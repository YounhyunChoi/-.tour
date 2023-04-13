package com.my.tour.domain;

import java.time.LocalDate;

import lombok.Data;

@Data
public class Event {
	private int eventNum;
	private String eventTitle;
	private String eventContent;
	private LocalDate eventDate;
	private String adminId;
}
