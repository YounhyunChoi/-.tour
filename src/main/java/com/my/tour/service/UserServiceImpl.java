package com.my.tour.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.my.tour.dao.AdminDao;
import com.my.tour.dao.LogoDao;
import com.my.tour.dao.UserDao;
import com.my.tour.domain.Admin;
import com.my.tour.domain.Logo;
import com.my.tour.domain.User;
import com.my.tour.domain.UserDto;

@Service
public class UserServiceImpl implements UserService {
	@Autowired private UserDao userDao;
	@Autowired private AdminDao adminDao;
	@Autowired private LogoDao logoDao;
	
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
	public void addUser(User user) {
		userDao.insertUser(user);
	}

	@Override
	public List<User> getUsers() {
		return userDao.selectUsers();
	}
	
	@Override
	public List<User> getUser(String userId) {
		return userDao.selectUser(userId);
	}

	@Override
	public void fixUser(User user) {
		userDao.updateUser(user);
	}

	@Override
	public void deleteUser(String userId) {
		userDao.deleteUser(userId);
	}
	
	@Override
	public List<Admin> getAdmin(String adminId) {
		return adminDao.selectAdmin(adminId);
	}

	@Override
	public List<Logo> getLogos() {
		return logoDao.selectLogos();
	}

	@Override
	public void addLogo(String logoName) {
		logoDao.insertLogo(logoName);
	}
}
