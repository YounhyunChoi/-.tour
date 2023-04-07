	package com.my.tour.web;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.my.tour.AdminAccess;
import com.my.tour.GetAccess;
import com.my.tour.domain.Notice;
import com.my.tour.domain.NoticeImage;
import com.my.tour.service.NoticeService;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;

@RestController("noticeController")
@RequestMapping("notice")
public class NoticeController {
	@Autowired private NoticeService noticeService;
	@Value("${attachPath}") private String attachPath;
	
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
	
	@GetMapping("getNoticeImage")
	public List<String> getNoticeImages(int noticeNum){
		List<String> noticeImageName = new ArrayList<String>();
		if(noticeService.getNoticeImages(noticeNum).size() != 0) {
			for(NoticeImage noticeImage : noticeService.getNoticeImages(noticeNum)) {
				noticeImageName.add(noticeImage.getNoticeImageName());			
			}
		}
		
		return noticeImageName;
	}
	
	@PostMapping("addNoticeImages")
	public void addNoticeImages(@RequestParam("noticeImage") List<MultipartFile> noticeImage) {
		int noticeNum = noticeService.getAllNotices().get(0).getNoticeNum();
		String filename = "";
		
		noticeService.delNoticeImage(noticeNum);
		
		for(MultipartFile multipartfile: noticeImage) {
			filename = "notice" + multipartfile.getOriginalFilename();
			saveFile(attachPath + "/" + filename, multipartfile);
			noticeService.addNoticeImage(filename, noticeNum);
		}
	}

	private void saveFile(String filename, MultipartFile file) {
		try {
			file.transferTo(new File(filename));
		} catch(IOException e) {}
	}
	
	@DeleteMapping("delNoticeImages")
	public void delNoticeImages(int noticeNum) {
		noticeService.delNoticeImage(noticeNum);
	}
	
	//어드민
	@GetMapping("adminList")
	@AdminAccess
	public ModelAndView adminNoticeList(ModelAndView mv, HttpSession session) {
		mv.setViewName("admin/notice/getNotice");
		return mv;
	}
	
	@GetMapping("adminAddView")
	public ModelAndView adminAddNotice(ModelAndView mv, HttpSession session) {
		mv.setViewName("admin/notice/addNotice");
		
		if(noticeService.getAllNotices().size() == 0 ||
			!noticeService.getAllNotices().get(0).getNoticeTitle().equals("temp")) {
			noticeService.addNoticeTemp((String) session.getAttribute("userId"), noticeService.getAllNotices().size());
		}
		
		mv.addObject("noticeNum", noticeService.getAllNotices().get(0).getNoticeNum());
		
		return mv;
	}

	@PostMapping("adminAdd")
	public void addNotice(String noticeTitle, String noticeContent, HttpSession session) {
		noticeService.delNotice(noticeService.getAllNotices().get(0).getNoticeNum());
		
		noticeService.addNotice(noticeTitle, noticeContent, (String) session.getAttribute("userId"));	
	}

	@GetMapping("adminFixView")
	public ModelAndView adminFixNotice(ModelAndView mv, HttpSession session, 
										HttpServletRequest request) {
		mv.setViewName("admin/notice/fixNotice");
		
		Notice noticeNum = (noticeService.getNotice((Integer) session.getAttribute("noticeNum")).get(0));
		mv.addObject("noticeNum", noticeNum);
		return mv;
	}
	
	@PutMapping("adminFix")
	public void fixNotice(@RequestBody Notice notice, HttpSession session) {
		notice.setNoticeNum((Integer) session.getAttribute("noticeNum"));
		noticeService.fixNotice(notice);
	}
	
	@DeleteMapping("adminDel")
	public void delNotice(int noticeNum) {
		noticeService.delNotice(noticeNum);
	}
}

