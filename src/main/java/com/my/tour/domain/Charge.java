package com.my.tour.domain;

import lombok.Data;

@Data
public class Charge {
	private int chargeNum;
	private int chargePrice;
	private String userId;
	private int resvNum;
}
