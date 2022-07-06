package com.Quiz.lesson05;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.Quiz.lesson05.bo.WeatherBO;
import com.Quiz.lesson05.model.Weather;

@Controller
public class Quiz05WeatherController {
	
	@Autowired
	WeatherBO weatherBO;
	
//	http://localhost:8080/lesson05/quiz05/1
//	mainpage
	@RequestMapping("/lesson05/quiz05/1")
	public String quiz05(Model model) {
		List<Weather> weatherList = weatherBO.getWeatherList();

		
		model.addAttribute("weatherList", weatherList);
		
		return "lesson05/weather1";
	}
	
//	http://localhost:8080/lesson05/quiz05/2
//	insert page
	@RequestMapping("/lesson05/quiz05/2")
	public String quiz05_1(Model model) {
		
		return "lesson05/addWeatherView";
	}
	
	@PostMapping("/lesson05/quiz05_addWeather")
	public String addWeather(
			@RequestParam("date") String date,
			@RequestParam("weather") String weather,
			@RequestParam("temperature") double temperature,
			@RequestParam("precipitation") double precipitation,
			@RequestParam("microDust") String microDust,
			@RequestParam("windSpeed") double windSpeed,
			Model model) {
		//insert
		weatherBO.addWeatherList(date, weather, temperature, precipitation, microDust, windSpeed);
		
		return "redirect:/lesson05/quiz05/1";
	}
	
	
}
