package com.my.tour.dao;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.my.tour.dao.map.CommentMap;
import com.my.tour.domain.Comment;
import com.my.tour.domain.CommentDto;

@Repository
public class CommentDaoImpl implements CommentDao{
	@Autowired private CommentMap commentMap;
	
	@Override
	public List<Comment> selectComments() {
		return commentMap.selectComments();
	}
	
	@Override
	public List<Comment> selectComments(int reviewNum) {
		return commentMap.selectComments(reviewNum);
	}

	@Override
	public List<CommentDto> selectCommentDto(int comtNum) {
		return commentMap.selectCommentDto(comtNum);
	}
	
	@Override
	public int insertComment(String comtContent, String userId, int reviewNum) {
		return commentMap.insertComment(comtContent, userId, reviewNum);
	}
	
	@Override
	public int updateComment(String comtContent, int comtNum) {
		return commentMap.updateComment(comtContent, comtNum);
	}
	
	@Override
	public int deleteComment(int comtNum) {
		return commentMap.deleteComment(comtNum);
	}
}
