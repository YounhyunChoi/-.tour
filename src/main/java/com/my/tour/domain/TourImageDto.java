package com.my.tour.domain;

import org.springframework.web.multipart.MultipartFile;

import lombok.Data;

@Data
public class TourImageDto {
	private int tourImageId;
	private MultipartFile tourImage;
	private int tourNum;
}
