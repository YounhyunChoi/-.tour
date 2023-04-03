package com.my.tour.web;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import com.my.tour.domain.Notice;
import com.my.tour.service.NoticeService;

@RestController
@RequestMapping("admin/notice")
public class NoticeAdminController {
	@Autowired private NoticeService noticeService;
	
	@GetMapping
	public ModelAndView main(ModelAndView mv) {
		mv.setViewName("admin/notice/getNotice");
		return mv;
	}
	
	@GetMapping("get")
	public List<Notice> getNotices(){
		return noticeService.getNotices();
	}
	
	@PostMapping("post")
	public void addNotice(String noticeTitle, String noticeContent) {
		noticeService.addNotice(noticeTitle, noticeContent);
	}
	
	@PutMapping("put")
	public void fixNotice(@RequestBody Notice notice) {
		noticeService.fixNotice(notice);
	}
	
	@DeleteMapping("del/noticeNum")
	public void delNotice(@PathVariable int noticeNum) {
		noticeService.delNotice(noticeNum);
	}
}
