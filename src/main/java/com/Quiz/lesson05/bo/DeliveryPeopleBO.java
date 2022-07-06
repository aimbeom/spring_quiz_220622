package com.Quiz.lesson05.bo;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.Quiz.lesson05.dao.DeliveryPeopleDAO;
import com.Quiz.lesson05.model.DeliveryPeople;

@Service
public class DeliveryPeopleBO {
	
	@Autowired
	DeliveryPeopleDAO deliveryPeopleDAO;
	
	public List<DeliveryPeople> getDeliveryPeople(){
		
		return deliveryPeopleDAO.selectDeliveryPeople();
	}
}
