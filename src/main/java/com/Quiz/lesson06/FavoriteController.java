package com.Quiz.lesson06;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.Quiz.lesson06.bo.FavoriteBO;
import com.Quiz.lesson06.model.Favorite;

@RequestMapping("/lesson06")
@Controller
public class FavoriteController {
	
	@Autowired
	private FavoriteBO favoriteBO;
	
//	http:/localhost:8080/lesson06/add_favorite_view
	// 즐겨찾기 추가하기 뷰 화면
	@RequestMapping("/add_favorite_view")
	public String addFavoriteView() {
		return "lesson06/addFavoriteView";
	}									
									   
	// AJAX로 들어온 요청은 반드시 @ResponseBody가 붙어있어야 하고, String을 리턴해야 한다.
	// 즐겨찾기 데이터 추가 - AJAX로 들어오는 요청
	// {"name":"신보람"} => JSON String
	// api를 나타내기에 jsp화면이 아님 그래서 view는 붙이지 않는다.
	@ResponseBody
	@PostMapping("/add_favorite")
	public Map<String, Object> addFavorite(
			@RequestParam("name") String name,
			@RequestParam("url") String url) {
		
		// insert db
		favoriteBO.addFavorite(name, url);
		
		// 성공 여부를 map에 담는다.
		// {"result":"success"}
		Map<String, Object> result = new HashMap<>();
		result.put("result", "success");
		result.put("result_code", 1);
		
		// return map
		return result;
	}
	
	// 중복체크 메서드
	// url 중복확인 - ajax로 온 요청
	@ResponseBody
	@PostMapping("/is_duplication")
	public Map<String, Boolean> isDuplicationUrl(
			@RequestParam("url") String url
			){
		
		//결과를 map -> JSON String
		Map<String, Boolean> result = new HashMap<String, Boolean>();
		result.put("is_duplication", false);
		
		// select db
		Favorite favorite = favoriteBO.getFavoriteByUrl(url);
		if(favorite != null) {
			// 중복일 때
			result.put("is_duplication", true);
		}
		return result;
	}
	
//	http:/localhost:8080/lesson06/favorite_list_view
	// 즐겨찾기 목록 화면
	@RequestMapping("/favorite_list_view")
	public String favoriteListView(Model model) {
		// select db
		List<Favorite> favoriteList = favoriteBO.getFavoriteList();
		model.addAttribute("favoriteList", favoriteList);
		return "lesson06/favoriteListView";
	}
	
//	@ResponseBody
//	@PostMapping("/favorite_list_delete")
//	public Map<String, Boolean> isDeleted(){
//		
//	}
	
	
	// 삭제
	// AJAX 요청 - @ResponseBody return Map
	@ResponseBody
	@PostMapping("/delete_favorite")
	public Map<String, Object> deleteFavorite(
			@RequestParam("id") int id) {
		
		// delete db by id
		int deleteRow = favoriteBO.deleteFavoriteById(id);
		
		Map<String, Object> map = new HashMap<>();
		if (deleteRow > 0) {
			map.put("result", "success");
		} else {
			map.put("result", "failure");
		}
		
		return map;
	}
}
