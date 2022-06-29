package com.Quiz.lesson04.bo;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.Quiz.lesson04.dao.SellerDAO;
import com.Quiz.lesson04.model.Seller;

@Service
public class SellerBO {
	
	@Autowired
	private SellerDAO sellerdao;
	
	public void addSeller(String nickname, String profileImageUrl, double temperature) {
		sellerdao.insertSeller(nickname, profileImageUrl, temperature);
	}
	
	public Seller getLastSeller() {
		return sellerdao.selectLastSeller();
	}
	
	public Seller getSellerById(int id) {
		return sellerdao.selectSellerById(id);
	}
}
