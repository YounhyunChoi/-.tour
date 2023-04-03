package com.my.tour.service;

public interface CommentService {
	int addComment(String comtContent, int reviewNum, String userId);
	int fixComment(String comtContent);
	int delComment(int comtNum);
}