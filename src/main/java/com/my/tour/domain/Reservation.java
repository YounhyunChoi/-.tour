package com.my.tour.domain;

import java.time.LocalDate;

import lombok.Data;

@Data
public class Reservation {
	private int resvNum;
	private LocalDate resvDate;
	private String userId;
	private int tourNum;
}
