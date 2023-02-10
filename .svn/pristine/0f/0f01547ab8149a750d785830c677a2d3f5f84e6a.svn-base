package com.kongkong.admin.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.validation.beanvalidation.MethodValidationInterceptor;

import com.kongkong.admin.vo.AdminVO;
import com.kongkong.favorite.vo.FavoriteSearchVO;
import com.kongkong.free.vo.FreeBoardVO;
import com.kongkong.member.vo.MemberVO;

@Mapper
public interface IAdminDao {
	public List<Map<String, Object>> getChatYearList(AdminVO adminVO);
	public List<Map<String, Object>> getChatMonthList(AdminVO adminVO);
	public List<Map<String, Object>> getChat10YearList(AdminVO adminVO);
	
	public List<FreeBoardVO> getFreeSelect(SingoBlockSearchVO searchVO);

	public List<FreeBoardVO> getFreeBlockSelect(SingoBlockSearchVO searchVO);
	
	public int FreeBlockUpdate(FreeBoardVO free);
	
	public int FreeBlockBack(FreeBoardVO free);
	
	public int FreeBlockDelete(FreeBoardVO free);
	
	public MemberVO getMemSelect();
	
	public int getSingoCount(SingoBlockSearchVO searchVO);
	
	public int getBlockCount(SingoBlockSearchVO searchVO);
	
}

