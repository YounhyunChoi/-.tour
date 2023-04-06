package com.my.tour.dao;

import java.util.List;

import com.my.tour.domain.Wish;

public interface WishDao {
	List<Wish> selectWishes(String userId);
	void insertWish(String userId, int tourNum);
	void deleteWish(int wishNum);
}
