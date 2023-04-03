package com.my.tour.web;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import com.my.tour.domain.Notice;
import com.my.tour.service.NoticeService;

@RestController
@RequestMapping("notice")
public class NoticeController {
	@Autowired private NoticeService noticeService;
	
	@GetMapping
	public ModelAndView main(ModelAndView mv) {
		mv.setViewName("notice/getNotice");
		return mv;
	}
	
	@GetMapping("get")
	public List<Notice> getNotices(){
		return noticeService.getNotices();
	}
}
