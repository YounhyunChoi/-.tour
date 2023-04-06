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

import jakarta.servlet.http.HttpSession;

@RestController
@RequestMapping("comment")
public class CommentController {
	@Autowired private CommentService commentService;
	
	@GetMapping("add")
	public ModelAndView addComment(ModelAndView mv) {
		mv.setViewName("comment/addComment");
		return mv;
	}
	
	@PostMapping("add")
	public int addComment(String comtContent, HttpSession session) {
		return commentService.addComment(comtContent, (String) session.getAttribute("userId"), 1);
	}
	
	@GetMapping("get")
	public List<Comment> getComments() {
		return commentService.getComments();
	}
	
	@GetMapping("fix")
	public ModelAndView fixComment(ModelAndView mv) {
		mv.setViewName("comment/fixComment");
		return mv;
	}
	
	@PutMapping("fix")
	public int fixComment(String comtContent, int comtNum) {
		return commentService.fixComment(comtContent, comtNum);
	}
	
	@DeleteMapping("del")
	public int delComent(@PathVariable int comtNum) {
		return commentService.delComment(comtNum);
	}
}
