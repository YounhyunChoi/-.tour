package com.my.tour.service;

import java.util.List;

import com.my.tour.domain.Notice;
import com.my.tour.domain.NoticeImage;

public interface NoticeService {
	List<Notice> getNotices();
	List<Notice> getNotice(int noticeNum);
	void addNotice(String noticeTitle, String noticeContent, String adminId);
	void fixNotice(Notice notice);
	void delNotice(int noticeNum);
	List<NoticeImage> getNoticeImages();
	int addNoticeImage(String noticeImageName);
}
