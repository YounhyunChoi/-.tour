package com.my.tour.service;

import java.util.List;

import com.my.tour.domain.Admin;
import com.my.tour.domain.Logo;
import com.my.tour.domain.User;
import com.my.tour.domain.UserDto;

public interface UserService {
	List<UserDto> getUserDto(String userId);
	List<UserDto> getUserOrAdmin(String userId);
	void addUser(User user);
	List<User> getUsers();
	List<User> getUser(String userId); 
	void fixUser(User user);
	void deleteUser(String userId);
	List<Admin> getAdmin(String adminId);
	List<Logo> getLogos();
	void addLogo(String logoName);
}
