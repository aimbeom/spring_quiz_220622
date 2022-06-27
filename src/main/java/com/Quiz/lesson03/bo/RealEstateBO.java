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
	
	//1
	public List<RealEstate> getRealEstateListById(int id) {
		return (List<RealEstate>) realEstateDAO.selectRealEstateListById(id);
	}
	
	//2
	public List<RealEstate> getRealEstateListByRentPrice(int rentPrice) {
		return (List<RealEstate>) realEstateDAO.selectRealEstateListByRentPrice(rentPrice);
	}
	//3
	public List<RealEstate> getRealEstate(int area, int price) {
		return (List<RealEstate>) realEstateDAO.selectRealEstate(area, price);
	}
	
	//2-1
	public int addRealEstate(RealEstate re) {
		return realEstateDAO.insertRealEstate(re);
	}
	
	//2-2
	public int addRealEstateAsField(int realtor_id ,String address, int area, String type, double price, int rentPrice) {
		return realEstateDAO.insertRealEstateAsField(realtor_id, address, area, type, price, rentPrice);
	}
}
