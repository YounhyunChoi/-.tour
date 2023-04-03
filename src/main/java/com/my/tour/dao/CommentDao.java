package com.my.tour.dao;

import java.util.List;

import com.my.tour.domain.Comment;

public interface CommentDao {
	List<Comment> selectComments();
	int insertComment(String comtContent, int reviewNum, String userId);
	int updateComment(String comtContent);
	int deleteComment(int comtNum);
}
