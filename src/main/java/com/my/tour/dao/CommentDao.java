package com.my.tour.dao;

import java.util.List;

import com.my.tour.domain.Comment;
import com.my.tour.domain.CommentDto;

public interface CommentDao {
	List<Comment> selectComments(int reviewNum);
	List<CommentDto> selectCommentDto(int comtNum);
	int insertComment(String comtContent, String userId, int reviewNum);
	int updateComment(String comtContent, int comtNum);
	int deleteComment(int comtNum);
}
