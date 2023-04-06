package com.my.tour.dao.map;

import java.util.List;

import com.my.tour.domain.Logo;

public interface LogoMap {
	List<Logo> selectLogos();
	int insertLogo(String logoName);
}
