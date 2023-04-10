package com.my.tour.dao.map;

import java.util.List;

import com.my.tour.domain.Notice;

public interface NoticeMap {
	List<Notice> selectNotices();
	List<Notice> selectAllNotices();
	List<Notice> selectNotice(int noticeNum);
	int insertNoticeTemp(String adminId, int noticeSize);
	int insertNotice(String noticeTitle, String noticeContent, String adminId);
	int updateNotice(Notice notice);
	int deleteNotice(int noticeNum);
}
