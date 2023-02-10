<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
    <%
    request.setCharacterEncoding("UTF-8");
    %>
<!DOCTYPE html>
<html lang="ko">
<head>
<style>
       #sideBar {
        	border-style: solid;
            position: absolute;
            top: 200px;
            width: 150px;
        }
        #ad {
        	border-style: solid;
            position: absolute;
            top: 550px;
            height: 150px;
            width: 150px;
            background-color: aqua;
        }
    </style>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%@include file="/WEB-INF/inc/top.jsp"%>
<div style="height: 120px"></div>
<div class="container">
	<div class="page-header">
		<h3>예약내역</h3>
	</div>
		<table class="table table-striped table-bordered">
			<tbody>
				<tr>
					<th>주문번호</th>
					<td>${reserve.bookMerchantUid}</td>
				</tr>
				<tr>
					<th>구매항목</th>
					<td>${reserve.bookCdNm}</td>
				</tr>
				<tr>
					<th>구매자 이메일</th>
					<td>${reserve.bookBuyerEmail}</td>
				</tr>
				<tr>
					<th>구매자명</th>
					<td>${reserve.bookBuyerName}</td>
				</tr>
				<tr>
					<th>구매자 연락처</th>
					<td>${reserve.bookBuyerTel}</td>
				</tr>
				<tr>
					<th>구매자 주소</th>
					<td>${reserve.bookBuyerAddr}</td>
				</tr>
				<tr>
					<th>구매자 우편번호</th>
					<td>${reserve.bookBuyerPostcode}</td>
				</tr>
				<tr>
					<th>가격</th>
					<td>${reserve.bookAmount}</td>
				</tr>
					<c:if test="${reserve.bookCdNm ne '마일리지'}"> <!-- 마일리지가 아닐경우 -->
				<tr>
					<th>구매옵션</th>
					<td><c:forEach var="option" items="${reserveOption}">
					<div>
					${option.reLowNm}
					</div>
					</c:forEach></td>
				</tr>
				<tr>
					<th>수령방법</th>
					<td>
					${reserve.bookReceiveWayNm}
					</td>
				</tr>
				<tr>
					<th>수령공항</th>
					<td>${reserve.bookPickupAirNm}</td>
				</tr>
				<tr>
					<th>수령일</th>
					<td>${reserve.bookReceive}</td>
				</tr>
				<tr>
					<th>반납방법</th>
					<td>${reserve.bookReturnWayNm}</td>
				</tr>
				<tr>
					<th>반납공항</th>
					<td>${reserve.bookReturnAirNm}</td>
				</tr>
				<tr>
					<th>반납일</th>
					<td>${reserve.bookReturn}</td>
				</tr>
					</c:if> <!-- 마일리지가 아닐경우 -->
				
				<tr>
					<td colspan="2">
					  <div class="pull-left">
							<a href="reservationList.wow" class="btn btn-default btn-sm"> 
								<span class="glyphicon glyphicon-list" aria-hidden="true"></span>
								&nbsp;&nbsp;목록
							</a>
						</div>
						<div class="pull-right">
							<a href="reservationModify.wow?bookMerchantUid=${reserve.bookMerchantUid }" class="btn btn-success btn-sm"> 
								<span class="glyphicon glyphicon-pencil" aria-hidden="true"></span>
								&nbsp;&nbsp;수정
						  </a>
						</div>
					</td>					  
				</tr>
			</tbody>
		</table>
</div> <!-- end .container -->
</body>
</html>