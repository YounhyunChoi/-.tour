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
	
	@GetMapping("get")
	public List<Notice> getNotices(){
		return noticeService.getNotices();
	}
	
	@GetMapping("list")
	public ModelAndView noticeList(ModelAndView mv) {
		mv.setViewName("notice/noticeList");
		return mv;
	}
}
