package com.Quiz.lesson06.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import com.Quiz.lesson06.model.Favorite;

@Repository
public interface FavoriteDAO {
	
	public List<Favorite> selectFavorite();
	
	public void insertFavorite(
			@Param("id") int id,
			@Param("name") String name,
			@Param("url") String url
			);
	
}
