package com.kongkong.reservation.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.kongkong.reservation.vo.ReservationSearchVO;
import com.kongkong.reservation.vo.ReservationVO;

@Mapper
public interface IReservationDao {
	public int getReserveCount(ReservationSearchVO searchVO);
	public List<ReservationVO> getReserveList(ReservationSearchVO searchVO); //모든 예약 정보 가져오기
	public ReservationVO getReserve(String bookMerchantUid); //예약 정보 하나씩 가져오기
	public ReservationVO getReserveEditPage(String bookMerchantUid); //예약 정보 하나씩 가져오기
	public int insertReserve(ReservationVO reserve);//예약 정보 등록
	public int updateReserve(ReservationVO reserve); //예약 정보 수정
	public int updateAdminReserve(ReservationVO reserve); //예약 정보 수정
	public int updateMileage(ReservationVO reserve);
}
