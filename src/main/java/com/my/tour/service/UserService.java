package com.my.tour.service;

import java.util.List;

import com.my.tour.domain.UserDto;

public interface UserService {
	List<UserDto> getUser(String userId, String userPw);
}
