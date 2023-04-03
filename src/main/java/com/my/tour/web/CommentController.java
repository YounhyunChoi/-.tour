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
import com.my.tour.service.CommentService;

@RestController
@RequestMapping("comment")
public class CommentController {
	@Autowired private CommentService commentService;
	
	@GetMapping("add")
	public ModelAndView addComment(ModelAndView mv) {
		mv.setViewName("comment/addcomment");
		return mv;
	}
	
	@PostMapping("add")
	public int addComment(String comtContent, int reviewNum, String userId) {
		System.out.println("|" + comtContent + reviewNum + userId + "|");
		return commentService.addComment(comtContent, reviewNum, userId);
	}
	
	@PostMapping("get")
	public List<Comment> getComments() {
		return commentService.getComments();
	}
	
	@GetMapping("fix")
	public ModelAndView fixComment(ModelAndView mv) {
		mv.setViewName("comment/fixcomment");
		return mv;
	}
	
	@PutMapping("fix")
	public int fixComment(String comtContent) {
		return commentService.fixComment(comtContent);
	}
	
	@DeleteMapping("del")
	public int delComent(@PathVariable int comtNum) {
		return commentService.delComment(comtNum);
	}
}
