package com.my.tour.dao.map;

public interface CommentMap {
	int insertComment(String comtContent, int reviewNum, String userId);
	int updateComment(String comtContent);
	int deleteComment(int comtNum);
}
