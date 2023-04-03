package com.my.tour.dao;

import java.util.List;

import com.my.tour.domain.Notice;

public interface NoticeDao {
	List<Notice> selectNotices();
}
