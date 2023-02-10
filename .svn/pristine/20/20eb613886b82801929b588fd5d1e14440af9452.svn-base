package com.kongkong.reservation.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.kongkong.reservation.vo.ReservationSearchVO;
import com.kongkong.reservation.vo.ReservationVO;

@Mapper
public interface IReservationOptionDao {
	public int getReserveCountByParent(ReservationSearchVO reserveVO);
	public List<ReservationVO> getReserve(String reMerchantUid); //예약 정보 하나씩 가져오기
	public int insertReserve(ReservationVO reserveOption);//예약 정보 등록
	public int deleteReserve(ReservationVO reserveOption); //예약 정보 삭제
	public int deleteAdminReserve(ReservationVO reserveOption);
	public int insertAdminReserve(ReservationVO reserveOption);
}
