package com.my.tour.dao.map;

import java.time.LocalDate;
import java.util.List;

import com.my.tour.domain.UserDto;

public interface UserMap {
	List<UserDto> selectUser(String userId);
	int insertUser(String userId, String userPw, String email, int phoneNum,
					String userName, LocalDate birthday, String mktgAgreement);
}
