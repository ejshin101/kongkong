package com.kongkong.admin.vo;

import java.io.Serializable;

import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;

public class AdminVO implements Serializable{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	private String memberDate; // 회원이 회원가입한 시간
	
	private String selectYear; //화면에서 선택한 년도
	
	private String selectMonth; //화면에서 선택한 달
	
	private String selectDate; //화면에서 선택한 날
	
	/**
	 * 예약자인경우 R, 가입자일경우 S
	 */
	private String chartGubun; //예약자 가입자 구분(예약자일때 R, 가입자일때 S) 
	
	private String chartGubunCulume;
	
	private String chartGubunTable;
	
	@Override
	public String toString() {
		return ToStringBuilder.reflectionToString(this, ToStringStyle.MULTI_LINE_STYLE);
	}



	public String getMemberDate() {
		return memberDate;
	}



	public void setMemberDate(String memberDate) {
		this.memberDate = memberDate;
	}



	public String getSelectYear() {
		return selectYear;
	}



	public void setSelectYear(String selectYear) {
		this.selectYear = selectYear;
	}



	public String getSelectMonth() {
		return selectMonth;
	}



	public void setSelectMonth(String selectMonth) {
		this.selectMonth = selectMonth;
	}



	public String getSelectDate() {
		return selectDate;
	}



	public void setSelectDate(String selectDate) {
		this.selectDate = selectDate;
	}



	public String getChartGubun() {
		return chartGubun;
	}



	public void setChartGubun(String chartGubun) {
		this.chartGubun = chartGubun;
	}



	public String getChartGubunCulume() {
		return chartGubunCulume;
	}



	public void setChartGubunCulume(String chartGubunCulume) {
		this.chartGubunCulume = chartGubunCulume;
	}



	public String getChartGubunTable() {
		return chartGubunTable;
	}



	public void setChartGubunTable(String chartGubunTable) {
		this.chartGubunTable = chartGubunTable;
	}
	
}
