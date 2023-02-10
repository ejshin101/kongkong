package com.kongkong.member.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.kongkong.member.vo.MemberSearchVO;
import com.kongkong.member.vo.MemberVO;

@Mapper
public interface IMemberDao {
	
	public List<MemberVO> getMemberList(MemberSearchVO searchVO);
	public List<MemberVO> getMemberMileageCheck();
	public MemberVO getMember(String memId);
	public int changeMileage(MemberVO member);
	public int getMemCount(MemberSearchVO searchVO);
	
	public int deleteMember(String id);
	
	public int adModifyMember(MemberVO member);
}
