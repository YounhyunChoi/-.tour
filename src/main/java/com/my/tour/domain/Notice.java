package com.my.tour.domain;

import java.time.LocalDate;

import lombok.Data;

@Data
public class Notice {
	private int noticeNum;
	private String noticeTitle;
	private String noticeContent;
	private LocalDate noticeDate;
	private String adminId;
}
