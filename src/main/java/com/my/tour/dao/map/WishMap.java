package com.my.tour.dao.map;

import java.util.List;

import com.my.tour.domain.Wish;

public interface WishMap {
	List<Wish> selectWishes();
	void insertWish(int wishNum, String userId, int tourNum);
	void deleteWish(int wishNum);
}
