package com.Quiz.lesson06;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
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
	
	//예약 리스트 페이지
//	http://localhost:8080/lesson06/booking_list
	@RequestMapping("/booking_list")
	public String listpage(Model model) {
		
		List<Booking> bookingList = bookingBO.getBookingList();
		
		model.addAttribute("bookingList", bookingList);
		
		return "lesson06/bookingListPage";
	}
	
	//예약 페이지
//	http://localhost:8080/lesson06/booking_page
	@GetMapping("/booking_page")
	public String bookingPage() {
		
		return "lesson06/bookingPage";
	}
	
	//예약조회 페이지
//	http://localhost:8080/lesson06/book_check_page
	@GetMapping("/book_check_page")
	public String bookCheckPage() {
		
		return "lesson06/bookCheck";
	}
	
	
	//삭제버튼
	@ResponseBody
	@PostMapping("/del_list")
	public Map<String, Object> delet_List(
			@RequestParam("id") int id
			){
		
		int deleteRow = bookingBO.deleteBookingListById(id);
	    
	    Map<String, Object> map = new HashMap<>();
		if (deleteRow > 0) {
			map.put("result", "success");
		} else {
			map.put("result", "fail");
		}
		
		return map;
	}
	
	// type: delete method
	// POST / GET / PUT
	
	// POST - 데이터를 처음 삽입할 때 사용
	// GET - 데이터를 가져올 때 OR 주소창을 처음 들어갈 때 주로 사용
	// PUT - 수정할 때 사용
	
	// 예약 추가버튼
	@ResponseBody
	@PostMapping("/add_book_list")
	public Map<String, Object> addlist(
			@RequestParam("name") String name,
			//date는 Date 타입이지만 String으로 사용해도 무방
			@RequestParam("date") String date,
			@RequestParam("day") int day,
			@RequestParam("headcount") int headcount,
			@RequestParam(value="phoneNumber", required = false) String phoneNumber
			){
		
		bookingBO.addBookList(name, date, day, headcount, phoneNumber);
		
		// db insert
		Map<String, Object> result = new HashMap<>();
		result.put("result", "success");
		
		return result;
	}
	
	//예약조회 메서드
	
	@ResponseBody
	@PostMapping("/is_check_book")
	public Map<String, Booking> isDuplicationUrl(
			@RequestParam("name") String name,
			@RequestParam(value="phoneNumber", required = false) String phoneNumber
			){
		
		//결과를 map -> JSON String
		Map<String, Booking> result = new HashMap<>();
		
		// select db
		Booking booking = bookingBO.getDuplication(name, phoneNumber);
		result.put("booking", booking);
		
		return result;
	}
}
