	package com.my.tour.web;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import com.my.tour.GetAccess;
import com.my.tour.domain.Notice;
import com.my.tour.service.NoticeService;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;

@RestController("noticeController")
@RequestMapping("notice")
public class NoticeController {
	@Autowired private NoticeService noticeService;
	
	@GetMapping("get")
	@GetAccess
	public List<Notice> getNotices(HttpServletRequest request){
		return noticeService.getNotices();
	}
	
	@GetMapping
	public ModelAndView noticeList(ModelAndView mv) {
		mv.setViewName("notice/noticeList");
		return mv;
	}

	@GetMapping("view")
	public ModelAndView noticeView(ModelAndView mv, int noticeNum) {
		mv.setViewName("notice/noticeView");
		return mv;
	}
	
	//어드민
	@GetMapping("adminList")
	public ModelAndView adminNoticeList(ModelAndView mv, HttpSession session) {
		mv.setViewName("admin/notice/getNotice");
		return mv;
	}
	
	@GetMapping("adminAddView")
	public ModelAndView adminAddNotice(ModelAndView mv) {
		mv.setViewName("admin/notice/addNotice");
		return mv;
	}

	@PostMapping("adminAdd")
	public void addNotice(String noticeTitle, String noticeContent, HttpSession session) {
		noticeService.addNotice(noticeTitle, noticeContent, (String) session.getAttribute("userId"));	
	}

}

/*
  @RestController
@RequestMapping("admin/notice")
public class NoticeAdminController {
	@Autowired private NoticeService noticeService;
	
	@GetMapping
	public ModelAndView noticeList(ModelAndView mv) {
		mv.setViewName("admin/notice/noticeList");
		return mv;
	}*/
