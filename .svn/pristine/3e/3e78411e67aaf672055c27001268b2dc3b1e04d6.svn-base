<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<%@ include file="/WEB-INF/inc/top.jsp"%>
<title>Change Password</title>
</head>
<body>
<div class="container" style="margin-top: 80px;" >

<form:form action="passWordUpdate.wow" name="frmSignup" method="post" modelAttribute="member" >
	
		<div align="center" id="frm_input" style="margin-top: 30px;"> 
			<h2 align="center" style="margin-bottom: 30px">비밀번호 변경</h2><hr><br>
				
				<div align="center" class="form-floating mb-3 col-4">
		  				<label for="floatingPassword">변경 전 비밀번호</label><br>
		 				<form:password path="memPass" cssClass="form-control" />
				</div><br>
				<div align="center" class="form-floating col-4">
		  				<label for="floatingPassword">변경 후 비밀번호</label><br>
		  				<form:password path="memRepass" cssClass="form-control"/>
				</div><br>
						<div align="center" style="">
							<form:errors path="*" cssClass="" />
						</div>
				
				<div align="center">	
				<button class="kongkongsDark" type="submit" style="margin-bottom: 30px">확인</button><br>
				</div>
		</div>
				
				
			<%-- 	<div align="center"><b>변경 전 비밀번호</b></div>
				<div align="center">
					<form:password path="memPass" cssClass="form-control" /><br><br>
				</div>
				<div align="center"><b>변경 후 비밀번호</b></div>
				<div align="center">
					<form:password path="memRepass" cssClass=""/>
				</div><br> --%>
				
	
</form:form>



</div>
</body><!-- end.container -->
<%@ include file="/WEB-INF/inc/footer.jsp"%>
</html>