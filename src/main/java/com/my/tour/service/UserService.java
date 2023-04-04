package com.my.tour.service;

import java.util.List;

import com.my.tour.domain.User;
import com.my.tour.domain.UserDto;

public interface UserService {
	List<UserDto> getUserDto(String userId);
	List<UserDto> getUserOrAdmin(String userId);
	int addUser(User user);
	List<User> getUsers();
	int fixUser(User user);
}
