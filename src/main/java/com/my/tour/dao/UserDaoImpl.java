package com.my.tour.dao;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.my.tour.dao.map.UserMap;
import com.my.tour.domain.User;
import com.my.tour.domain.UserDto;

@Repository
public class UserDaoImpl implements UserDao {
	@Autowired private UserMap userMap;

	@Override
	public List<UserDto> selectUserDto(String userId) {
		return userMap.selectUserDto(userId);
	}

	@Override
	public int insertUser(User user) {
		return userMap.insertUser(user);
	}

	@Override
	public List<UserDto> selectUserId(String userName, String email) {
		return userMap.selectUserId(userName, email);
	}
}
