package com.Quiz.lesson04.bo;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.Quiz.lesson04.dao.RealTorDAO;
import com.Quiz.lesson04.model.RealTor;

@Service
public class RealTorBO {
	
	@Autowired
	RealTorDAO realtorDAO;
	
	public void realTor(RealTor realtor) {
		realtorDAO.insertRealTor(realtor);
	}
	
	public RealTor getRealTorById(int id) {
		return realtorDAO.selectRealTorById(id);
	}
}
