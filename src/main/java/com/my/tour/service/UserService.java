package com.my.tour.service;

import java.time.LocalDate;
import java.util.List;

import com.my.tour.domain.UserDto;

public interface UserService {
	List<UserDto> getUser(String userId);
	int addUser(String userId, String userPw, String email, int phoneNum,
					String userName, LocalDate birthday, String mktgAgreement);
}
