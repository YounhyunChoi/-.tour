package com.my.tour.dao.map;

import java.util.List;

import com.my.tour.domain.Faq;

public interface FaqMap {
	List<Faq> selectFaqs();
	int insertFaq(String faqQuestion, String faqAnswer, String adminId);
}
