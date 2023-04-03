package com.my.tour.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.my.tour.dao.UserDao;
import com.my.tour.domain.User;
import com.my.tour.domain.UserDto;

@Service
public class UserServiceImpl implements UserService {
	@Autowired private UserDao userDao;

	@Override
	public List<UserDto> getUser(String userId) {
		return userDao.selectUser(userId);
	}
	
	@Override
	public int addUser(User user) {
		return userDao.insertUser(user);
	}
}
