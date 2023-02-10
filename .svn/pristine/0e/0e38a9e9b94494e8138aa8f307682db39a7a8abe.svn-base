<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>${messageVO.title}</title>
</head>
<body>
	<%@include file="/WEB-INF/inc/top.jsp"%>
	<div class="container">
	<div  class="justify-content-md-center" style="background-color: #eaefff; border-radius:2em; text-align: center; margin: 100px">
		<div  class="">
			<br>
			<div class="page-header">
				<h3>${messageVO.title}</h3>
			</div>
			<br>
			
			<div class="panel panel-default">
				<div class="panel-heading">
					<p>${messageVO.message}</p>
				</div>
				
				<br>
				<div class="panel-body">
				<div class="pull-left">
					<a href="${pageContext.request.contextPath}/main.wow" class="kongkongs-sm"> 
					<span class="glyphicon glyphicon-home" aria-hidden="true"></span>
						&nbsp;Home
					</a>
					
						<a href="#" onclick="history.back()" class="kongkongsYellow-sm">
							<span class="glyphicon glyphicon-arrow-left" aria-hidden="true"></span>
							&nbsp;뒤로가기
						</a> &nbsp;&nbsp;
				</div>
						<br>
						
						<div class="pull-right">
						<c:if test="${not empty messageVO.url}">
							<a href="<c:url value='${messageVO.url}' />" class="kongkongsRed-sm"> 
							<span class="glyphicon glyphicon-new-window aria-hidden="true"></span>
								&nbsp;${messageVO.urlTitle}
							</a>
						</c:if>
						</div>
						<br>
					
				</div>
				
			</div>
			
		</div>

	</div>
	
	</div>
	<!-- end .container -->
	
	<%@ include file="/WEB-INF/inc/loginfooter.jsp"%>
</body>
</html>