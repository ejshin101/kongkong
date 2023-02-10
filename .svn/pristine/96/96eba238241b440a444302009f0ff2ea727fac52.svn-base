<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
<%@ include file="/WEB-INF/inc/top.jsp"%>
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
	<title>Home</title>
</head>
<body>
<%@ include file="/WEB-INF/inc/ReservationSidebar.jsp"%>
<a href="hotel.wow">근처 호텔 찾기</a>

<div class="row">
	<div class="col-2">
	</div>
	 <div class="row col-8">
        <div class="col-3">
         <label for="inputDate" class="form-label">출발 날짜</label>
         <input type="date" class="form-control" id="startDate">
         <script>document.getElementById('startDate').value = new Date().toISOString().substring(0, 10);;</script>
       </div>
       <div class="col-3">
         <label for="inputDate" class="form-label">도착 날짜</label>
         <input type="date" class="form-control" id="endDate">
       </div>
        <div class="col-2">
         <label for="inputDate" class="form-label">여행 일수</label>
         <input type="text" class="form-control" readonly="readonly" value="" id="daysOfTravel">
       </div>
   </div>
</div>
   
   <div style="height: 4000px"></div>
<div id="bottom"></div>
</body>
<script>
$("#endDate").change(function(){
    $("#daysOfTravel").val(betweenDay($("#endDate").val(),$("#startDate").val()));
});
function betweenDay(firstDate, secondDate){
            var firstDateObj = new Date(firstDate.substring(0, 4), firstDate.substring(5, 7) - 1, firstDate.substring(8, 10));
            var secondDateObj = new Date(secondDate.substring(0, 4), secondDate.substring(5, 7) - 1, secondDate.substring(8, 10));
           
            if(secondDateObj>firstDateObj){
                alert("도착날짜는 출발날짜보다 이후이어야 합니다");
                return ;
            }
           
            var betweenTime = Math.abs(secondDateObj.getTime() - firstDateObj.getTime());
            return Math.floor(betweenTime / (1000 * 60 * 60 * 24))+'일';
        }
</script>
</html>