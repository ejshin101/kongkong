package com.kongkong.member.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.kongkong.member.dao.IMemberDao;
import com.kongkong.member.vo.MemberSearchVO;
import com.kongkong.member.vo.MemberVO;

@Service
public class MemberServiceImpl implements IMemberService {

	@Inject
	IMemberDao memberDao;
	

	
	public List<MemberVO> getMemberList(MemberSearchVO searchVO) {
		//memberDao.get
		searchVO.setTotalRowCount(memberDao.getMemCount(searchVO));
		searchVO.setting();
		return memberDao.getMemberList(searchVO);
	}

	public MemberVO getMember(String memId) {
		return memberDao.getMember(memId);
	}

	public void registMember(MemberVO member) {
	}

	public int changeMileage(MemberVO member) {
		return memberDao.changeMileage(member);
	}

	@Override
	public List<MemberVO> getMemberMileageCheck() {
		return memberDao.getMemberMileageCheck();
	}

	@Override
	public void memberDelete(String id) {
		memberDao.deleteMember(id);
		
	}

	@Override
	public void modifyMember(MemberVO member) {
		memberDao.adModifyMember(member);
		
	}




}
