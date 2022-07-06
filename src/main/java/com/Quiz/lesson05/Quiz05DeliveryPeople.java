package com.Quiz.lesson05;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.Quiz.lesson05.bo.DeliveryPeopleBO;
import com.Quiz.lesson05.model.DeliveryPeople;

@Controller
public class Quiz05DeliveryPeople {
	
	@Autowired
	DeliveryPeopleBO deliveryPeopleBO;
	
//	http://localhost:8080/lesson05/quiz05-2/mainpage
	@RequestMapping("/lesson05/quiz05-2/mainpage")
	public String quiz05_2(Model model){
		List<DeliveryPeople> dpList = deliveryPeopleBO.getDeliveryPeople();
		
		model.addAttribute("dpList", dpList);
		
		return "lesson05/deliveryPeopleMainPage";
	}
	
//	http://localhost:8080/lesson05/quiz05-2/mainpage
	@RequestMapping("/lesson05/quiz05-2/reviewPage")
	public String quiz05_2_1() {
		
		return "lesson05/deliveryPeopleReviewPage";
	}
	
	@PostMapping("/lesson05/quiz05-2/add")
	public String quiz05_2_2() {
		
		return "redirect:/lesson05/quiz05-2/mainpage";
	}
	
}
