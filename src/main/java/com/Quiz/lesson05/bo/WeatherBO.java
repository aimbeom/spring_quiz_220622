package com.Quiz.lesson05.bo;

import java.util.Date;
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
	
	public void addWeatherList(
			String date,
			String weather,
			double temperatures,
			double precipitation,
			String microDust,
			double windSpeed
			) {
		
		weatherDAO.insertWeatherList(date, weather, temperatures,
				precipitation, microDust, windSpeed
				);
	}
}
