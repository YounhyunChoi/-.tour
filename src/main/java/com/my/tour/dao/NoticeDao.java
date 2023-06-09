package com.my.tour.dao;

import java.util.List;

import com.my.tour.domain.Notice;

public interface NoticeDao {
	List<Notice> selectNotices();
	List<Notice> selectAllNotices();
	List<Notice> selectNotice(int noticeNum);
	int insertNoticeTemp(int noticeTempNum, String adminId);
	void insertNotice(String noticeTitle, String noticeContent, String adminId);
	void updateNotice(Notice notice);
	void deleteNotice(int noticeNum);
}
