package com.my.tour.service;

import java.util.List;

import com.my.tour.domain.Notice;

public interface NoticeService {
	List<Notice> getNotices();
	List<Notice> getNotice(Notice notice);
	void addNotice(String noticeTitle, String noticeContent, String adminId);
	void fixNotice(Notice notice);
	void delNotice(int noticeNum);
}
