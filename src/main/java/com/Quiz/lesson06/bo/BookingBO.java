package com.Quiz.lesson06.bo;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.Quiz.lesson06.dao.BookingDAO;
import com.Quiz.lesson06.model.Booking;

@Service
public class BookingBO {
	
	@Autowired
	BookingDAO bookingDAO;
	
	public List<Booking> getBookingList() {
		
		return bookingDAO.selectBookingList();
	}
	
	public int deleteBookingListById(int id) {
		
		return bookingDAO.deleteBookingListById(id);
	}
}
