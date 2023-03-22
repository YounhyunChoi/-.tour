package com.my.tour.domain;

import java.time.LocalDate;

import lombok.Data;

@Data
public class User {
	private int userNumber;
	private String userId;
	private String password;
	private String eMail;
	private String nickName;
	private int phoneNumber;
	private String userName;
	private LocalDate birthDay;
}
