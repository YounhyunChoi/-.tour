package com.my.tour.dao;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.my.tour.dao.map.AdminMap;
import com.my.tour.domain.Admin;

@Repository
public class AdminDaoImpl implements AdminDao {
	@Autowired private AdminMap adminMap;

	@Override
	public List<Admin> selectAdmin(String adminId) {
		return adminMap.selectAdmin(adminId);
	}
}
