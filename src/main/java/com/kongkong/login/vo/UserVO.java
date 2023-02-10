package com.kongkong.login.vo;

import java.io.Serializable;

import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;

@SuppressWarnings("serial")
public class UserVO implements Serializable {

	private static final long serialVersionUID = -7869813991606862900L;
			
	private String userPass;
	private String userRole;
	private String userName;
	private String userLike;
	private int userMileage;
	
	
	//로그 기록하는데 필요한것들
	private String userId; //세션에 저장됨
	private String userIp;	//컨드롤러에서 저장시킴
//	private String userInOut; //
//	private String userInOutTime; //
	
	
	
	
	
	// 생성자
	public UserVO() {
	}

	// 생성자
	public UserVO(String userId, String userName, String userPass, String userRole, String userLike, String userIp) {
		this.userId = userId;
		this.userName = userName;
		this.userPass = userPass;
		this.userRole = userRole;
		this.userLike = userLike;
	}
	
	@Override
	public String toString() {
		return ToStringBuilder.reflectionToString(this, ToStringStyle.MULTI_LINE_STYLE);
	}
	
	
	public String getUserLike() {
		return userLike;
	}

	public void setUserLike(String userLike) {
		this.userLike = userLike;
	}

	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
	public String getUserPass() {
		return userPass;
	}
	public void setUserPass(String userPass) {
		this.userPass = userPass;
	}
	public String getUserRole() {
		return userRole;
	}
	public void setUserRole(String userRole) {
		this.userRole = userRole;
	}

	public String getUserIp() {
		return userIp;
	}

	public void setUserIp(String userIp) {
		this.userIp = userIp;
	}

	public int getUserMileage() {
		return userMileage;
	}

	public void setUserMileage(int userMileage) {
		this.userMileage = userMileage;
	}



//	public String getUserInOut() {
//		return userInOut;
//	}
//
//	public void setUserInOut(String userInOut) {
//		this.userInOut = userInOut;
//	}
//
//	public String getUserInOutTime() {
//		return userInOutTime;
//	}
//
//	public void setUserInOutTime(String userInOutTime) {
//		this.userInOutTime = userInOutTime;
//	}
	
	
}
