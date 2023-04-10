package com.my.tour.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.my.tour.dao.NoticeDao;
import com.my.tour.dao.NoticeImageDao;
import com.my.tour.domain.Notice;
import com.my.tour.domain.NoticeImage;

@Service
public class NoticeServiceImpl implements NoticeService {
	@Autowired private NoticeDao noticeDao;
	@Autowired private NoticeImageDao noticeImageDao;
	
	@Override
	public List<Notice> getNotices(){
		return noticeDao.selectNotices();
	}
	
	@Override
	public List<Notice> getAllNotices(){
		return noticeDao.selectAllNotices();
	}
	
	@Override
	public List<Notice> getNotice(int noticeNum){
		return noticeDao.selectNotice(noticeNum);
	}

	@Override
	public void addNoticeTemp(String adminId, int noticeSize) {
		noticeDao.insertNoticeTemp(adminId, noticeSize);
	}
	
	@Override
	public void addNotice(String noticeTitle, String noticeContent, String adminId) {
		noticeDao.insertNotice(noticeTitle, noticeContent, adminId);
	}
	
	@Override
	public void fixNotice(Notice notice) {
		noticeDao.updateNotice(notice);
	}
	
	@Override
	public void delNotice(int noticeNum) {
		noticeDao.deleteNotice(noticeNum);
	}
	
	@Override
	public List<NoticeImage> getNoticeImages(int noticeNum){
		return noticeImageDao.selectNoticeImages(noticeNum);
	}
	
	@Override
	public int addNoticeImage(String noticeImageName, int noticeNum) {
		return noticeImageDao.insertNoticeImage(noticeImageName, noticeNum);
	}

	@Override
	public int delNoticeImage(int noticeNum) {
		return noticeImageDao.deleteNoticeImage(noticeNum);
	}
}
