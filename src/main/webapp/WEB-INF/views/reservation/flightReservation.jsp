<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<html>
<head>
<title>비행기 예약</title>
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/resources/jquery/jquery.autocomplete.css" />
<style type="text/css">

.columB{
display: inline-block;
  padding: 13px 30px;
  border-radius: 0;
  font-size: 16px;
  color: #fff;
  text-transform: capitalize;
  -webkit-transition: 0.5s;
  transition: 0.5s;
  background-color: #2493e0;
  font-weight: 500;
  border : 0;

}
</style>

</head>
<body style="background-image:url('/resources/image/flight.jpg');">
<%@ include file="/WEB-INF/inc/top.jsp"%>
<%@ include file="/WEB-INF/inc/topReservation.jsp"%>
<div class="container" style="height: 480px;">
<div style="height: 100px;"></div>
<div style="height: 200px; background-color: #151B4B; opacity:0.85;">
<div style="height: 50px;"></div>
<div class="form-row justify-content-around form-floating ">
	  <div>
	  <label for="depAirport">출발</label>
	  <input class="form-control" type="text" id="depAirport" placeholder="출발지">
	  </div>
	  <div >
	  <label for="arrAirport">도착</label>
	  <input class="form-control" type="text" id="arrAirport" placeholder="도착지">
	   </div>
	   <div >
	   <label for="startDate">가는날</label>
	  <input class=" form-control" type="date" class="form-control" id="startDate">
	  </div>
	  <div >
	  <label for="endDate">오는날</label>
	  <input class="form-control" type="date" class="form-control" id="endDate">
	  </div>
	  <div style="margin-top: 20px">
	  <input class="columB" type="button"  onclick="fn_searchClick()" value="검색" >
	  </div>
</div>
</div>
</div><!-- container end -->

<script  src="http://code.jquery.com/jquery-latest.min.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/resources/jquery/lib/jquery.js"></script>
<script type='text/javascript' src='<%=request.getContextPath()%>/resources/jquery/lib/jquery.bgiframe.min.js'></script>
<script type='text/javascript' src='<%=request.getContextPath()%>/resources/jquery/lib/jquery.ajaxQueue.js'></script>
<script type='text/javascript' src='<%=request.getContextPath()%>/resources/jquery/jquery.autocomplete.js'></script>
	<script>
	var Tags=[];
	$(document).ready(function() {
	    $.ajax({
			url : "<c:url value='/reservation/airportInfo'/>",
			dataType : 'json',
			success : function(data) {
				for (var i=0; i<data.list1.length; i++) {
					Tags.push(data.list1[i]);
				}
				for (var i=0; i<data.list2.length; i++) {
					Tags.push(data.list2[i]);
				}
				$("#depAirport").autocomplete(Tags,{ 
			        matchContains: true,
			        selectFirst: true,
			    });
			    $("#arrAirport").autocomplete(Tags,{ 
			        matchContains: true,
			        selectFirst: true,
			    });
			}//success 
		}); // ajax --end
	});
	function fn_searchClick() {
		var departureAir= $("#depAirport").val()
		var arrivalAir= $("#arrAirport").val()
		var start =$("#startDate").val();
		var end =$("#endDate").val();
		$.ajax({
				url : "<c:url value='/reservation/flightInfo'/>",
				dataType : 'json',
				data : {
					departure : departureAir,
					arrival : arrivalAir
				},
				success : function(data) {
				$("#departure").html("출발 공항: " + $("#depAirport").val()+"코드"+data.depAir);
				$("#arrival").html("도착 공항: " + $("#arrAirport").val()+"코드"+data.arrAir);
				//location.href='https://www.skyscanner.co.kr/transport/flights/'+data.depAir+'/'+data.arrAir+'/'+start+'/'+end+'/';
				 window.open('https://www.skyscanner.co.kr/transport/flights/'+data.depAir+'/'+data.arrAir+'/'+start+'/'+end+'/', "스카이스캐너", "width=800, height=700" );  

				}//success 
			}); // ajax --end
		}
	var startdate=1;
	$("#endDate").change(function(){
	    $("#daysOfTravel").val(betweenDay($("#endDate").val(),$("#startDate").val()));
	    startdate=2;
	});
	$("#startDate").change(function(){
		if(startdate ==2){
	    $("#daysOfTravel").val(betweenDay($("#endDate").val(),$("#startDate").val()));
		}
	});
	function betweenDay(firstDate, secondDate){
	     var firstDateObj = new Date(firstDate.substring(0, 4), firstDate.substring(5, 7) - 1, firstDate.substring(8, 10));
	     var secondDateObj = new Date(secondDate.substring(0, 4), secondDate.substring(5, 7) - 1, secondDate.substring(8, 10));
	    
	     if(secondDateObj>firstDateObj){
	         alert("도착날짜는 출발날짜보다 이후이어야 합니다");
	         $("#endDate").val('');
	         return ;
	     }
	    
	     var betweenTime = Math.abs(secondDateObj.getTime() - firstDateObj.getTime());
	     return Math.floor(betweenTime / (1000 * 60 * 60 * 24))+'일';
	} // end betweenDay
	
	
	</script>
<%@ include file="/WEB-INF/inc/footer2.jsp"%>
</body>
</html>