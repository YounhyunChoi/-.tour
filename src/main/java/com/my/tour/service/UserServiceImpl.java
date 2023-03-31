package com.my.tour.service;

import java.time.LocalDate;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.my.tour.dao.UserDao;
import com.my.tour.domain.UserDto;

@Service
public class UserServiceImpl implements UserService {
	@Autowired private UserDao userDao;

	@Override
	public List<UserDto> getUser(String userId) {
		return userDao.selectUser(userId);
	}
	
	@Override
	public int addUser(String userId, String userPw, String email, int phoneNum,
						String userName, LocalDate birthday, String mktgAgreement) {
		return userDao.insertUser(userId, userPw, email, phoneNum, userName, birthday, mktgAgreement);
	}
}
