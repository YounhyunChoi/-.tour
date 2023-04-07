package com.my.tour.service;

import java.util.List;

import com.my.tour.domain.Comment;

import jakarta.servlet.http.HttpSession;

public interface CommentService {
	List<Comment> getComments();
	int addComment(String comtContent, String userId, int reviewNum);
	int fixComment(String comtContent, int comtNum);
	int delComment(int comtNum);
}