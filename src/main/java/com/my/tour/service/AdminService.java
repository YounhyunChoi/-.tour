package com.my.tour.service;

import java.util.List;

import com.my.tour.domain.Admin;
import com.my.tour.domain.Logo;

public interface AdminService {
	List<Admin> getAdmin(String adminId);
	List<Logo> getLogos();
	int addLogo(String logoName);
}
