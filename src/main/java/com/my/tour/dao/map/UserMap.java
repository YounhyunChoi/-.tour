	package com.my.tour.dao.map;

import java.util.List;

import com.my.tour.domain.UserDto;

public interface UserMap {
	List<UserDto> selectUser(String userId, String userPw);
}
