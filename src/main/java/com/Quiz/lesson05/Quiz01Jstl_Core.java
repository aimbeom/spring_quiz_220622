package com.Quiz.lesson05;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class Quiz01Jstl_Core {
	 
//	http://localhost:8080/lesson05/quiz01/1
	@RequestMapping("/lesson05/quiz01/1")
	public String quiz01_1() {			 			
										 
		return "lesson05/jstl_core";	 
	}	 
}	
