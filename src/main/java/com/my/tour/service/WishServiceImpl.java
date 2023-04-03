package com.my.tour.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.my.tour.dao.TourDao;
import com.my.tour.dao.WishDao;
import com.my.tour.domain.Tour;
import com.my.tour.domain.Wish;

@Service("WishService")
public class WishServiceImpl implements WishService {
	@Autowired
	private WishDao wishDao;
	
	@Autowired
	private TourDao tourDao;

	@Override
	public List<Wish> getWishes() {
		return wishDao.selectWishes();
	}
	
	@Override
	public List<Tour> getTours() {
		return tourDao.selectTours();
	}

	@Override
	public void addWish(int wishNum, String userId, int tourNum) {
		wishDao.insertWish(wishNum, userId, tourNum);
	}

	@Override
	public void delWish(int wishNum) {
		wishDao.deleteWish(wishNum);
	}
}
