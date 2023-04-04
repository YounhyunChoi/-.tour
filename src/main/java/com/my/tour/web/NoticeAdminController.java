package com.my.tour.web;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import com.my.tour.service.NoticeService;

@RestController
@RequestMapping("admin/notice")
public class NoticeAdminController {
	@Autowired private NoticeService noticeService;
	
	@GetMapping
	public ModelAndView noticeList(ModelAndView mv) {
		mv.setViewName("admin/notice/noticeList");
		return mv;
	}
}
