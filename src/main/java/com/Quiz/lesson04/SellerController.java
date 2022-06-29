package com.Quiz.lesson04;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.Quiz.lesson04.bo.SellerBO;
import com.Quiz.lesson04.model.Seller;

@RequestMapping("/lesson04/quiz01")
@Controller
public class SellerController {
	
	@Autowired
	private SellerBO sellerBo;
	
	// http://localhost:8080/lesson04/quiz01/1
	@RequestMapping("/1")
	public String addSellerView() {

		return "lesson04/addSeller";
	}

	// http://localhost:8080/lesson04/quiz01/addSeller
	@PostMapping("/addSeller")
	public String addSeller(@RequestParam("nickname") String nickname,
			@RequestParam(value = "profileImageUrl", required = false) String profileImageUrl,
			@RequestParam("temperature") double temperature) {
		
		sellerBo.addSeller(nickname, profileImageUrl, temperature);
		
		// jsp -> response
		return "lesson04/after_add_seller";
	}
	
	
	//quiz01-2
	// http://localhost:8080/lesson04/quiz01/2/lastSellerView?id=1
	@GetMapping("/2/lastSellerView")
	public String lastSellerView(
			Model model,
			@RequestParam(value = "id", required=false) Integer id
			) {
		Seller seller = null;
		if(id==null) {
			seller = sellerBo.getLastSeller();
			
		} else {
			seller = sellerBo.getSellerById(id);
		}
		model.addAttribute("result", seller);
		return "lesson04/seller_info";
	}
	
	

}