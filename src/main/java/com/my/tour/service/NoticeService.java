package com.my.tour.service;

import java.util.List;

import com.my.tour.domain.Notice;
import com.my.tour.domain.NoticeImage;

public interface NoticeService {
	List<Notice> getNotices();
	List<Notice> getAllNotices();
	List<Notice> getNotice(int noticeNum);
	void addNoticeTemp(int noticeTempNum, String adminId);
	void addNotice(String noticeTitle, String noticeContent, String adminId);
	void fixNotice(Notice notice);
	void delNotice(int noticeNum);
	List<NoticeImage> getNoticeImages(int noticeNum);
	int addNoticeImage(String noticeImageName, int noticeNum);
	int delNoticeImage(int noticeNum);
}
