package com.my.tour.service;

import java.util.List;

import com.my.tour.domain.Comment;

public interface CommentService {
	List<Comment> getComments();
	int addComment(String comtContent, int reviewNum, String userId);
	int fixComment(String comtContent);
	int delComment(int comtNum);
}