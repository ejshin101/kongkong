package com.kongkong.favorite.service;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.kongkong.favorite.dao.IFavoriteDao;
import com.kongkong.favorite.vo.FavoriteSearchVO;
import com.kongkong.favorite.vo.FavoriteVO;

@Service
public class FavoriteServiceImpl implements IFavoriteService{
	
private static FavoriteServiceImpl instance = getInstance();
	
	private FavoriteServiceImpl() {
	}
	
	private static FavoriteServiceImpl getInstance() {
		if (instance == null)
			instance = new FavoriteServiceImpl();
		return instance;
	}

	private Logger logger = LoggerFactory.getLogger(getClass());
	
	@Autowired
	private IFavoriteDao favoriteDao;


	@Override
	public void registFavorite(FavoriteVO favorite) {
		logger.debug("favorite={}", favorite);
		favoriteDao.insertFavorite(favorite);
	}

	@Override
	public void removeFavorite(FavoriteVO favorite) {
		logger.debug("favorite={}", favorite);
		favoriteDao.deleteFavorite(favorite);
	}

	@Override
	public List<FavoriteVO> getFavoriteList(FavoriteSearchVO searchVO) {
		logger.debug("searchVO={}" , searchVO);
		return favoriteDao.getFavoriteList(searchVO);
	}

	@Override
	public FavoriteVO getFavorite(FavoriteVO favorite) {
		logger.debug("favorite={}" , favorite);
		return favoriteDao.getFavorite(favorite);
	}

	@Override
	@Transactional(readOnly = true)
	public int getFavoriteCount(FavoriteSearchVO searchVO) {
		logger.debug("searchVO={}" , searchVO);
		return favoriteDao.getFavoriteCount(searchVO);
	}

}
