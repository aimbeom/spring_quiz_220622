package com.Quiz.lesson01;

import java.util.HashMap;
import java.util.Map;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class Quiz01Controller {
	
	
//	http://localhost:8080/lesson01/quiz01/1
	@RequestMapping("/lesson01/quiz01/1")
	@ResponseBody
	//반환값이 String이면 html로 보여준다
	public String test1() {
//		String text = "<h2>테스트 프로젝트 완성</h2><h3>해당 프로젝트를 통해서 문제 풀이를 진행합니다.</h3>";
		return "<strong><h1>테스트 프로젝트 완성</h1><br> 해당 프로젝트를 통해서 문제 풀이를 진행 합니다.</strong>";
	}
	
	
//	http://localhost:8080/lesson01/quiz01/2
	@RequestMapping("/lesson01/quiz01/2")
	@ResponseBody
	public Map<String, Integer> test2(){
		Map<String,Integer> map = new HashMap<String,Integer>();
		map.put("국어", 80);
		map.put("수학", 90);
		map.put("영어", 85);
		
		return map;
	}
}
