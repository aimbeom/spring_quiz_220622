package com.Quiz.lesson05.bo;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.Quiz.lesson05.dao.WeatherDAO;
import com.Quiz.lesson05.model.Weather;

@Service
public class WeatherBO {
	
	@Autowired
	WeatherDAO weatherDAO;
	
	public List<Weather> getWeatherList() {
		
		return weatherDAO.selectWeatherList();
	}
}
