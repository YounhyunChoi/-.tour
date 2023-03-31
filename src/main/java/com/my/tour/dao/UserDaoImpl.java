package com.my.tour.dao;

import java.time.LocalDate;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.my.tour.dao.map.UserMap;
import com.my.tour.domain.UserDto;

@Repository
public class UserDaoImpl implements UserDao {
	@Autowired private UserMap userMap;

	@Override
	public List<UserDto> selectUser(String userId) {
		return userMap.selectUser(userId);
	}

	@Override
	public int insertUser(String userId, String userPw, String email, int phoneNum,
						String userName, LocalDate birthday, String mktgAgreement) {
		return userMap.insertUser(userId, userPw, email, phoneNum, userName, birthday, mktgAgreement);
	}
}
