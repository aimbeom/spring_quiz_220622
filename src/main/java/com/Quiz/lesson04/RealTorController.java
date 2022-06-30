package com.Quiz.lesson04;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.Quiz.lesson04.bo.RealTorBO;
import com.Quiz.lesson04.model.RealTor;

@RequestMapping("/lesson04/quiz02")
@Controller
public class RealTorController {
	
	@Autowired
	RealTorBO realtorBO;
	
	// http://localhost:8080/lesson04/quiz02/add_realtor_view
	@GetMapping("/add_realtor_view")
	public String addRealTorView() {
		
		return "lesson04/addRealTorView";
	}
	
	@PostMapping("/add_realtor")
	public String addRealTor(
			@ModelAttribute RealTor realTor,
			Model model
			) {
		
		//insert
		realtorBO.realTor(realTor);
		System.out.println(realTor.getOffice());
		
		//select
		realTor = realtorBO.getRealTorById(realTor.getId());
		model.addAttribute("result", realTor);
		model.addAttribute("title", "공인중개사 정보");
		
		return "lesson04/after_add_realTor";
		
	}
}
