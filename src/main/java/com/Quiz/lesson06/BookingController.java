package com.Quiz.lesson06;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.Quiz.lesson06.bo.BookingBO;
import com.Quiz.lesson06.model.Booking;

@RequestMapping("/lesson06")
@Controller
public class BookingController {
	
	@Autowired
	BookingBO bookingBO;
	
//	http://localhost:8080/lesson06/booking_list
	@RequestMapping("/booking_list")
	public String listpage(Model model) {
		
		List<Booking> bookingList = bookingBO.getBookingList();
		
		model.addAttribute("bookingList", bookingList);
		
		return "lesson06/bookingListPage";
	}
	
	@ResponseBody
	@PostMapping("/del_list")
	public Map<String, Object> delet_List(
			@RequestParam("id") int id
			){
		
		// db
		int deleteRow = bookingBO.deleteBookingListById(id);
	    
	    Map<String, Object> map = new HashMap<>();
		if (deleteRow > 0) {
			map.put("result", "success");
		} else {
			map.put("result", "failure");
		}
		
		return map;
	}
	
	// type: delete method
	// POST / GET / PUT
	
	// POST - 데이터를 처음 삽입할 때 사용
	// GET - 데이터를 가져올 때 OR 주소창을 처음 들어갈 때 주로 사용
	// PUT - 수정할 때 사용
	
	@GetMapping("/booking_page")
	public String bookingPage() {
		
		return "lesson06/bookingPage";
	}
	
	
	
	
	
	
	
	
	
	
	
}
