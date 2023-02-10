package com.kongkong.admin.service;

import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.commons.lang3.StringUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.kongkong.admin.dao.IAdminDao;
import com.kongkong.admin.dao.SingoBlockSearchVO;
import com.kongkong.admin.vo.AdminVO;
import com.kongkong.favorite.vo.FavoriteSearchVO;
import com.kongkong.free.vo.FreeBoardVO;
import com.kongkong.member.vo.MemberVO;

@Service
public class AdminServiceImpl implements IAdminService {

	private Logger logger = LoggerFactory.getLogger(getClass());
		
	@Inject
	private IAdminDao adminDao;
	
	@Override
	public List<Map<String, Object>> getChatList(AdminVO adminVO) {
		// adminVO 차트구분에 따라서 컬럼명 설정
		if(adminVO.getChartGubun().equals("R")) {
			adminVO.setChartGubunCulume("book_date");
			adminVO.setChartGubunTable("reservation");
		}else if(adminVO.getChartGubun().equals("S")) {
			adminVO.setChartGubunCulume("mem_date");
			adminVO.setChartGubunTable("member");
		}else if(adminVO.getChartGubun().equals("Y-R")) {
			adminVO.setChartGubunCulume("book_date");
			adminVO.setChartGubunTable("reservation");
		}else if(adminVO.getChartGubun().equals("Y-S")) {
			adminVO.setChartGubunCulume("mem_date");
			adminVO.setChartGubunTable("member");
		}
		
		if(adminVO.getChartGubun().equals("R") || adminVO.getChartGubun().equals("S")) {
			
				if (StringUtils.isBlank(adminVO.getSelectMonth())) { //년도만 선택
					List<Map<String, Object>> list = adminDao.getChatYearList(adminVO);
					System.out.println(list);
					return list;
				}else {  // 년도, 월 선택 둘다
					List<Map<String, Object>> list = adminDao.getChatMonthList(adminVO);
					System.out.println(list);
					return list;
				}
		} else if(adminVO.getChartGubun().equals("Y-R") || adminVO.getChartGubun().equals("Y-S")) {
			System.out.println(adminVO);
			List<Map<String, Object>> list = adminDao.getChat10YearList(adminVO);
			System.out.println(list);
			return list;
	}else {
		return null;
		
	}
		

}

	//신고관리
	@Override
	public List<FreeBoardVO> freeSelect(SingoBlockSearchVO searchVO) {
		return adminDao.getFreeSelect(searchVO);
		
	}
	
	public List<FreeBoardVO> freeBlockSelect(SingoBlockSearchVO searchVO) {
		return adminDao.getFreeBlockSelect(searchVO);
		
	}

	@Override
	public void blockUpdate(FreeBoardVO free) {
		adminDao.FreeBlockUpdate(free);
		
	}

	@Override
	public void blockBack(FreeBoardVO free) {
		adminDao.FreeBlockBack(free);
		
	}

	@Override
	public void blockDelete(FreeBoardVO free) {
		adminDao.FreeBlockDelete(free);
	}

	//총 멤버수
	@Override
	public MemberVO getMemberCount() {
		return adminDao.getMemSelect();
	}
	
	// 신고 페이징 카운트
	@Override
	@Transactional(readOnly = true)
	public int getSingoCount(SingoBlockSearchVO searchVO) {
		logger.debug("searchVO={}" , searchVO);
		return adminDao.getSingoCount(searchVO);
	}

	@Override
	public int getBlockCount(SingoBlockSearchVO searchVO) {
		logger.debug("searchVO={}" , searchVO);
		return adminDao.getBlockCount(searchVO);
	}

	
	
}
