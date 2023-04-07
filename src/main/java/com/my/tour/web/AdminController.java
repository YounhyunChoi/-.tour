package com.my.tour.web;

import java.io.File;
import java.io.IOException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.my.tour.AdminAccess;
import com.my.tour.domain.Logo;
import com.my.tour.domain.LogoDto;
import com.my.tour.service.AdminService;

import jakarta.servlet.http.HttpSession;

@RestController
@RequestMapping("admin")
public class AdminController {
	@Autowired AdminService adminService;
	@Value("${attachPath}") private String attachPath;
	
	@GetMapping("nav")
	public ModelAndView navigation(ModelAndView mv) {
		mv.setViewName("admin/navigation/navigation");
		
		return mv;
	}
	
	@GetMapping("main")
	@AdminAccess
	public ModelAndView main(ModelAndView mv, HttpSession session) {
		mv.setViewName("admin/main");
		
		return mv;
	}
	
	@GetMapping("logout")
	public ModelAndView logout(HttpSession session, ModelAndView mv) {
		session.invalidate();
		
		mv.setViewName("redirect:/");
		return mv;
	}
	
	@GetMapping("getLogos")
	public List<Logo> getLogos() {
		return adminService.getLogos();
	}
	
	@PostMapping("addLogo")
	public void addLogo(LogoDto logoDto) {
		String filename = "logo" + logoDto.getLogoImage().getOriginalFilename();
		saveFile(attachPath + "/" + filename, logoDto.getLogoImage());
		
		adminService.addLogo(filename);
	}
	
	private void saveFile(String filename, MultipartFile file) {
		try {
			file.transferTo(new File(filename));
		} catch(IOException e) {}
	}
}
