package com.my.tour.dao;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.my.tour.dao.map.NoticeImageMap;
import com.my.tour.domain.NoticeImage;

@Repository
public class NoticeImageImpl implements NoticeImageDao {
	@Autowired NoticeImageMap noticeImagesMap;
	
	@Override
	public List<NoticeImage> selectNoticeImages(int noticeNum){
		return noticeImagesMap.selectNoticeImages(noticeNum);
	}
	
	@Override
	public int insertNoticeImage(String noticeImageName) {
		return noticeImagesMap.insertNoticeImage(noticeImageName);
	}
}
