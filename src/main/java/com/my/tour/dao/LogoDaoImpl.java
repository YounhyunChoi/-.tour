package com.my.tour.dao;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.my.tour.dao.map.LogoMap;
import com.my.tour.domain.Logo;

@Repository
public class LogoDaoImpl implements LogoDao {
	@Autowired LogoMap logoMap;

	@Override
	public List<Logo> selectLogos() {
		return logoMap.selectLogos();
	}

	@Override
	public int insertLogo(String logoName) {
		return logoMap.insertLogo(logoName);
	}
}
