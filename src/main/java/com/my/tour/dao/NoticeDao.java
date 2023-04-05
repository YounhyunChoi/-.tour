package com.my.tour.dao;

import java.util.List;

import com.my.tour.domain.Notice;

public interface NoticeDao {
	List<Notice> selectNotices();
	List<Notice> selectNotice(int noticeNum);
	int insertNotice(String noticeTitle, String noticeContent, String adminId);
	int updateNotice(Notice notice);
	int deleteNotice(int noticeNum);
}
