package com.my.tour.dao.map;

import java.util.List;

import com.my.tour.domain.Admin;

public interface AdminMap {
	List<Admin> selectAdmin(String adminId);
}
