package com.my.tour.dao;

import java.util.List;

import com.my.tour.domain.Faq;

public interface FaqDao {
	List<Faq> selectFaqs();
	void insertFaq(String faqQuestion, String faqAnswer, String adminId);
}
