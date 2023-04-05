package com.my.tour.domain;

import org.springframework.web.multipart.MultipartFile;

import lombok.Data;

@Data
public class NoticeImagesDto {
	private int noticeImagesNum;
	private MultipartFile noticeImage;
	private int noticeNum;
}
