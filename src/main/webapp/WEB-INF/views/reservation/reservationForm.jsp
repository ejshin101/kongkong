<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
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
        .total tbody tr td{
        vertical-align:middle;
        }
        
    </style>
<meta charset="UTF-8">
<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>
<!-- 아래 제이쿼리는 1.0이상이면 원하는 버전을 사용하셔도 무방합니다. -->
<script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js" ></script>

<title>Insert title here</title>
</head>
<%@include file="/WEB-INF/inc/top.jsp"%>
<%@ include file="/WEB-INF/inc/topReservation.jsp"%>

<body>
<div style="height: 50px"></div>
<div class="container">
	<div class="page-header">
		<h3>예약 게시판</h3>
	</div>
<div style="height: 50px"></div>
	<form:errors path="reservation.*" />
	<form:form name="pay" action="/reservation/reservationRegist.wow" modelAttribute="reserve">
	<input type="hidden" value="${ORDER_CODE }" name="bookMerchantUid">
	<input type="hidden" value="${ORDER_CODE }" name="reMerchantUid">
	<input type="hidden" value="${gubun}" name="bookName"> 
	<input type="hidden" value="" class="code" name="bookCd"> 
	<input type="hidden" value="" class="code" name="reTop"> 
	<input type="hidden" value="${reserve.bookId }" name="bookId">
	<input type="hidden" value="${reserve.bookDate}" name="bookDate">

	<table class="table table-bordered table-hover text-center fifth-gray total">
	
	<tr class="usim"><td rowspan="2">World USIM</td></tr>
	<tr class="usim">
		<td>유심선택</td>
			<td>
				<c:set var="reLows" value="${reserve.reLows}"/>
		            <form:select path="reLows" id="usim" cssClass="form-control input-sm" onchange="fn_calcS()">
		            	<form:option value="">-------------</form:option>
		            <form:options items="${usoption}" itemValue="commCd" itemLabel="commNm"/>
	            </form:select>
			</td>
	</tr>
	<tr><td rowspan="4">수령/반납일자</td></tr>
	<tr>
			<td>수령일</td>
			<td>
				<input type="date" id="startDate" name="bookReceive" class="form-control" value="${reserve.bookReceive}" onchange="fn_firstDay(), fn_sum()">
			</td>
	</tr>
	<tr>	
		<td>반납일</td>
		<td>
			<input type="date" id="endDate" name="bookReturn" class="form-control wifi" value="${reserve.bookReturn}" onchange="fn_sum()">
		</td>
	</tr>
	<tr>
		<td>이용기간(일)</td>
		<td>
			<input type="number" readonly="readonly" value="0" class="form-control wifi" id="daysOfTravel" onchange="fn_sum()">
		</td>
	</tr>
	
 	<tr><td rowspan="3">수령/반납방법</td></tr>
	<tr>
			<td>수령방법</td>
			<td>
				<c:set var="bookReceiveWay" value="${reserve.bookReceiveWay}"/>
	            <form:select path="bookReceiveWay" id="pickupway" cssClass="form-control input-sm" onchange="fn_shipping()">
	            	<form:option value="">-------------</form:option>
	            <form:options items="${pickup}" itemValue="commCd" itemLabel="commNm"/>
            	</form:select>
			</td>
	</tr>
	<tr>	
		<td>반납방법</td>
		<td>
			<c:set var="bookReturnWay" value="${reserve.bookReturnWay}"/>
            <form:select path="bookReturnWay" id="returnway" cssClass="form-control input-sm wifi" onchange="fn_shipping()">
            	<form:option value="">-------------</form:option>
            <form:options items="${pickup}" itemValue="commCd" itemLabel="commNm"/>
            </form:select>
		</td>
	</tr>
	
	<tr><td rowspan="3" >수령/반납공항</td></tr>
	<tr>
			<td>수령공항</td>
			<td>
				<c:set var="bookPickupAir" value="${reserve.bookPickupAir}"/>
	            <form:select path="bookPickupAir" id="pickupair" cssClass="form-control input-sm">
	            	<form:option value="">-------------</form:option>
	            <form:options items="${airport}" itemValue="commCd" itemLabel="commNm"/>
	            </form:select>
			</td>
	</tr>
	<tr>	
		<td>반납공항</td>
		<td>
			<c:set var="bookReturnAir" value="${reserve.bookReturnAir}"/>
	            <form:select path="bookReturnAir" id="returnair" cssClass="form-control input-sm wifi">
	            	<form:option value="">-------------</form:option>
	            <form:options items="${airport}" itemValue="commCd" itemLabel="commNm"/>
	            </form:select>
		</td>
	</tr>
	<tr><td rowspan="6">예약자정보</td></tr>
	<tr><td>예약자 성함</td><td><form:input path="bookBuyerName" id="name" cssClass="form-control" /></td></tr>
	<tr><td>예약자 이메일</td><td><form:input path="bookBuyerEmail" id="mail" cssClass="form-control" /></td></tr>
	<tr><td>예약자 연락처</td><td><form:input path="bookBuyerTel" id="hp" cssClass="form-control"/></td></tr>
	<tr><td>예약자 주소<br>
			<input type="button" class="btn btn-primary btn-sm" style="margin-bottom: 10px; text-align: center" onclick="fn_add()" value="검색"></input>
		</td>
		<td>
			<form:input path="bookBuyerAddr" id="address_kakao" cssClass="form-control" />
		</td>
	</tr>
	<tr><td>예약자 우편번호</td><td><form:input id="zip" path="bookBuyerPostcode" cssClass="form-control" /></td></tr>

    
    <tr class="wifi"><td rowspan="5" >옵션<br><br>
    <p>각각을 대여하시면<br> 보증금 1000원을 지불하셔야 하며, <br>와이파이 반납 시<br> 보증금이 환불됩니다.</p>
    </td></tr>
    <tr class="wifi">
	    <td><label><form:checkbox path="reLows" class="battery" value ='PK01' onclick="fn_calc(this)"/>보조배터리</label></td>
	    <td><img src="<%=request.getContextPath()%>/resources/image/battery.png"><br>포켓와이파이 2회 충전가능</td>
    </tr>
	<tr class="wifi">
		<td><label><form:checkbox path="reLows" class="multi" value ='PK03' onclick="fn_calc(this)"/> USB 멀티 충전기</label></td>
		<td><img src="<%=request.getContextPath()%>/resources/image/mplug.png"><br>전원 플러그 1개로 최대 5대를 고속 충전할 수 있는 멀티 충전기</td>
    </tr>
    <tr class="wifi">
    	<td><label><form:checkbox path="reLows" class="usb" value ='PK02' onclick="fn_calc(this)"/> 5핀 USB 케이블</label></td>
    	<td><img src="<%=request.getContextPath()%>/resources/image/5pin.png"><br>포켓 와이파이 충전과 데이터 전송에 사용할 수 있는 USB 케이블</td>
    </tr>
    <tr class="wifi">
    	<td><label for="insurance"><form:checkbox path="reLows" id="insurance" value ='PK04' onclick="fn_calc(this)"/> 와이파이 보험</label></td>
    	<td>보험<p>와이파이 및 옵션 제품 분실 시 <br> 보장해드리는 보험입니다.</p></td>
    </tr>
    
    <tr>
    	<td>수량/총액</td><td>수량 (개)<form:input path="reCnt" type="number" id="count" onchange="fn_sum()" cssClass="form-control" value="1"/></td>
		<td>지불하실 금액 (원)<form:input path="bookAmount" cssClass="form-control" id="sumtext" readonly="true"/></td></tr>
   
	</table>
</form:form>
	<div style="text-align: center; margin:20px" >
		<button class="kongkongs" onclick="iamport()" >결제하기</button>
	</div>
</div> <!-- end .container -->
</body>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.18.0/moment.min.js"></script>
<script>
// 1. 전역변수 선언 

// 2. 일반함수 선언 
	function iamport(){
		//가맹점 식별코드
		IMP.init('imp85907964');
		IMP.request_pay({
		    pg : 'kcp',
		    pay_method : 'card',
		    merchant_uid : '${ORDER_CODE}',
		    name : '${gubun}' , //결제창에서 보여질 이름
		    amount : $("#sumtext").val(), //실제 결제되는 가격 $("#sumtext").val()
		    buyer_email : $('#mail').val(),
		    buyer_name : $('#name').val(),
		    buyer_tel : $('#hp').val(),
		    buyer_addr: $('#addr').val(),
		    buyer_postcode : $('#zip').val(),
		}, function(rsp) {
			console.log(rsp);
			// 결제검증
			$.ajax({
	        	type : "POST",
	        	url : "/reservation/verify/" + rsp.imp_uid, 
	        }).done(function(data) {  
	        	
	        	console.log(data);
	        	
	        	// 위의 rsp.paid_amount 와 data.response.amount를 비교한후 로직 실행 (import 서버검증)
	        	if(rsp.paid_amount == data.response.amount){
		        	alert("결제완료");
		        	//저장하는 ajax를 만들기
		        	$('form[name=pay]').submit();
	        	} else {
	        		alert("결제 실패");
	        	}
	        });
		});
	}
	
	
    function fn_add(){
        new daum.Postcode({
            oncomplete: function(data) { //선택시 입력값 세팅
                document.getElementById("address_kakao").value = data.address; // 주소 넣기
                document.getElementById("zip").value = data.zonecode; // 주소 넣기
                document.getElementById("address_kakao").focus(); //상세입력 포커싱
            }
        }).open();
}
    
    
    /**
    
    */
    function fn_dateMinSetup($objDate, date){
    	var targetDate; 
    	if(date){
    		targetDate = date;
    	}else{
    		targetDate = moment().format('YYYY-MM-DD');
    	}
    	$objDate.attr('min', targetDate);
    }
    
    
    function fn_firstDay(obj) {
    	fn_dateMinSetup($('#startDate'));
    	fn_dateMinSetup($('#endDate'), $('#startDate').val() );    	
	}
	
	// 3. 이벤트 함수 선언 
	
$("#endDate").change(function(){
		if(betweenDay($("#startDate").val(),$("#endDate").val()) > 1){
			$("#daysOfTravel").val(
					betweenDay($("#startDate").val(),$("#endDate").val())
					);
		}
		else{
			alert(betweenDay($("#startDate").val(),$("#endDate").val()));
			alert("도착날짜는 출발날짜보다 이후이어야 합니다");
	         $("#endDate").val('');
		}
		
	});
  
	function betweenDay(firstDate, secondDate){
	     var firstDateObj = new Date(firstDate.substring(0, 4), firstDate.substring(5, 7) - 1, firstDate.substring(8, 10));
	     var secondDateObj = new Date(secondDate.substring(0, 4), secondDate.substring(5, 7) - 1, secondDate.substring(8, 10));
	     var betweenTime =secondDateObj.getTime() - firstDateObj.getTime();
	     return Math.floor(betweenTime / (1000 * 60 * 60 * 24)) + 1;
	} // end betweenDay 
	
window.onload = function fn_showPage(){
		if("${gubun}" == "wifi"){
			$(".usim").hide();
			$(".code").val("RE04")
		}else if("${gubun}" == "usim"){
			$(".wifi").hide(),
			$(".code").val("RE03");
			$( 'select' ).removeAttr( 'multiple' );
		}
			
	}
	
	var day = 100; //일별 금액
	var ea = 0;    //옵션
	var pickupway = 0;
	var returnway = 0;
	var days = $('#daysOfTravel').val();
	
	
	function fn_sum(){
		console.log("들어왔나?");
		var count = document.getElementById('count').value;
		days = $('#daysOfTravel').val();
		days = parseInt(days);
		console.log('count', count, 'days', days);
	
		sum = (ea * count) + (days * day * count) + pickupway + returnway;
		console.log('sum', sum);
		if(count<1){
			alert("수량은 0개 이하일수 없습니다")
			return;
		}	
		document.getElementById('sumtext').value = sum;
	} // fn_sum
	

	
	function fn_calc(obj){
		if(obj.checked){
			ea += 1000;
		}else{
			ea -= 1000;
		}
		fn_sum();
	}
	
	function fn_calcS(){     //유심계산
		      if($("#usim").val() == "US01"){
			ea = 100;                   
		}else if($("#usim").val() == "US02"){
			ea = 200;                   
		}else if($("#usim").val() == "US03"){
			ea = 300;                   
		}else if($("#usim").val() == "US04"){
			ea = 400;                   
		}else if($("#usim").val() == "US05"){
			ea = 500;                   
		}else if($("#usim").val() == "US06"){
			ea = 600;
		}
		fn_sum();
	}
	
	function fn_shipping() { //택배계산
		if($("#pickupway").val() === "PI01"){ //택배일 때
			pickupway = 2500;
			$("#pickupair").attr("disabled", true);
		}if($("#returnway").val() === "PI01"){ //택배일 때
			returnway = 2500;
			$("#returnair").attr("disabled", true);
		}if($("#pickupway").val() === "PI02"){ //공항일 때
			pickupway = 0;
			$("#pickupair").attr("disabled", false);
		}if($("#returnway").val() === "PI02"){ //공항일 때
			returnway = 0;
			$("#returnair").attr("disabled", false);
		}
		fn_sum();
	}
	
/* 	function fn_addMileage() {
		var str = $("#Mymileage").text();
		var sum = parseInt(str.substring(9)) + parseInt($("#sumtext").val());
		$("#memMileage").val(sum);
	} */
	
	

	
	
	// 4. 초기화
	fn_firstDay();
</script>

<%@ include file="/WEB-INF/inc/footerView.jsp"%>
</html>
