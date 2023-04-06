package com.my.tour.domain;

import java.time.LocalDate;

import org.springframework.web.multipart.MultipartFile;

import lombok.Data;

@Data
public class LogoDto {
	private int logoNum;
	private MultipartFile logoImage;
	private LocalDate logoDate;
}
