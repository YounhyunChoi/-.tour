package com.my.tour.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.my.tour.dao.AdminDao;
import com.my.tour.dao.UserDao;
import com.my.tour.domain.Admin;
import com.my.tour.domain.User;
import com.my.tour.domain.UserDto;

@Service
public class UserServiceImpl implements UserService {
	@Autowired private UserDao userDao;
	@Autowired private AdminDao adminDao;
	
	@Override
	public List<UserDto> getUserDto(String userId) {
		return userDao.selectUserDto(userId);
	}

	@Override
	public List<UserDto> getUserOrAdmin(String userId) {
		List<UserDto> user = userDao.selectUserDto(userId);
		List<Admin> admin = adminDao.selectAdmin(userId);
		
		if(user.size() == 0 && admin.size() != 0) {
			UserDto temp = new UserDto();
			
			temp.setUserId(admin.get(0).getAdminId());
			temp.setUserPw(admin.get(0).getAdminPw());
			
			user.add(temp);
		}
			
		return user;
	}
	
	@Override
	public int addUser(User user) {
		return userDao.insertUser(user);
	}

	@Override
	public List<User> getUsers() {
		return userDao.selectUsers();
	}

	@Override
	public int fixUser(String userId, String userPw) {
		return userDao.updateUser(userId, userPw);
	}
}
