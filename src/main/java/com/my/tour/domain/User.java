package com.my.tour.domain;

import java.time.LocalDate;

import lombok.Data;

@Data
public class User {
	private String userId;
	private String userPw;
	private String email;
	private String phoneNum;
	private String userName;
	private LocalDate birthday;
	private String mktgAgreement;
}
