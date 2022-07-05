package com.Quiz.lesson05;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.Quiz.lesson05.bo.WeatherBO;
import com.Quiz.lesson05.model.Weather;

@Controller
public class Quiz05Weather {
	
	@Autowired
	WeatherBO weatherBO;
	
//	http://localhost:8080/lesson05/quiz05
	@RequestMapping("/lesson05/quiz05")
	public String quiz05(Model model) {
		List<Weather> weatherList = new ArrayList<Weather>();
		weatherBO.getWeatherList();
		
		model.addAttribute("weatherList", weatherList);
		
		return "lesson05/weather";
	}
	
//	http://localhost:8080/lesson05/quiz05_1
	@GetMapping("/lesson05/quiz05_1")
	public String quiz05_1() {
		
		
		
		return "lesson05/addWeatherView";
	}
	
	@PostMapping("/lesson05/quiz05_addWeather")
	public String addWeather(Model model) {
		
		
		
		return "lesson05/addweather";
	}
	
	
}
