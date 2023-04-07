package com.my.tour.dao.map;

import java.util.List;

import com.my.tour.domain.NoticeImage;

public interface NoticeImageMap {
	List<NoticeImage> selectNoticeImages();
	int insertNoticeImage(String noticeImageName);
}
