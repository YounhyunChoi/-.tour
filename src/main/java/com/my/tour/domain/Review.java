package com.my.tour.domain;

import java.time.LocalDate;

import lombok.Data;

@Data
public class Review {
	private int reviewNum;
	private String reviewTitle;
	private String reviewContent;
	private double score;
	private LocalDate reviewDate;
	private String userId;
	private int tourNum;
}
