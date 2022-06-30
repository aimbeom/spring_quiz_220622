package com.Quiz.lesson04.dao;

import org.springframework.stereotype.Repository;

import com.Quiz.lesson04.model.RealTor;

@Repository
public interface RealTorDAO {
	
	public void insertRealTor(RealTor realtor);
	
	public RealTor selectRealTorById(int id);
}
