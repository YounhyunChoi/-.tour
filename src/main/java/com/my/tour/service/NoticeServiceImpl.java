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
	@Autowired private NoticeImageDao noticeImagesDao;
	
	@Override
	public List<Notice> getNotices(){
		return noticeDao.selectNotices();
	}
	
	@Override
	public List<Notice> getNotice(int noticeNum){
		return noticeDao.selectNotice(noticeNum);
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
	
	@Override
	public List<NoticeImage> getNoticeImages(){
		return noticeImagesDao.selectNoticeImages();
	}
	
	@Override
	public int addNoticeImage(String noticeImageName) {
		return noticeImagesDao.insertNoticeImage(noticeImageName);
	}
}
