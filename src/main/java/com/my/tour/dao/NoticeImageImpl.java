package com.my.tour.dao;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.my.tour.dao.map.NoticeImageMap;
import com.my.tour.domain.NoticeImage;

@Repository
public class NoticeImageImpl implements NoticeImageDao {
	@Autowired NoticeImageMap noticeImageMap;
	
	@Override
	public List<NoticeImage> selectNoticeImages(int noticeNum){
		return noticeImageMap.selectNoticeImages(noticeNum);
	}
	
	@Override
	public int insertNoticeImage(String noticeImageName, int noticeNum) {
		return noticeImageMap.insertNoticeImage(noticeImageName, noticeNum);
	}

	@Override
	public int deleteNoticeImage(int notiecNum) {
		return noticeImageMap.deleteNoticeImage(notiecNum);
	}
}
