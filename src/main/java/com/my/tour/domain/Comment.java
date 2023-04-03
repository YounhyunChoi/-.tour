package com.my.tour.domain;

import java.time.LocalDate;

import lombok.Data;

@Data
public class Comment {
	private int comtNum;
	private String comtContent;
	private LocalDate comtDate;
	private int reviewNum;
	private String userId;
}
