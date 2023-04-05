package com.my.tour.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.my.tour.dao.TermDao;
import com.my.tour.domain.Term;

@Service
public class TermServiceImpl implements TermService{
	@Autowired TermDao termDao;
	
	@Override
	public Term getTerm(int termNum) {
		return termDao.selectTerm(termNum);
	}
}
