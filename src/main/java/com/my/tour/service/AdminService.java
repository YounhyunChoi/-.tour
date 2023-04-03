package com.my.tour.service;

import java.util.List;

import com.my.tour.domain.Admin;

public interface AdminService {
	List<Admin> getAdmin(String adminId);
}
