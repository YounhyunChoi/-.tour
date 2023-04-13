package com.my.tour.dao.map;

import java.util.List;

import com.my.tour.domain.Comment;
import com.my.tour.domain.CommentDto;

public interface CommentMap {
	List<Comment> selectComments();
	List<Comment> selectComment(int reivewNum);
	List<CommentDto> selectCommentDto(int comtNum);
	int insertComment(String comtContent, String userId, int reviewNum);
	int updateComment(String comtContent, int comtNum);
	int deleteComment(int comtNum);
}
