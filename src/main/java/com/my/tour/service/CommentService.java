package com.my.tour.service;

import java.util.List;

import com.my.tour.domain.Comment;
import com.my.tour.domain.CommentDto;
import com.my.tour.domain.ReviewDto;
import com.my.tour.domain.ReviewImage;

public interface CommentService {
	List<Comment> getComments(int reviewNum);
	List<CommentDto> getCommentDto(int comtNum);
	List<ReviewDto> getReview(int reviewNum);
	List<ReviewImage> getReviewImages(int reviewNum);
	int addComment(String comtContent, String userId, int reviewNum);
	int fixComment(String comtContent, int comtNum);
	int delComment(int comtNum);
}