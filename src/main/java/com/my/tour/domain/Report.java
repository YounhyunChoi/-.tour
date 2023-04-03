package com.my.tour.domain;

import java.time.LocalDate;

import lombok.Data;

@Data
public class Report {
	private int reportNum;
	private LocalDate reportDate;
	private String userId;
}
