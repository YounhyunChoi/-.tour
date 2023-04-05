	package com.my.tour.dao.map;

import java.util.List;

import com.my.tour.domain.User;
import com.my.tour.domain.UserDto;

public interface UserMap {
	List<UserDto> selectUserDto(String userId);
	int insertUser(User user);
	List<User> selectUsers();
	List<User> selectUser(String userId);
	int updateUser(User user);
}
