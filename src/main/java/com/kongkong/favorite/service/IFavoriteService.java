package com.kongkong.favorite.service;

import java.util.List;

import com.kongkong.favorite.vo.FavoriteSearchVO;
import com.kongkong.favorite.vo.FavoriteVO;

public interface IFavoriteService {
	public List<FavoriteVO> getFavoriteList(FavoriteSearchVO searchVO);
	public int getFavoriteCount(FavoriteSearchVO searchVO);
	public FavoriteVO getFavorite(FavoriteVO favorite);
	public void registFavorite(FavoriteVO favorite);
	public void removeFavorite(FavoriteVO favorite);
}
