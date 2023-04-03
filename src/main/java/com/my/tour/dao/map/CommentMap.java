package com.my.tour.dao.map;

import java.util.List;

import com.my.tour.domain.Comment;

public interface CommentMap {
	List<Comment> selectComments();
	int insertComment(String comtContent);
	int updateComment(String comtContent);
	int deleteComment(int comtNum);
}
