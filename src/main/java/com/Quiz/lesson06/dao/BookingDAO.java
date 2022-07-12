package com.Quiz.lesson06.dao;

import java.util.Date;
import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import com.Quiz.lesson06.model.Booking;

@Repository
public interface BookingDAO {
	
	public List<Booking> selectBookingList();
	
	public int deleteBookingListById(int id);
	
	public void insertBookList(
			@Param("name") String name,
			@Param("date") String date,
			@Param("day") int day,
			@Param("headcount") int headcount,
			@Param("phoneNumber") String phoneNumber
			);
	
	public Booking selectDuplication(
			@Param("name") String name,
			@Param("phoneNumber") String phoneNumber);
}
