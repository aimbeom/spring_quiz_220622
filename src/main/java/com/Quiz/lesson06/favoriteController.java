package com.Quiz.lesson06;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.Quiz.lesson06.bo.FavoriteBO;
import com.Quiz.lesson06.model.Favorite;

@Controller
public class favoriteController {
	
	@Autowired
	private FavoriteBO favoriteBO;
	
//	http://localhost:8080/quiz01/listView?id=4
	@RequestMapping("/quiz01/listView")
	public String quiz01(Model model) {
		List<Favorite> fl = favoriteBO.getFavorite();
		
		model.addAttribute("favoriteList", fl);
		
		return "lesson06/favoriteList";
	}
	
//	http://localhost:8080/quiz01/addView
	@RequestMapping("/quiz01/addView")
	public String quiz01_2() {
		
		return "lesson06/favoriteAddView";
	}
	
	@PostMapping("/quiz01/add")
	public String quiz01_1(
			@RequestParam int id,
			@RequestParam String name,
			@RequestParam String url
			) {
		
		//insert db
		favoriteBO.addFavorite(id, name, url);
		
		return "redirect:/quiz01/listView?id=4";
	}

	
	
}
