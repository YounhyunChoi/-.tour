package com.my.tour.dao;

public interface CommentDao {
	int insertComment(String comtContent, int reviewNum, String userId);
	int updateComment(String comtContent);
	int deleteComment(int comtNum);
}
