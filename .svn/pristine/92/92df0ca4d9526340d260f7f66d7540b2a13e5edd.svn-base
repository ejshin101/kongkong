package com.kongkong.login.service;

import javax.inject.Inject;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.ModelAttribute;

import com.kongkong.exception.BizNotFoundException;
import com.kongkong.exception.BizPasswordNotMatchedException;
import com.kongkong.login.dao.ILoginDao;
import com.kongkong.login.vo.UserVO;
import com.kongkong.member.dao.IMemberDao;
import com.kongkong.member.vo.MemberVO;

@Service
public class LoginServiceImpl implements IloginService{
	
	
	@Autowired
	private IMemberDao memberDao;
	
	@Inject
	private ILoginDao loginDao;

	@Override
	public UserVO loginCheck(UserVO user) throws BizNotFoundException, BizPasswordNotMatchedException {
		MemberVO vo = memberDao.getMember(user.getUserId());
		
		// 로그인 실패
		if(vo == null) {
			throw new BizNotFoundException("[" + user.getUserId() + "] 를 조회할 수 없습니다.");
		}
		if(!vo.getMemPass().equals(user.getUserPass())) {
			throw new BizPasswordNotMatchedException("패스워드가 일치하지 않습니다.");
		}
		
		//로그인 성공
		UserVO loginUser = new UserVO();
		loginUser.setUserId(vo.getMemId());
//		loginUser.setUserPass(vo.getMemPass());
		loginUser.setUserName(vo.getMemName());
		loginUser.setUserRole(vo.getMemRole());
		loginUser.setUserLike(vo.getMemLike());
		loginUser.setUserMileage(vo.getMemMileage());

		loginDao.insertLoginLog(user);
		
		return loginUser;
	}

	@Override
	public void logOutCheck(UserVO user) {
		loginDao.insertLogOutLog(user);
	}

	
}
