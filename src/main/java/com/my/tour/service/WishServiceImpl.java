package com.my.tour.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.my.tour.dao.WishDao;
import com.my.tour.domain.Wish;

@Service("WishService")
public class WishServiceImpl implements WishService {
	@Autowired
	private WishDao wishDao;
	
	@Override
	public List<Wish> getWishes(String userId) {
		return wishDao.selectWishes(userId);
	}

	@Override
	public void addWish(String userId, int tourNum) {
		wishDao.insertWish(userId, tourNum);
	}

	@Override
	public void delWish(int wishNum) {
		wishDao.deleteWish(wishNum);
	}
}
