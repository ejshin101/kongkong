package com.kongkong.signup.service;

import java.util.List;

import com.kongkong.member.vo.MemberVO;

public interface ISignUpService {
	
	public void signupUser(MemberVO member) ; 
	public MemberVO getMember(String memId);
	public List<MemberVO> getMemberList(MemberVO member);
}
