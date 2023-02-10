package com.kongkong.free.vo;

import java.io.Serializable;

import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;

@SuppressWarnings("serial")
public class BoardScopeVO implements Serializable{
	
	private int boNo;
	private double boScope;
	private int boScopeCnt;
	private double boScopeVal1;
	private double boScopeVal2;
	private double boScopeVal3;
	private double boScopeVal4;
	private double boScopeVal5;
	

	@Override
	public String toString() {
		return ToStringBuilder.reflectionToString(this, ToStringStyle.MULTI_LINE_STYLE);
	}

	
	
	public double getBoScopeVal1() {
		return boScopeVal1;
	}

	public void setBoScopeVal1(double boScopeVal1) {
		this.boScopeVal1 = boScopeVal1;
	}

	public double getBoScopeVal2() {
		return boScopeVal2;
	}

	public void setBoScopeVal2(double boScopeVal2) {
		this.boScopeVal2 = boScopeVal2;
	}

	public double getBoScopeVal3() {
		return boScopeVal3;
	}

	public void setBoScopeVal3(double boScopeVal3) {
		this.boScopeVal3 = boScopeVal3;
	}

	public double getBoScopeVal4() {
		return boScopeVal4;
	}

	public void setBoScopeVal4(double boScopeVal4) {
		this.boScopeVal4 = boScopeVal4;
	}

	public double getBoScopeVal5() {
		return boScopeVal5;
	}

	public void setBoScopeVal5(double boScopeVal5) {
		this.boScopeVal5 = boScopeVal5;
	}

	
	public int getBoNo() {
		return boNo;
	}

	public void setBoNo(int boNo) {
		this.boNo = boNo;
	}

	public double getBoScope() {
		return boScope;
	}

	public void setBoScope(double boScope) {
		this.boScope = boScope;
	}

	public int getBoScopeCnt() {
		return boScopeCnt;
	}

	public void setBoScopeCnt(int boScopeCnt) {
		this.boScopeCnt = boScopeCnt;
	}


	
	
	
}
