package com.Quiz.lesson03.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import com.Quiz.lesson03.model.RealEstate;

@Repository
public interface RealEstateDAO {
	
	public List<RealEstate> selectRealEstate(@Param("area") int area, @Param("price") int price);
}
