package com.my.tour.dao;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.my.tour.dao.map.CommentMap;
import com.my.tour.domain.Comment;

@Repository
public class CommentDaoImpl implements CommentDao{
	@Autowired private CommentMap commentMap;
	
	@Override
	public List<Comment> selectComments() {
		return commentMap.selectComments();
	}
	
	@Override
	public int insertComment(String comtContent) {
		return commentMap.insertComment(comtContent);
	}
	
	@Override
	public int updateComment(String comtContent) {
		return commentMap.updateComment(comtContent);
	}
	
	@Override
	public int deleteComment(int comtNum) {
		return commentMap.deleteComment(comtNum);
	}
}
