package com.my.tour.dao;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.my.tour.dao.map.FaqMap;
import com.my.tour.domain.Faq;

@Repository
public class FaqDaoImpl implements FaqDao{
	@Autowired private FaqMap faqMap;
	
	@Override
	public List<Faq> selectFaqs(){
		return faqMap.selectFaqs();
	}
}
