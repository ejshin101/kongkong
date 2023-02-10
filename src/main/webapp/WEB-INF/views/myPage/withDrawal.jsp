<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<%@ include file="/WEB-INF/inc/top.jsp"%>
<title>Withdrawal</title>
</head>
<body>
<div align="center" class="container" style="margin-top: 80px" >
	<form:form action="infoDelete.wow" modelAttribute="member">
		<div align="center" style="margin: 50px">
			<h2><span style="color: orange">회원탈퇴</span>를 위해서 아이디와 비밀번호를 입력해 주세요.</h2>
		</div><hr>
			  
				<div align="center" class="form-floating mb-3 col-4">
		  				<label for="floatingInput">ID</label><br>
		 				<input type="" name="memId" class="form-control" id="floatingInput" placeholder="ID" required="required">
				</div><br>
				<div align="center" class="form-floating col-4">
		  				<label for="floatingPassword">Password</label><br>
		  				<input type="password" name="memPass" class="form-control" id="floatingPassword" placeholder="Password" required="required">
				</div>
		
				<!-- <div align="center"><b>아이디</b></div>
				<div align="center"><input name="memId" type="text" required="required"></div><br>
				
				<div align="center"><b>비밀번호</b></div>
				<div align="center"><input name="memPass" type="password" required="required"></div><br> -->
				
				<div align="center">
				<br><input type="checkbox" class="form-check-input" name="memCheckbox" required="required">
				<label class="form-check-label" for="flexCheckDefault">
				 회원탈퇴 즉시 회원정보는 모두 <span style="color: red">삭제</span>되며 재 가입시에도 복원되지 않습니다.
				</label>
				</div>
				<br>
				<div align="center" style="margin-top: 20px; margin-bottom: 50px"><button class="kongkongsDark" type="submit">회원 탈퇴</button> </div>
	</form:form>
</div>
</body><!-- end.container -->
<%@ include file="/WEB-INF/inc/footer.jsp"%>
</html>