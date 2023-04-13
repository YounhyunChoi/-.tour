package com.my.tour.domain;

import java.time.LocalDate;

import lombok.Data;

@Data
public class ReservationDto {
	private int resvNum;
	private int chargePrice;
	private LocalDate resvDate;
	private String whetherToCancel;
	private LocalDate resvEDate;
	private String userId;
	private int tourNum;
	private String tourName;
	private LocalDate tourSDate;
	private LocalDate tourEDate;
	private int tourPrice;
}
