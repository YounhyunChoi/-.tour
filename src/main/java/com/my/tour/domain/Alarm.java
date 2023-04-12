package com.my.tour.domain;

import lombok.Data;

@Data
public class Alarm {
	private int alarmNum;
	private String alarmContent;
	private String whetherToCheck;
	private String userId;
}
