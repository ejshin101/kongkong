package com.kongkong.signup.service;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kongkong.member.vo.MemberVO;
import com.kongkong.signup.dao.ISignUpDao;

@Service
public class SignUpServiceImpl implements ISignUpService {

@Autowired
private ISignUpDao signupDao;

private Logger logger = LoggerFactory.getLogger(getClass());

@Override
public MemberVO getMember(String memId) {
	// TODO Auto-generated method stub
	return null;
}

@Override
public List<MemberVO> getMemberList(MemberVO member) {
	// TODO Auto-generated method stub
	return null;
}

@Override
public void signupUser(MemberVO member) {
	logger.debug("member={}" , member );
	signupDao.insertUser(member);
	
}










}
