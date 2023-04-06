package com.my.tour.domain;

import java.time.LocalDate;

import lombok.Data;

@Data
public class Logo {
	private int logoNum;
	private String logoName;
	private LocalDate logoDate;
}
