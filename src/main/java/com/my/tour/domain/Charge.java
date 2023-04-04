package com.my.tour.domain;

import lombok.Data;

@Data
public class Charge {
	private int chargeNum;
	private Integer chargePrice;
	private String userId;
}
