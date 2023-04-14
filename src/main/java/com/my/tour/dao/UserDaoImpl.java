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
	public void insertUser(User user) {
		userMap.insertUser(user);
	}

	@Override
	public List<User> selectUsers() {
		return userMap.selectUsers();
	}
	
	@Override
	public List<User> selectUser(String userId) {
		return userMap.selectUser(userId);
	}

	@Override
	public void updateUser(User user) {
		userMap.updateUser(user);
	}

	@Override
	public void deleteUser(String userId) {
		userMap.deleteUser(userId);
	}
}
