package com.kongkong.reservation.service;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import com.kongkong.exception.BizNotFoundException;
import com.kongkong.reservation.vo.ReservationSearchVO;
import com.kongkong.reservation.vo.ReservationVO;

public interface IReservationService {
	public List<ReservationVO> getReserveList(ReservationSearchVO searchVO); //모든 예약 정보 가져오기
	public int getReserveCount(ReservationSearchVO searchVO);
	public ReservationVO getReserve(String bookMerchantUid); //예약 정보 하나씩 가져오기
	public ReservationVO getReserveEditPage(String bookMerchantUid); //예약 정보 하나씩 가져오기
	public List<ReservationVO> getReserveOption(String bookMerchantUid);//예약 옵션 정보 가져오기
	public void registReserve(ReservationVO reserve);//예약 정보 등록
	public void modifyReserve(ReservationVO reserve) throws BizNotFoundException; //예약 정보 수정
	public void modifyAdminReserve(ReservationVO reserve) throws BizNotFoundException; //예약 정보 수정
	
}
