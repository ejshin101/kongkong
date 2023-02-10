<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<html>
<head>
<%@ include file="/WEB-INF/inc/top.jsp"%>
	<title>Home</title>
</head>
<%@ include file="/WEB-INF/inc/topEvent.jsp"%>
<body>
<div class="container">
	<div class="border shadow" style= "border-radius: 10px; margin: 50px; padding: 40px">
	<div class="text-center"><h2>진행중인 이벤트</h2></div>
		<div class="row">
			<div class="col-md-4">
				<a href="<%=request.getContextPath()%>/event/roulette2"> 
				<img src="/resources/image/잭팟.jpg" alt="" style="height: 195px; width: 283px;"></a>
				<b style="color: black;">대박 룰렛!!</b>
				<p>2021.09.01 ~ 2021.11.01</p>
			</div>
			<div class="col-md-4">
				<a href="/event/roulette.wow"><img src="/resources/image/eventroulette.jpg" style="height: 195px; width: 283px;"></a>
				<b style="color: black;">룰렛을 돌려서<br>
				마일리지 펑펑 와 대박~</b>
				<p>2021.09.01 ~ 2021.11.01</p>
			</div>
				<div class="col-md-4">
				<a href="javascript:void(0);" onclick="showMeTheMoney()"><img src="/resources/image/mileage.jpg"  style="height: 195px; width: 283px;"></a>
				<b style="color: black;">마일리지가 없을땐?</b>
				<p>2021.09.01 ~ 2021.11.01</p>
			</div>
		</div>
		<hr>
		<div class="row">
			<div class="col-md-4">
				<a href="<%=request.getContextPath()%>/reservation/product/usim"><img src="/resources/image/usim.png" ></a>
				<b style="color: black;">해외에서 유심 필요할땐?</b>
				<p>2021.09.01 ~ 2021.11.01</p>
			</div>
				<div class="col-md-4">
				<a href="<%=request.getContextPath()%>/reservation/product/wifi"><img src="https://cimgcdn.ybtour.co.kr/attachHome/EM/EB/201904/201904121131310201410002001011.jpg" ></a>
				<b style="color: black;">해외에서 포켓와이파이 고를땐<br>
				와이파이 도시락</b>
				<p>2021.09.01 ~ 2021.11.01</p>
			</div>
				<div class="col-md-4">
				<a href="<%=request.getContextPath()%>/etc/catchme"><img src="/resources/image/catch.png" class="border" style="height: 195px; width: 283px;"></a>
				<b style="color: black;">Catch me if you can</b>
				<p>2021.09.01 ~ 2021.11.01</p>
			</div>
		</div>
 	</div>
 	<div class="border shadow" style= "border-radius: 10px; margin: 50px; padding: 40px">
 	<div class="text-center"><h2>종료된 이벤트</h2></div>
		<div class="row">
			<div class="col-md-4">
				<a href="javascript:void(0);" onclick="message()">
				<img src="/resources/image/kongkongEvent.jpg" alt=""></a>
				<p>2021.08.01 ~ 2021.09.01</p>
			</div>
			<div class="col-md-4">
				<a href="javascript:void(0);" onclick="message()"><img src="https://cimgcdn.ybtour.co.kr/attachHome/EM/EB/202106/202106111226525951410002001044.jpg" ></a>
				<p>2021.08.01 ~ 2021.09.01</p>
			</div>
			<div class="col-md-4">
				<a href="javascript:void(0);" onclick="message()"><img src="https://coinpan.com/files/attach/images/198/810/827/252/932261d207cd2b5685e990a65a2f1cc5.jpg" style="height: 195px; width: 283px;"></a>
				<p>2021.08.01 ~ 2021.09.01</p>
			</div>
		</div>
 	</div>
</div>
	<script>
	function message(){
		swal("이미 종료된 이벤트입니다","","info");
	};
	
	function showMeTheMoney() {
		$.ajax({
			type :"GET",
			url : "<c:url value='/event/mileagecheckLt'/>",	
			dataType : 'json',
			data : {
				memId:'${member.memId}'
			},		
			success :function(data){
				if(data.result){
				  $.ajax({
							type :"GET",
							url : "<c:url value='/event/mileage'/>",	
							data : {
								memId:'${member.memId}',
								memMileage: 10000
							},		
							success :function(data){
								swal("충전완료!!","","info");
								Mymileage();
								}
							});  //
				}else{ 
					swal("마일리지가 10000미만일때 충전 가능합니다","","info");
				//alert(data.msg)	
				}
				}
			});  
	};
	
	
	
	</script>
<%@ include file="/WEB-INF/inc/footer.jsp"%>
</body>
</html>
