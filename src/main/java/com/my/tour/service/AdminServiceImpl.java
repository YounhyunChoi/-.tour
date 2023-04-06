package com.my.tour.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.my.tour.dao.AdminDao;
import com.my.tour.dao.LogoDao;
import com.my.tour.domain.Admin;
import com.my.tour.domain.Logo;

@Service
public class AdminServiceImpl implements AdminService {
	@Autowired AdminDao adminDao;
	@Autowired LogoDao logoDao;

	@Override
	public List<Admin> getAdmin(String adminId) {
		return adminDao.selectAdmin(adminId);
	}

	@Override
	public List<Logo> getLogos() {
		return logoDao.selectLogos();
	}

	@Override
	public int addLogo(String logoName) {
		return logoDao.insertLogo(logoName);
	}
}
