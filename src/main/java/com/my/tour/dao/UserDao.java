package com.my.tour.dao;

import java.util.List;

import com.my.tour.domain.User;
import com.my.tour.domain.UserDto;

public interface UserDao {
	List<UserDto> selectUserDto(String userId);
	int insertUser(User user);
	List<UserDto> selectUserId(String userName, String email);
}
