package com.my.tour.domain;

import java.time.LocalDate;

import lombok.Data;

@Data
public class CommentDto {
	private int comtNum;
	private int reviewNum;
	private String tourName;
	private String reviewImageName;
	private String reviewTitle;
	private double score;
	private String reviewUserId;
	private String reviewContent;
	private LocalDate reviewDate;
	private String comtUserId;
	private String comtContent;
	private LocalDate comtDate;
}
