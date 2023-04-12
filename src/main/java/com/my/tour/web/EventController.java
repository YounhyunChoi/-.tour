package com.my.tour.web;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import com.my.tour.domain.Event;
import com.my.tour.service.EventService;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;

@RestController("eventController")
@RequestMapping("event")
public class EventController {
	@Autowired EventService eventService;
	@Value("${attachPath}") private String attachPath;
	
	@GetMapping("get")
	@GetAccess
	public List<Event> getEvents(HttpServletRequest request){
		return eventService.getEvents();
	}
	
	@GetMapping
	public ModelAndView noticeList(ModelAndView mv) {
		mv.setViewName("event/eventList");
		return mv;
	}
	
	//어드민
	@GetMapping("adminList")
	@AdminAccess
	public ModelAndView adminEventList(ModelAndView mv, HttpSession session) {
		mv.setViewName("admin/event/adminEventList");
		return mv;
	}
	
	@GetMapping("addEvent")
	@AdminAccess
	public ModelAndView addEvent(ModelAndView mv, HttpSession session) {
		mv.setViewName("admin/event/addEvent");
		return mv;
	}
}
