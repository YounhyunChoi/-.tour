package com.my.tour.web;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import com.my.tour.domain.Comment;
import com.my.tour.domain.CommentDto;
import com.my.tour.domain.ReviewImage;
import com.my.tour.service.CommentService;

import jakarta.servlet.http.HttpSession;

@RestController
@RequestMapping("comment")
public class CommentController {
	@Autowired private CommentService commentService;
	
	@GetMapping("add")
	@LoginAccess
	public ModelAndView addComment(ModelAndView mv, int reviewNum) {
		mv.setViewName("comment/addComment");
		return mv;
	}
	
	@PostMapping("add")
	public int addComment(String comtContent, HttpSession session, int reviewNum) {
		return commentService.addComment(comtContent, (String) session.getAttribute("userId"), reviewNum);
	}
	
	@GetMapping("get")
	public List<Comment> getComments() {
		return commentService.getComments();
	}
	
	@GetMapping("fix")
	@LoginAccess
	public ModelAndView fixComment(ModelAndView mv, HttpSession session, int comtNum) {
		mv.setViewName("comment/fixComment");
		return mv;
	}
	
	@PutMapping("fix")
	public int fixComment(String comtContent, int comtNum) {
		return commentService.fixComment(comtContent, comtNum);
	}
	
	@DeleteMapping("del/{comtNum}")
	public int delComent(@PathVariable int comtNum) {
		return commentService.delComment(comtNum);
	}
	
	//admin
	@GetMapping("adminList")
	@AdminAccess
	public ModelAndView adminCommentList(ModelAndView mv, HttpSession session) {
		mv.setViewName("admin/comment/commentList");
		return mv;
	}
	
	@GetMapping("adminDel")
	@AdminAccess
	public ModelAndView delComment(ModelAndView mv, HttpSession session,
								int comtNum) {
		CommentDto comment = commentService.getCommentDto(comtNum).get(0);
		List<ReviewImage> reviewImages = commentService.getReviewImages(comment.getReviewNum());
		
		if(reviewImages.size() != 0) {
			comment.setReviewImageName(reviewImages.get(0).getReviewImageName());
		}
		
		mv.setViewName("admin/comment/delComment");
		mv.addObject("comment", commentService.getCommentDto(comtNum).get(0)); 
		
		return mv;
	}
	
	@GetMapping("adminGet")
	public List<Comment> getComment(int comtNum) {
		return commentService.getComment(comtNum);
	}
}
