package com.my.tour.dao.map;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.my.tour.domain.Notice;

public interface NoticeMap {
	List<Notice> selectNotices();
	List<Notice> selectNotice(int noticeNum);
	int insertNotice(String noticeTitle, String noticeContent, String adminId);
}
