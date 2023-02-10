<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
	request.setCharacterEncoding("utf-8");
%>
<!DOCTYPE html>
<html lang="ko">
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script src="<%=request.getContextPath() %>/resources/roulette/jQueryRotateCompressed.js"></script>
<style>
#image{ margin:50px 50px;z-index:10;}
#n_id{position:absolute;left:667px;top:200px;z-index:20;}
#result_id{ display: inline-block;  position: absolute;  margin-top: 20px;}
#result_id2{ display: inline-block;  position: absolute;  margin-top: 60px;}
#result_id3{ display: inline-block;  position: absolute;  margin-top: 100px;}
#result_id4{ display: inline-block;  position: absolute;  margin-top: 140px;}
.ranking{
	   display: inline-block;
 	   position: absolute;
 	   margin-left: 200px;
  	   margin-top: 20px;
}
</style>
</head>
<body>
<%@ include file="/WEB-INF/inc/top.jsp"%>
<div class="container">
<div style="display: inline-block">
<img src="<%=request.getContextPath() %>/resources/roulette/roulette.png" id="image">
<img src="<%=request.getContextPath() %>/resources/roulette/niddle.png" id="n_id">
</div>
<div id="result_id"  ></div>
<div id="result_id2" > 
 500마일리지가 필요합니다
</div>
<div id="result_id3" ></div>
<div id="result_id4" >
내 마일리지: ${member.memMileage}
</div>
<div class="ranking">
<table class="table text-center" id="table">
				<thead>
					<tr>
						<th>순위</th>
						<th>이름</th>
						<th>마일리지</th>
					</tr>
				</thead>
				<tbody>
				<c:forEach items="${memberList}" var="memberList">
					<tr>
						<td>${memberList.memRank}</td>
						<td>${memberList.memName}</td>
						<td>${memberList.memMileage}</td>
					</tr>
					</c:forEach>
				</tbody>
			</table>

</div>
</div>
<!-- <input type='button' value='시작' id='start_btn'></input> -->
<script>
window.onload = function(){
	var pArr = ["0","1","2","3","4:꽝","5","6","7","8","9"];
	var randomNum,real_angle,part,curMileage,mileage;
	var requiredMileage=500;
	$('#image').click(function(){
		$.ajax({
			type :"GET",
			url : "<c:url value='/event/mileagecheck'/>",	
			dataType : 'json',
			data : {
				memId:'${member.memId}',
				requiredMileage: requiredMileage
			},		
			success :function(data){
				if(data.result){
					curMileage = data.curMileage;
					$('#result_id4').html("내 마일리지: "+(curMileage-requiredMileage));
					 randomNum= randomize(0, 360);
					 real_angle = randomNum%360 +18;
					 part = Math.floor(real_angle/36);
					 mileage = part * 100;
					 if(part==4){mileage = 0;}
				  $.ajax({
						type :"GET",
						url : "<c:url value='/event/mileage'/>",	
						//dataType : 'json',
						data : {
							memId:'${member.memId}',
							memMileage: curMileage+mileage-requiredMileage,
							requiredMileage: 10000
						},		
						success :function(data){
								rotation();
								 Mymileage();
							}//success 
						});  //mileage ajax --end
			}else{ //마일리지 부족으로 실패
			alert(data.msg)	
			}
			}
		});  // mileage check ajax --end
});// image click function --end

function memberMileageCheck() {
	 $.ajax({
			type :"GET",
			url : "<c:url value='/event/memberMileageCheck'/>",	
			success :function(data){
				var str="";
				str +='<thead><tr><th>순위</th><th>이름</th>	<th>마일리지</th></tr></thead><tbody>';
				for(var i=0; i<10; i++){
				str+=	'<tr><td>'+(1+i)+'</td><td>'+data[i].memName+'</td><td>'+data[i].memMileage+'</td>';
				}		
				str+='</tbody>';
				  $("#table").html(str);
				}//success 
			});  
}

	function rotation(){
		window.navigator.vibrate(200);
		$("#image").rotate({
		  angle:0, 
		  animateTo:360 * 5 + randomNum,
		  center: ["50%", "50%"],
		  easing: $.easing.easeInOutElastic,
		  callback: function(){ 
						var n = $(this).getRotateAngle();
						endAnimate();
					},
		  duration:5000
	   });
	}

	function endAnimate(){
		$('#result_id2').html("<p>상품범위:" + part + "</p>");
		if(part == 4){
			$('#result_id3').html("<p>꽝!!!</p>");
			return;
		}
		$('#result_id3').html("<p>당첨내역:" + pArr[part] + "</p>");
		$('#result_id3').html("<p>" + mileage + " 마일리지 획득!!!</p>");
		$('#result_id4').html("내 마일리지: "+(curMileage+ mileage-requiredMileage));
		Mymileage();
		memberMileageCheck();
	}

	function randomize($min, $max){
		return Math.floor(Math.random() * ($max - $min + 1)) + $min;
	}
};
</script>
<%@ include file="/WEB-INF/inc/footer.jsp"%>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script src="<%=request.getContextPath() %>/resources/roulette/jQueryRotateCompressed.js"></script>
<script>
$(window).scroll(function () {
   var window_top = $(window).scrollTop() + 1;
   if (window_top > 50) {
   	$('#n_id').css('top','100px');
   } else {
   	$('#n_id').css('top','200px');
   }
 });
</script>
</body>
</html>