	package com.my.tour.web;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import com.my.tour.AdminAccess;
import com.my.tour.GetAccess;
import com.my.tour.domain.Notice;
import com.my.tour.domain.User;
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
	
	@GetMapping("getNotice")
	public List<Notice> getNotice(int noticeNum){
		return noticeService.getNotice(noticeNum);
	}
	
	@GetMapping
	public ModelAndView noticeList(ModelAndView mv) {
		mv.setViewName("notice/noticeList");
		return mv;
	}

	@GetMapping("view")
	public ModelAndView noticeView(ModelAndView mv, int noticeNum) {
		mv.setViewName("notice/noticeView");
		mv.addObject("noticeNum", noticeNum);
		return mv;
	}

	//어드민
	@GetMapping("adminList")
	@AdminAccess
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

	@GetMapping("adminFixView")
	public ModelAndView adminFixNotice(ModelAndView mv) {
		mv.setViewName("admin/notice/fixNotice");
		return mv;
	}
	
	@PutMapping("adminFix")
	public void fixNotice(@RequestBody Notice notice, HttpSession session) {
		notice.setNoticeNum((int) session.getAttribute("noticeNum"));
		noticeService.fixNotice(notice);
	}
	
	@DeleteMapping("adminDel")
	public void delNotice(int noticeNum) {
		noticeService.delNotice(noticeNum);
	}
}

