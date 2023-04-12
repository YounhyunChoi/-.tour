package com.my.tour.dao;

import java.util.List;

import com.my.tour.domain.Comment;

public interface CommentDao {
	List<Comment> selectComments();
	int insertComment(String comtContent, String userId, int reviewNum);
	int updateComment(String comtContent, int comtNum);
	int deleteComment(int comtNum);
}
