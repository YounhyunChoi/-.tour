package com.my.tour.dao;

import java.time.LocalDate;
import java.util.List;

import com.my.tour.domain.UserDto;

public interface UserDao {
	List<UserDto> selectUser(String userId);
	int insertUser(String userId, String userPw, String email, int phoneNum,
			String userName, LocalDate birthday, String mktgAgreement);
}
