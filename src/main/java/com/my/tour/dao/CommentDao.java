package com.my.tour.dao;

import java.util.List;

import com.my.tour.domain.Comment;
import com.my.tour.domain.CommentDto;

import jakarta.servlet.http.HttpSession;

public interface CommentDao {
	List<Comment> selectComments();
	List<Comment> selectComment(int reviewNum);
	List<CommentDto> selectCommentDto(int comtNum);
	int insertComment(String comtContent, String userId, int reviewNum);
	int updateComment(String comtContent, int comtNum);
	int deleteComment(int comtNum);
}
