package com.Quiz.lesson06.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import com.Quiz.lesson06.model.Favorite;

@Repository
public interface FavoriteDAO {
	public void insertFavorite(
			@Param("name") String name, 
			@Param("url") String url);
	
	public List<Favorite> selectFavoriteList();
	
	public boolean existFavoriteListByUrl(String url);
}