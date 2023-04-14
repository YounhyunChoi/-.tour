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
	public List<Notice> selectAllNotices(){
		return noticeMap.selectAllNotices();
	}
	
	@Override
	public List<Notice> selectNotice(int noticeNum){
		return noticeMap.selectNotice(noticeNum);
	}
	
	@Override
	public int insertNoticeTemp(int noticeTempNum, String adminId) {
		return noticeMap.insertNoticeTemp(noticeTempNum, adminId);
	}
	
	@Override
	public void insertNotice(String noticeTitle, String noticeContent, String adminId) {
		noticeMap.insertNotice(noticeTitle, noticeContent, adminId);
	}
	
	@Override
	public void updateNotice(Notice notice) {
		noticeMap.updateNotice(notice);
	}
	
	@Override
	public void deleteNotice(int noticeNum) {
		noticeMap.deleteNotice(noticeNum);
	}
}
