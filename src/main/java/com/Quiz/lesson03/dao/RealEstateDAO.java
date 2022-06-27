package com.Quiz.lesson03.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import com.Quiz.lesson03.model.RealEstate;

@Repository
public interface RealEstateDAO {

	//1
	public List<RealEstate> selectRealEstateListById(@Param("id") int id);	
	//2
	public List<RealEstate> selectRealEstateListByRentPrice(@Param("rentPrice") int rentPrice);
	//강사코드
	//public List<RealEstate> selectRealEstateListByRentPrice(int rentPrice);
	//3
	public List<RealEstate> selectRealEstate(@Param("area") int area, @Param("price") int price);
	
	//2-1
	public int insertRealEstate(RealEstate re);
	
	//2-2
	public int insertRealEstateAsField(
			@Param("realtorId") int realtor_id,
			@Param("address") String address,
			@Param("area") int area,
			@Param("type") String type,
			@Param("price") double price,
			@Param("rentPrice") int rentPrice);
}
