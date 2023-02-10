package com.kongkong.signup.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.kongkong.member.vo.MemberVO;

@Mapper
public interface ISignUpDao {
	public List<MemberVO> getMemberList(MemberVO member);
	public MemberVO getMember(String memId);
	public int insertUser(MemberVO member);
}
