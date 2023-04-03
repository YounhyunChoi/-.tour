package com.my.tour.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.my.tour.dao.NoticeDao;
import com.my.tour.domain.Notice;

@Service
public class NoticeServiceImpl implements NoticeService {
	@Autowired private NoticeDao noticeDao;
	
	@Override
	public List<Notice> getNotices(){
		return noticeDao.selectNotices();
	}
	
	@Override
	public void addNotice(String noticeTitle, String noticeContent) {
		noticeDao.insertNotice(noticeTitle, noticeContent);
	}
	
	@Override
	public void fixNotice(Notice notice) {
		noticeDao.updateNotice(notice);
	}
	
	@Override
	public void delNotice(int noticeNum) {
		noticeDao.deleteNotice(noticeNum);
	}
}
