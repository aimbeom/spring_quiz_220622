package com.Quiz.lesson05.bo;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.Quiz.lesson05.dao.WeatherDAO;

@Service
public class WeatherBO {
	
	@Autowired
	WeatherDAO weatherDAO;
	
	public void getWeatherList() {
		
	}
}
