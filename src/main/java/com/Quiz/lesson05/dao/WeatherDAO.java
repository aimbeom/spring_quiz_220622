package com.Quiz.lesson05.dao;

import org.springframework.stereotype.Repository;

@Repository
public interface WeatherDAO {
	
	public void selectWeatherList();
}
