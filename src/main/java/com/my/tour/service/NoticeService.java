package com.my.tour.service;

import java.util.List;

import com.my.tour.domain.Notice;

public interface NoticeService {
	List<Notice> getNotices();
	List<Notice> getNotice(int noticeNum);
	void addNotice(String noticeTitle, String noticeContent);
}
