package com.my.tour.domain;


import lombok.Data;

@Data
public class Reservation {
	private int resvNum;
	private int chargePrice;
	private String userId;
	private int tourNum;
}
