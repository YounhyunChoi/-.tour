package com.my.tour.domain;

import java.time.LocalDate;

import lombok.Data;

@Data
public class ReviewDto {
	private int reviewNum;
	private String tourName;
	private String reviewTitle;
	private double score;
	private LocalDate reviewDate;
	private String userId;
	private String reviewImageName;
	private int tourNum;
}
