<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
	request.setCharacterEncoding("utf-8");
%>
<html>
<head>
  <title>사다리타기 test</title>
  <!-- 사다리타기 link -->
  <link rel="import" href="http://www.polymer-project.org/components/paper-ripple/paper-ripple.html">
  <link href="<%=request.getContextPath() %>/resources/ladder/style.css" rel="stylesheet">
  <link href="<%=request.getContextPath() %>/resources/ladder/meterial.css" rel="stylesheet">
  <script src="<%=request.getContextPath() %>/resources/ladder/jquery-2.1.3.min.js"></script>
  <!-- 사다리타기 link -->
</head>
  <body>
  	<!-- 사다리타기 -->
    <div id="ladder" class="ladder">
      <div class="dim"></div>
      <canvas class="ladder_canvas" id="ladder_canvas"></canvas>
    </div>
    <script src="<%=request.getContextPath() %>/resources/ladder/ladder.js"></script>
    <!-- 사다리타기 -->
  </body>
</html>