package com.kongkong.admin.service;

import java.util.List;
import java.util.Map;

import com.kongkong.admin.dao.SingoBlockSearchVO;
import com.kongkong.admin.vo.AdminVO;
import com.kongkong.favorite.vo.FavoriteSearchVO;
import com.kongkong.free.vo.FreeBoardVO;
import com.kongkong.member.vo.MemberVO;

public interface IAdminService {
	
	public List<Map<String, Object>> getChatList(AdminVO adminVO);
	
	public List<FreeBoardVO> freeSelect(SingoBlockSearchVO searchVO); 

	public List<FreeBoardVO> freeBlockSelect(SingoBlockSearchVO searchVO);
	
	public void blockUpdate(FreeBoardVO free);

	public void blockBack(FreeBoardVO free);
	
	public void blockDelete (FreeBoardVO free);
	
	public MemberVO getMemberCount();
	
	public int getSingoCount(SingoBlockSearchVO searchVO);
	
	public int getBlockCount(SingoBlockSearchVO searchVO);
}
