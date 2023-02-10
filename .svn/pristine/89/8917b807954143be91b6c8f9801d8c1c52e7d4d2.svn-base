package com.kongkong.common.vo;

import java.io.Serializable;

import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;

@SuppressWarnings("serial")
public class ResultMessageVO implements Serializable {
	private boolean result;
	private String title;
	private String message;
	private String url;
	private String urlTitle;
	
	
// Getter/ Setter 생성
	public boolean isResult() {
		return result;
	}
	public ResultMessageVO setResult(boolean result) {
		this.result = result;
		return this;
	}
	public String getTitle() {
		return title;
	}
	public ResultMessageVO setTitle(String title) {
		this.title = title;
		return this;
	}
	public String getMessage() {
		return message;
	}
	public ResultMessageVO setMessage(String message) {
		this.message = message;
		return this;
	}
	public String getUrl() {
		return url;
	}
	public ResultMessageVO setUrl(String url) {
		this.url = url;
		return this;
	}
	public String getUrlTitle() {
		return urlTitle;
	}
	public ResultMessageVO setUrlTitle(String urlTitle) {
		this.urlTitle = urlTitle;
		return this;
	}
	
// toString 오버라이드
	@Override
	public String toString() {
		return ToStringBuilder.reflectionToString(this,ToStringStyle.MULTI_LINE_STYLE);
	}
	
// Method Chaining은 여러 메서드 호출을 하나의 실행문으로 호출 가능하도록 하는 기법 -> Setter 메서드는 void 가 아닌 해당 객체(클래스객체)를 리턴하도록 변경

}