package com.my.tour.dao;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.my.tour.dao.map.NoticeMap;
import com.my.tour.domain.Notice;

@Repository
public class NoticeDaoImpl implements NoticeDao {
	@Autowired private NoticeMap noticeMap;
	
	@Override
	public List<Notice> selectNotices(){
		return noticeMap.selectNotices();
	}
	
	@Override
	public int insertNotice(String noticeTitle, String noticeContent) {
		return noticeMap.insertNotice(noticeTitle, noticeContent);
	}
	
	@Override
	public int updateNotice(Notice notice) {
		return noticeMap.updateNotice(notice);
	}
	
	@Override
	public int deleteNotice(int noticeNum) {
		return noticeMap.deleteNotice(noticeNum);
	}
}
