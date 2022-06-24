package com.Quiz.lesson03;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.Quiz.lesson03.bo.RealEstateBO;
import com.Quiz.lesson03.model.RealEstate;

@RestController
public class Lesson03Quiz01RestController {
	
	@Autowired
	RealEstateBO realEstateBO;
	
	// http://localhost:8080/lesson03/quiz01?id=20
	// http://localhost:8080/lesson03/quiz01?rentPrice=90
	// http://localhost:8080/lesson03/quiz01?area=90&price=130000
	
	@RequestMapping("/lesson03/quiz01")
	public List<RealEstate> quiz01(
		@RequestParam("area")int area,
		@RequestParam("price")int price
		){
		return (List<RealEstate>) realEstateBO.getRealEstate(area, price);
	}
}
