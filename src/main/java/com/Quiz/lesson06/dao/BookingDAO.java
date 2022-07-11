package com.Quiz.lesson06.dao;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.Quiz.lesson06.model.Booking;

@Repository
public interface BookingDAO {
	
	public List<Booking> selectBookingList();
	
	public int deleteBookingListById(int id);
}
