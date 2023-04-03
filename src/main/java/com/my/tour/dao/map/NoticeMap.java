package com.my.tour.dao.map;

import java.util.List;

import com.my.tour.domain.Notice;

public interface NoticeMap {
	List<Notice> selectNotices();
	int insertNotice(String noticeTitle, String noticeContent);
	int updateNotice(Notice notice);
	int deleteNotice(int noticeNum);
}
