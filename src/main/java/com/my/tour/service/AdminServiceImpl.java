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
	

	
}
