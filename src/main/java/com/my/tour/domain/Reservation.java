package com.my.tour.domain;


import java.time.LocalDate;

import lombok.Data;

@Data
public class Reservation {
	private int resvNum;
	private int chargePrice;
	private LocalDate resvDate;
	private String whetherToCancel;
	private LocalDate resvEDate;
	private String userId;
	private int tourNum;
}
