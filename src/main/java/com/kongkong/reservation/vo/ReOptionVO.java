package com.kongkong.reservation.vo;

import java.io.Serializable;

import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;

@SuppressWarnings("serial")
public class ReOptionVO implements Serializable{

	private String reMerchantUid;      /* 결제코드 */
	private String reTop;              /* 상위항목 */
	private String reLow;              /* 하위항목 */
	private int rePrice;               /* 가격 */
	private int reCnt;                 /* 갯수 */
	
	@Override
	public String toString() {
		return ToStringBuilder.reflectionToString(this,ToStringStyle.MULTI_LINE_STYLE);
	}
	
	public String getReMerchantUid() {
		return reMerchantUid;
	}
	public void setReMerchantUid(String reMerchantUid) {
		this.reMerchantUid = reMerchantUid;
	}
	public String getReTop() {
		return reTop;
	}
	public void setReTop(String reTop) {
		this.reTop = reTop;
	}
	public String getReLow() {
		return reLow;
	}
	public void setReLow(String reLow) {
		this.reLow = reLow;
	}
	public int getRePrice() {
		return rePrice;
	}
	public void setRePrice(int rePrice) {
		this.rePrice = rePrice;
	}
	public int getReCnt() {
		return reCnt;
	}
	public void setReCnt(int reCnt) {
		this.reCnt = reCnt;
	}
	
	
	
	
}
