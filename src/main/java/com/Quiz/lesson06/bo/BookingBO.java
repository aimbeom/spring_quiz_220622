package com.Quiz.lesson06.bo;

import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.Quiz.lesson06.dao.BookingDAO;
import com.Quiz.lesson06.model.Booking;

@Service
public class BookingBO {
	
	@Autowired
	BookingDAO bookingDAO;
	
	// 모든 로직은 BO에서 사용한다
	
	public List<Booking> getBookingList() {
		
		return bookingDAO.selectBookingList();
	}
	
	public int deleteBookingListById(int id) {
		
		return bookingDAO.deleteBookingListById(id);
	}
	
	public void addBookList(
			String name,
			String date,
			int day,
			int headcount,
			String phoneNumber
			) {
		
		bookingDAO.insertBookList(name, date, day, headcount, phoneNumber);
	}
	
	public Booking getDuplication(String name, String phoneNumber) {
		
		return bookingDAO.selectDuplication(name, phoneNumber);
	}
}
