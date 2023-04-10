package com.my.tour.domain;

import org.springframework.web.multipart.MultipartFile;

import lombok.Data;

@Data
public class TourImageDto {
	private int tourImageNum;
	private MultipartFile tourImage;
}