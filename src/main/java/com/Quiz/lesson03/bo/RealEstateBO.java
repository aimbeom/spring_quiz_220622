package com.Quiz.lesson03.bo;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.Quiz.lesson03.dao.RealEstateDAO;
import com.Quiz.lesson03.model.RealEstate;

@Service
public class RealEstateBO {
	
	@Autowired
	RealEstateDAO realEstateDAO;
	
	public List<RealEstate> getRealEstate(int area, int price) {
		return (List<RealEstate>) realEstateDAO.selectRealEstate(area, price);
	}
}
