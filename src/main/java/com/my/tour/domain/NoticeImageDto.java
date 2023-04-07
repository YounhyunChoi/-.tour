package com.my.tour.domain;

import org.springframework.web.multipart.MultipartFile;

import lombok.Data;

@Data
public class NoticeImageDto {
	private int noticeImageId;
	private MultipartFile noticeImage;
	private int noticeNum;
}
