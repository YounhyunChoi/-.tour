package com.my.tour.dao;

import java.util.List;

import com.my.tour.domain.Admin;

public interface AdminDao {
	List<Admin> selectAdmin(String adminId);
}
