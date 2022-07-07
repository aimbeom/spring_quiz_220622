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

	public void addFavorite(String name, String url) {
		favoriteDAO.insertFavorite(name, url);
	}
	
	public List<Favorite> getFavoriteList() {
		return favoriteDAO.selectFavoriteList();
	}
	
	public boolean existFavoriteListByUrl(String url) {
		
		return favoriteDAO.existFavoriteListByUrl(url);
	}
}
