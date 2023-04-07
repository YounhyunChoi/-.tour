package com.my.tour.dao.map;

import java.util.List;

import com.my.tour.domain.Comment;

import jakarta.servlet.http.HttpSession;

public interface CommentMap {
	List<Comment> selectComments();
	int insertComment(String comtContent, String userId, int reviewNum);
	int updateComment(String comtContent, int comtNum);
	int deleteComment(int comtNum);
}
