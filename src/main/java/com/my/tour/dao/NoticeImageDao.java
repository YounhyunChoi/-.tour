package com.my.tour.dao;

import java.util.List;

import com.my.tour.domain.NoticeImage;

public interface NoticeImageDao {
	List<NoticeImage> selectNoticeImages(int noticeNum);
	int insertNoticeImage(String noticeImageName);
}
