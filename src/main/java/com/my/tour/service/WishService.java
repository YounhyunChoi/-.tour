package com.my.tour.service;

import java.util.List;

import com.my.tour.domain.Tour;
import com.my.tour.domain.Wish;

public interface WishService {
	List<Wish> getWishes();
	List<Tour> getTours();
	void addWish(int wishNum, String userId, int tourNum);
	void delWish(int wishNum);
}
