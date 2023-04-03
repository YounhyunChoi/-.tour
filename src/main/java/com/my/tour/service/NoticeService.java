package com.my.tour.service;

import java.util.List;

import com.my.tour.domain.Notice;

public interface NoticeService {
	List<Notice> getNotices();
	void addNotice(String noticeTitle, String noticeContent);
	void fixNotice(Notice notice);
	void delNotice(int noticeNum);
}
