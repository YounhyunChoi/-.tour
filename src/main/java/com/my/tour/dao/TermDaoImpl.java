package com.my.tour.dao;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.my.tour.dao.map.TermMap;
import com.my.tour.domain.Term;

@Repository
public class TermDaoImpl implements TermDao {
	@Autowired private TermMap termMap;
	
	@Override
	public Term selectTerm(int termNum) {
		return termMap.selectTerm(termNum);
	}
}
