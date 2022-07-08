package com.Quiz.lesson06;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class Quiz01Controller {
	
//	http://localhost:8080/quiz01/listView
	@RequestMapping("/quiz01/listView")
	public String quiz01() {
		
		return "lesson06/favoriteList";
	}
	
	@PostMapping("/quiz01/addView")
	public String quiz01_1() {
		
		return "lesson06/favoriteAddView";
	}
	
	
}
