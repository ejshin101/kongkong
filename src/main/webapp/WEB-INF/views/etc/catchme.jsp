<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<%@ include file="/WEB-INF/inc/top.jsp"%>
<title>SignUp</title>
<style type="text/css">
@keyframes cardRotate {
  100%{
    transform: rotateY(180deg)
  }60%{
    transform: rotateY(90deg)
  }50%{
    transform: rotateY(180deg)
  }40%{
    transform: rotateY(90deg)
  }30%{
    transform: rotateY(180deg)
  }20%{
    transform: rotateY(90deg)
  }10%{
    transform: rotateY(180deg)
  }0%{
    transform: rotateY(90deg)
  }
}
.Factive {
 animation: cardRotate 3s;
 animation-iteration-count : infinite;
}
.canYouCatchMe{
visibility: visible;
position: absolute;
width: 50px;
height: 50px;
z-index: 100;
overflow:hidden;
border-radius: 30px;
}



</style>
</head>
<body>
<div class="container" style=" height: 600px;">

<img src="<%=request.getContextPath() %>/resources/image/coin.png" id="catchme" class="Factive canYouCatchMe">
<img src="<%=request.getContextPath() %>/resources/image/coin.png" id="catchme2" class="Factive canYouCatchMe">
<img src="<%=request.getContextPath() %>/resources/image/coin.png" id="catchme3" class="Factive canYouCatchMe">

	
</div>
<script type="text/javascript">
window.onload = function(){
	catchmeIfYouCan();
	jumperStart();
}
function catchmeIfYouCan() {
	$('#catchme').css('visibility','visible');
	var top = parseInt( Math.random() * 500)+200;
    var left = parseInt( Math.random() * 1400);
    $('#catchme').css({top: top,left: left});
	}
function jumperStart() {
	setInterval(function(){
		jumper("#catchme2");
		jumper("#catchme3");
}, 300);
}

function jumper(Id) {
$(Id).css('visibility','visible');
	var top = parseInt( Math.random() * 500)+200;
    var left = parseInt( Math.random() * 1400);
$(Id).css({top: top,left: left});
    var ImgChange = parseInt( Math.random() * 3);  //랜덤 이미지
	if(ImgChange == 0){
$(Id).attr("src", "<%=request.getContextPath() %>/resources/image/coin.png");
$(Id).addClass('Factive')
$(Id).css({ 'width': '50px','height':'50px' });
	}else if(ImgChange == 1){
$(Id).attr("src", "<%=request.getContextPath() %>/resources/image/dollar.gif");
$(Id).removeClass('Factive')
$(Id).css({ 'width': '100px','height':'100px' });
	}else if(ImgChange == 2){
$(Id).attr("src", "<%=request.getContextPath() %>/resources/image/dollar2.gif");
$(Id).removeClass('Factive')
$(Id).css({ 'width': '100px','height':'100px' });
	}
 //   window.setTimeout(jumperStart,1000);
	}
	
function hideAway() {
	var Waiting = parseInt( Math.random() * 3000); // 나타나는 시간
	var ImgChange = parseInt( Math.random() * 3);  //랜덤 이미지
	if(ImgChange == 0){
$('#catchme').attr("src", "<%=request.getContextPath() %>/resources/image/coin.png");
$('#catchme').addClass('Factive')
$('#catchme').css({ 'width': '50px','height':'50px' });
	}else if(ImgChange == 1){
$('#catchme').attr("src", "<%=request.getContextPath() %>/resources/image/dollar.gif");
$('#catchme').removeClass('Factive')
$('#catchme').css({ 'width': '100px','height':'100px' });
	}else if(ImgChange == 2){
$('#catchme').attr("src", "<%=request.getContextPath() %>/resources/image/dollar2.gif");
$('#catchme').removeClass('Factive')
$('#catchme').css({ 'width': '100px','height':'100px' });
	}
	
	window.setTimeout(catchmeIfYouCan,Waiting);
}
$('#catchme').click(function(){
	if('${sessionScope.USER_INFO.userId}' == ''){
  $('#catchme').css('visibility','hidden');
  hideAway();
  alert('로그인을 해주세요');
}else{
	$('#catchme').css('visibility','hidden');
	$.ajax({
		type :"GET",
		url : "<c:url value='/event/mileagecheck'/>",	
		dataType : 'json',
		data : {
			memId:'${sessionScope.USER_INFO.userId}',
			requiredMileage: 0
		},		
		success :function(data){
			if(data.result){
			var	curMileage = data.curMileage;
			var randomMileage= Math.ceil(Math.random() * 10)*1000;
			  $.ajax({
						type :"GET",
						url : "<c:url value='/event/mileage'/>",	
						data : {
							memId:'${sessionScope.USER_INFO.userId}',
							memMileage: curMileage+randomMileage
						},		
						success :function(data){
							alert(randomMileage+"마일리지 획득!");
							 Mymileage();	
							 hideAway();
						}
						});  
			};
			}
		});  // mileage check ajax --end
}; //else 끝
})

$('#catchme').mouseover(function(){
	setTimeout(move,150);
})
	
function move() {
	var top = parseInt( Math.random() * 500)+200;
    var left = parseInt( Math.random() * 1400);
    $('#catchme').css({top: top,left: left});
	var ImgChange = parseInt( Math.random() * 3);  //랜덤 이미지
	if(ImgChange == 0){
$('#catchme').attr("src", "<%=request.getContextPath() %>/resources/image/coin.png");
$('#catchme').addClass('Factive')
$('#catchme').css({ 'width': '50px','height':'50px' });
	}else if(ImgChange == 1){
$('#catchme').attr("src", "<%=request.getContextPath() %>/resources/image/dollar.gif");
$('#catchme').removeClass('Factive')
$('#catchme').css({ 'width': '100px','height':'100px' });
	}else if(ImgChange == 2){
$('#catchme').attr("src", "<%=request.getContextPath() %>/resources/image/dollar2.gif");
$('#catchme').removeClass('Factive')
$('#catchme').css({ 'width': '100px','height':'100px' });
	}
}	
</script>


<%@ include file="/WEB-INF/inc/footer.jsp"%>
</body><!-- end.container -->
</html>