package com.my.tour.service;

import java.util.List;

import com.my.tour.domain.Wish;

public interface WishService {
	List<Wish> getWishes(String userId);
	void addWish(String userId, int tourNum);
	void delWish(int wishNum);
}
