package com.Quiz.lesson05.dao;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.Quiz.lesson05.model.DeliveryPeople;

@Repository
public interface DeliveryPeopleDAO {
	
	public List<DeliveryPeople> selectDeliveryPeople();
	
}
