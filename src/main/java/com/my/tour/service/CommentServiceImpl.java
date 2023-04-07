package com.my.tour.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.my.tour.dao.CommentDao;
import com.my.tour.domain.Comment;

import jakarta.servlet.http.HttpSession;

@Service
public class CommentServiceImpl implements CommentService{
	@Autowired private CommentDao commentDao;
	
	@Override
	public List<Comment> getComments() {
		return commentDao.selectComments();
	}

	@Override
	public int addComment(String comtContent, String userId, int reviewNum) {
		return commentDao.insertComment(comtContent, userId, reviewNum);
	}
	
	@Override
	public int fixComment(String comtContent, int comtNum) {
		return commentDao.updateComment(comtContent, comtNum);
	}
	
	@Override
	public int delComment(int comtNum) {
		return commentDao.deleteComment(comtNum);
	}
}
