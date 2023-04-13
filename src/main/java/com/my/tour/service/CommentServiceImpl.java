package com.my.tour.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.my.tour.dao.CommentDao;
import com.my.tour.dao.ReviewDao;
import com.my.tour.dao.ReviewImageDao;
import com.my.tour.domain.Comment;
import com.my.tour.domain.CommentDto;
import com.my.tour.domain.Review;
import com.my.tour.domain.ReviewImage;

@Service
public class CommentServiceImpl implements CommentService{
	@Autowired private CommentDao commentDao;
	@Autowired private ReviewDao reviewDao;
	@Autowired private ReviewImageDao reviewImageDao;
	
	@Override
	public List<Comment> getComments() {
		return commentDao.selectComments();
	}
	
	@Override
	public List<Comment> getComment(int reviewNum) {
		return commentDao.selectComment(reviewNum);
	}

	@Override
	public List<CommentDto> getCommentDto(int comtNum) {
		return commentDao.selectCommentDto(comtNum);
	}
	
	@Override
	public List<Review> getReview(int reviewNum) {
		return reviewDao.selectReview(reviewNum);
	}

	@Override
	public List<ReviewImage> getReviewImages(int reviewNum) {
		return reviewImageDao.selectReviewImages(reviewNum);
	}

	@Override
	public int addComment(String comtContent, String userId, int reviewNum) {
		return commentDao.insertComment(comtContent, userId, reviewNum);
	}
	
	@Override
	public int fixComment(String comtContent, int comtNum) {
		return commentDao.updateComment(comtContent, comtNum);
	}
	
	@Override
	public int delComment(int comtNum) {
		return commentDao.deleteComment(comtNum);
	}
}
