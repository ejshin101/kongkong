<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
	request.setCharacterEncoding("utf-8");
%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%@include file="/WEB-INF/inc/top.jsp"%>
	<div class="container">
	    <form name="form" method="post" action="http://localhost:8080/board" enctype="multipart/form-data">
	      <input name="user" value="Pyo"/>
	      <input name="content" value="Content"/>
	      <input type="file" name="files" multiple="multiple"/>
	      <input type="submit" id="submit" value="전송"/>
	    </form>
	</div>
</body>
</html>