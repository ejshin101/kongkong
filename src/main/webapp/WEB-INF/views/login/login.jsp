<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>

<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<%@ include file="/WEB-INF/inc/top.jsp"%>
<title>Login</title>
</head>
<%@ include file="/WEB-INF/inc/topLogin.jsp"%>
<body>
<div class="container" >

	<div class="login-form" align="center" style=" margin:50px;"   > 
		<form action="login.wow" method="post">

				<h2 style="margin: 30px">로그인</h2><hr><br>
					<div class="form-floating mb-3 col-4">
		  				<label for="floatingInput">ID</label><br>
		 				<input type="" name="UserId" class="form-control" id="floatingInput" placeholder="ID">
		  				<form:errors path="UserId"></form:errors>
					</div>
					<div class="form-floating col-4">
		  				<label for="floatingPassword">Password</label><br>
		  				<input type="password" name="UserPass" class="form-control" id="floatingPassword" placeholder="Password">
		  				<form:errors path="user.*" />
					</div>
				
				<!-- loginController의 loginPost에 있는 @ModelAttribute의 userError --><br>
				<input type="submit" value="확인" name="log_button" class="kongkongsDark" style="margin-bottom: 20px">


		</form>
		<p class="text-center text-muted small"> 아직 회원이 아니십니까? <a href="<%=request.getContextPath()%>/signup/signup.wow">회원가입</a>
			</p>
	</div><hr>

</div>
<%@ include file="/WEB-INF/inc/loginfooter.jsp"%>

</body><!-- end.container -->
</html>