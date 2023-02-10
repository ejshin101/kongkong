<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<html>
<head>
<style>
       #sideBar {
        	border-style: solid;
            position: absolute;
            top: 230px;
        }
        #ad {
        	border-style: solid;
            position: absolute;
            top: 500px;
            height: 150px;
            width: 150px;
            background-color: aqua;
        }
    </style>
<%@ include file="/WEB-INF/inc/top.jsp"%>
	<title>Home</title>
</head>
<body>
<%@ include file="/WEB-INF/inc/sidebar.jsp"%>
<!-- 인기글 시작 -->
			<div class="row justify-content-evenly">
				<div class="col-10" style="height: 200px; background-color: blue;" >
					게시판 인기글</div>
			</div>
<div class="container" style="margin-top: 50px">
		<div class="row">
		</div>
	</div>
	<!-- 인기글 끝  -->
	<!-- 게시판 시작 -->
	<div class="container" style="margin-top: 100px">
		<div class="row">
			<div class="row justify-content-evenly">
				<div class="col-12" style="height: 1000px;">
					<table class="table table-bordered table-hover text-center fifth-gray">
	<colgroup>
		<col width="10%" />
		<col width="15%" />
		<col />
		<col width="10%" />
		<col width="15%" />
		<col width="10%" />
	</colgroup>
	<thead>
		<tr>
			<th>글번호</th>
			<th>분류</th>
			<th>제목</th>
			<th>작성자</th>
		</tr>
	</thead>	
	<tbody>
	<c:forEach items="${freeBoardList}" var="freeBoard">
		<tr class="text-center">
			<td>${freeBoard.boNo}</td>
			<td>${freeBoard.boCategory}</td>
			<td class="text-left">
				<a href="freeView.wow?boNo=${freeBoard.boNo}">
					${freeBoard.boTitle}
				</a>
			</td>
			<td>${freeBoard.boWriter}</td>
		</tr>
	</c:forEach>
	</tbody>
	</table>
				</div>
			</div>
		</div>
	</div>
	<!-- 게시판 끝 -->
	<!-- 새글쓰기 시작 -->
	<div class="container" style="margin-top: 50px">
		<div class="col-sm-2 col-sm-offset-7 text-right" >
			<input class="form-control me-2" type="search" placeholder="Search" aria-label="Search">
        <a href="freeRegist.wow" class="btn btn-primary btn-sm" style="margin-top: 30px"> 
        	<span class="glyphicon glyphicon-plus-sign" aria-hidden="true"></span>
        	<i class="fa fa-sign"></i>
        	&nbsp;&nbsp;새글쓰기
		</a>
    </div>
	</div>
    <!-- 새글쓰기 끝 -->
<br>
</body>
</html>
