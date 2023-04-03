package com.my.tour.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.my.tour.dao.CommentDao;

@Service
public class CommentServiceImpl implements CommentService{
	@Autowired private CommentDao commentDao;

	@Override
	public int addComment(String comtContent, int reviewNum, String userId) {
		return commentDao.insertComment(comtContent, reviewNum, userId);
	}
	
	@Override
	public int fixComment(String comtContent) {
		return commentDao.updateComment(comtContent);
	}
	
	@Override
	public int delComment(int comtNum) {
		return commentDao.deleteComment(comtNum);
	}
}
