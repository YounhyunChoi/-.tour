package com.my.tour.web;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.my.tour.domain.Alarm;
import com.my.tour.service.AlarmService;

import jakarta.servlet.http.HttpSession;

@RestController
@RequestMapping("alarm")
public class AlarmController {
	@Autowired private AlarmService alarmService;
	
	@GetMapping("get")
	public List<Alarm> getAlarms(HttpSession session){
		return alarmService.getAlarms((String)session.getAttribute("userId"));
	}
	
	@PutMapping("fix")
	public void fixAlarm(HttpSession session, String whetherToCheck) {
		alarmService.fixAlarm((String)session.getAttribute("userId"), whetherToCheck);
	}
	
	@DeleteMapping("del")
	public void delAlarms(int alarmNum) {
		alarmService.delAlarm(alarmNum);
	}
}
