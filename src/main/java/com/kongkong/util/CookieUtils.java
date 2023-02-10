package com.kongkong.util;

import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;
import java.net.URLEncoder;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;

public class CookieUtils {
	
	private Map<String, Cookie> cookieMap = new HashMap<String, Cookie>();
	
	public CookieUtils(HttpServletRequest req) {
		Cookie[] cookies = req.getCookies();
		if(cookies != null) {
			for(Cookie cook : cookies) {
				cookieMap.put(cook.getName(),cook);
			}
		}
	}
	
	public Cookie getCookie(String cookieName) {
		return cookieMap.get(cookieName);
	}
	
	public String getValue(String cookieName) throws IOException {
		Cookie c = cookieMap.get(cookieName);
		if(c == null) return null;
		return URLDecoder.decode(c.getValue(),"utf-8");
	}
	
	public static Cookie createCookie(String name, String value) throws IOException {
		return createCookie(name, value, "/", "", -1); // -1 : 브라우저가 살아있는 동안(기본값) 
	}
	
	public static Cookie createCookie(String name, String value, String path, int maxAge) throws IOException {
		return createCookie(name, value, path, "", maxAge);
	}
	
	public static Cookie createCookie(String name, String value, String path, String domain, int maxAge) throws IOException {
		Cookie c = new Cookie(name, URLEncoder.encode(value, "utf-8"));
		c.setPath(path);
		c.setDomain(domain);
		c.setMaxAge(maxAge);
		return c;
	}
	
	//저장 방식 : 자유게시판(FREE))의 23번 글을 읽었다
	//만약 있다면 -> boolean으로 true, false를 준다
	
	/**
	 * <b>조회정보저장</b><br>
	 * 기존에 존재하는 쿠키정보에 추가합니다.<br><br>
	 * <b>저장 예시</b><br>
	 * FREE =25|67|68;<br><br>
	 * <b>사용 예시</b><br>
	 * <code>
	 * CookieUtils utils = new CookieUtils(request);<br>
	 * CookieUtils.saveHit('FREE', 23);<br>
	 * </code>
	 * 쿠키에 23이 추가됩니다.<br>
	 * @param name
	 * @param no
	 * @throws IOException 
	 * */
	public Cookie saveHit(String name, int no) throws IOException {
		// 기존 name의 쿠키를 가져와서 추가함
		String value = this.getValue(name);

		//처음인 경우 |25|로 이미 있다면 기존값의 글번호에 |를 더해서 만들기 |25|37|
		if(value == null) {
			value = "|" + no + "|";
		}else if(value.indexOf("|" + no + "|") < 0) { 
			value = value + no + "|" ;
		}
		
		Cookie cook =  createCookie(name, value);
		return cook;
	}
	
	/**
	 * <b>조회정보 유무확인</b><br>
	 * 쿠키정보에 해당 글번호가 있는지 체크합니다.<br><br>
	 * <b>저장 예시</b><br>
	 * FREE =25|67|68;<br><br>
	 * <b>사용 예시</b><br>
	 * <code>
	 * CookieUtils utils = new CookieUtils(request);<br>
	 * CookieUtils.existsHit('FREE', 23);<br>
	 * </code>
	 * 쿠키에 23이 추가됩니다.<br>
	 * @param name
	 * @param no
	 * @throws IOException 
	 * */
	public boolean existsHit(String name, int no) throws IOException {
		String value = this.getValue(name);
		if(value == null) {
			return false;
		}
		return value.contains("|" + no + "|");
	}
}
