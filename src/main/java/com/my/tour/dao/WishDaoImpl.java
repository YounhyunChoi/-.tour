package com.my.tour.dao;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.my.tour.dao.map.WishMap;
import com.my.tour.domain.Wish;

@Repository("WishDao")
public class WishDaoImpl implements WishDao {
	@Autowired
	private WishMap wishMap;

	@Override
	public List<Wish> selectWishes() {
		return wishMap.selectWishes();
	}

	@Override
	public void insertWish(int wishNum, String userId, int tourNum) {
		wishMap.insertWish(wishNum, userId, tourNum);
	}

	@Override
	public void deleteWish(int wishNum) {
		wishMap.deleteWish(wishNum);
	}
}
