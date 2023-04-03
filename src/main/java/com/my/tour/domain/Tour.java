package com.my.tour.domain;

import java.time.LocalDate;

import lombok.Data;

@Data
public class Tour {
	private int tourNum;
	private String tourName;
	private String tourContent;
	private LocalDate tourSDate;
	private LocalDate tourEDate;
	private int tourPrice;
	private String adminId;
	private int termNum;
}
