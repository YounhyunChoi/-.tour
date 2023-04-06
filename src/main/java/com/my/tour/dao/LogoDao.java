package com.my.tour.dao;

import java.util.List;

import com.my.tour.domain.Logo;

public interface LogoDao {
	List<Logo> selectLogos();
	int insertLogo(String logoName);
}
