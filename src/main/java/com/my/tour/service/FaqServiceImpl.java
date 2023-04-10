package com.my.tour.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.my.tour.dao.FaqDao;
import com.my.tour.domain.Faq;

@Service
public class FaqServiceImpl implements FaqService {
	@Autowired private FaqDao faqDao;
	
	@Override
	public List<Faq> getFaqs(){
		return faqDao.selectFaqs();
	}
	
	@Override
	public void addFaq(String faqQuestion, String faqAnswer, String adminId) {
		faqDao.insertFaq(faqQuestion, faqAnswer, adminId);
	}
	@Override
	public void delFaq(String faqQuestion) {
		faqDao.deleteFaq(faqQuestion);
	}
}
