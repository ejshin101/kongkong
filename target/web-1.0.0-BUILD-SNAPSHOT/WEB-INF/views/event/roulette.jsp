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
#n_id{position:absolute;left:286px;top:75px;z-index:20;}
#result_id{ display: inline-block;  position: absolute;  margin-top: 20px;}
#result_id2{ display: inline-block;  position: absolute;  margin-top: 60px;}
#result_id3{ display: inline-block;  position: absolute;  margin-top: 100px;}


</style>
</head>
<body>
<div>
<div style="display: inline-block">
<img src="<%=request.getContextPath() %>/resources/roulette/roulette.png" id="image">
<img src="<%=request.getContextPath() %>/resources/roulette/niddle.png" id="n_id">
</div>
<div id="result_id"  ></div>
<div id="result_id2" ></div>
<div id="result_id3" ></div>

</div>
<!-- <input type='button' value='시작' id='start_btn'></input> -->
<script>
window.onload = function(){
	
	var pArr = ["0","1","2","3","4:꽝","5","6","7","8","9"];

	$('#image').click(function(){
		rotation();
	});

	function rotation(){
		$("#image").rotate({
		  angle:0, 
		  animateTo:360 * 5 + randomize(0, 360),
		  center: ["50%", "50%"],
		  easing: $.easing.easeInOutElastic,
		  callback: function(){ 
						var n = $(this).getRotateAngle();
						endAnimate(n);
					},
		  duration:5000
	   });
	}

	function endAnimate($n){
		var n = $n;
		var mailage = 0;
		$('#result_id').html("<p>움직인각도:" + n + "</p>");
		var real_angle = n%360 +18;
		var part = Math.floor(real_angle/36);
	
		$('#result_id2').html("<p>상품범위:" + part + "</p>");

		if(part < 1){
			$('#result_id3').html("<p>당첨내역:" + pArr[0] + "</p>");
			mailage = part * 100;
			return;
		}
		if(part == 4){
			$('#result_id3').html("<p>꽝!!!</p>");
			return;
		}

		if(part >= 10){
			$('#result_id3').html("<p>당첨내역:" + pArr[pArr.length-1] + "</p>");
			mailage = part * 100;
			return;
		}

		$('#result_id3').html("<p>당첨내역:" + pArr[part] + "</p>");
		mailage = part * 100;
		$('#result_id3').html("<p>" + mailage + " 마일리지 획득!!!</p>");
		
	}

	function randomize($min, $max){
		return Math.floor(Math.random() * ($max - $min + 1)) + $min;
	}
};
</script>
</body>
</html>