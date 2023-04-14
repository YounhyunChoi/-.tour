package com.my.tour.dao;

import java.util.List;

import com.my.tour.domain.User;
import com.my.tour.domain.UserDto;

public interface UserDao {
	List<UserDto> selectUserDto(String userId);
	void insertUser(User user);
	List<User> selectUsers();
	List<User> selectUser(String userId);
	void updateUser(User user);
	void deleteUser(String userId);
}
