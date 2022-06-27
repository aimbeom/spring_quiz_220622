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
	
	// http://localhost:8080/lesson03/quiz01/1?id=20
	@RequestMapping("/lesson03/quiz01/1")
	public List<RealEstate> quiz01_1(
		@RequestParam("id")int id
		){
		return (List<RealEstate>) realEstateBO.getRealEstateListById(id);
	}
	
	// http://localhost:8080/lesson03/quiz01/2?rentPrice=90
	@RequestMapping("/lesson03/quiz01/2")
	public List<RealEstate> quiz01_2(
		@RequestParam("rentPrice")int rentPrice
		){
		return (List<RealEstate>) realEstateBO.getRealEstateListByRentPrice(rentPrice);
	}
	
	
	// http://localhost:8080/lesson03/quiz01/3?area=90&price=130000
	@RequestMapping("/lesson03/quiz01/3")
	public List<RealEstate> quiz01_3(
		@RequestParam("area")int area,
		@RequestParam("price")int price
		){
		return (List<RealEstate>) realEstateBO.getRealEstate(area, price);
	}
	
	// http://localhost:8080/lesson03/quiz02/1
	@RequestMapping("/lesson03/quiz02/1")
	public String quiz02_1(RealEstate re){
		RealEstate re1 = new RealEstate();
		re1.setRealtorId(3);
		re1.setAddress("푸르지용 리버 303동 1104호");
		re1.setArea(89);
		re1.setType("매매");
		re1.setPrice(100000);
		
		int row = realEstateBO.addRealEstate(re1);
		return row > 0 ? row + "행 입력 성공했습니다." : "실패했습니다.";
	}
	
	// http://localhost:8080/lesson03/quiz02/2?realtor_id=5
	// 수정하기
	@RequestMapping("/lesson03/quiz02/2")
	public String quiz02_2(
		@RequestParam("realtor_id")int realtorId
		) {
		int row = realEstateBO.addRealEstateAsField(realtorId,"썅떼빌리버 오피스텔 814호", 45, "월세", 100000, 120);
		return row > 0 ? row + "행 입력 성공했습니다." : "실패했습니다.";
	}
}
