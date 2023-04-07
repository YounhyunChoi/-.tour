package com.my.tour.service;

import java.util.List;

import com.my.tour.domain.Faq;

public interface FaqService {
	List<Faq> getFaqs();
	void addFaq(String faqQuestion, String faqAnswer, String adminId);
}
