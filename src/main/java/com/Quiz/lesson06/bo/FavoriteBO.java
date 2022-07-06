package com.Quiz.lesson06.bo;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.Quiz.lesson06.dao.FavoriteDAO;
import com.Quiz.lesson06.model.Favorite;

@Service
public class FavoriteBO {
	
	@Autowired
	private FavoriteDAO favoriteDAO;
	
	public List<Favorite> getFavorite(){
		
		return favoriteDAO.selectFavorite();
	}
	
	public void addFavorite(int id, String name, String url) {
		
		favoriteDAO.insertFavorite(id, name, url);
	}
}
