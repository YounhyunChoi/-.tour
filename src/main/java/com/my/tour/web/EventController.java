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

import com.my.tour.domain.Event;
import com.my.tour.domain.EventImage;
import com.my.tour.service.EventService;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;

@RestController("eventController")
@RequestMapping("event")
public class EventController {
	@Autowired private EventService eventService;
	@Value("${attachPath}") private String attachPath;
	
	@GetMapping("get")
	@GetAccess
	public List<Event> getEvents(HttpServletRequest request){
		return eventService.getEvents();
	}
	
	@GetMapping("getEvent")
	@GetAccess
	public List<Event> getEvent(int eventNum){
		return eventService.getEvent(eventNum);
	}
	
	@GetMapping
	public ModelAndView eventList(ModelAndView mv) {
		mv.setViewName("event/eventList");
		return mv;
	}
	
	@GetMapping("view")
	public ModelAndView eventView(ModelAndView mv, int eventNum) {
		mv.setViewName("event/eventView");
		mv.addObject("eventNum", eventNum);
		return mv;
	}
	
	//어드민
	@GetMapping("adminList")
	@AdminAccess
	public ModelAndView adminEventList(ModelAndView mv, HttpSession session) {
		mv.setViewName("admin/event/adminEventList");
		return mv;
	}
	
	@GetMapping("add")
	@AdminAccess
	public ModelAndView addEvent(ModelAndView mv, HttpSession session) {
		mv.setViewName("admin/event/addEvent");
		
		if(session.getAttribute("userId") != null) {
			if(eventService.getAllEvents().size() == 0) {
				eventService.addEventTemp(1, (String) session.getAttribute("userId"));
			} else if(!eventService.getAllEvents().get(0).getEventTitle().equals("temp")) {
				eventService.addEventTemp(eventService.getEvents().get(0).getEventNum() + 1, 
											(String) session.getAttribute("userId"));
			}
			
			mv.addObject("eventNum", eventService.getAllEvents().get(0).getEventNum());
		}
		return mv;
	}
	
	@PostMapping("add")
	public void addEvent(String eventTitle, String eventContent, HttpSession session) {
		eventService.delEvent(eventService.getAllEvents().get(0).getEventNum());
		eventService.addEvent(eventTitle, eventContent, (String) session.getAttribute("userId"));
	}
	
	@GetMapping("fix")
	@AdminAccess
	public ModelAndView fixEvent(ModelAndView mv, HttpSession session, int eventNum) {
		mv.setViewName("admin/event/fixEvent");
		mv.addObject("eventNum", eventNum);
		return mv;
	}
	
	@PutMapping("fix")
	public void fixEvent(@RequestBody Event event) {
		eventService.fixEvent(event);
		
	}
	
	@DeleteMapping("del")
	public void delEvent(int eventNum) {
		eventService.delEvent(eventNum);
	}
	
	//image
	@GetMapping("getEventImage")
	@AdminAccess
	public List<String> getEventImages(int eventNum){
		List<String> eventImageName = new ArrayList<String>();
		if(eventService.getEventImages(eventNum).size() != 0) {
			for(EventImage eventImage : eventService.getEventImages(eventNum)) {
				eventImageName.add(eventImage.getEventImageName());
			}
		}

		return eventImageName;
	}
	
	@PostMapping("addEventImages")
	public boolean addEventImages(@RequestParam("eventImage") List<MultipartFile> eventImage) {
		if(eventImage.size() > 4) {
			return false;
		} else {
			int eventNum = eventService.getAllEvents().get(0).getEventNum();
			String filename = "";
			
			eventService.delEventImage(eventNum);
			
			for(MultipartFile multipartFile : eventImage) {
				filename = "event" + multipartFile.getOriginalFilename();
				if(!filename.equals("event")) {
					saveFile(attachPath + "/" + filename, multipartFile);
					eventService.addEventImage(filename, eventNum);
				}
			}
			return true;
		}
	}
	
	private void saveFile(String filename, MultipartFile file) {
		try {
			file.transferTo(new File(filename));
		} catch(IOException e) {}
	}
	
	@DeleteMapping("delEventImages")
	public void delEventImages(int eventNum) {
		eventService.delEventImage(eventNum);
	}
}
