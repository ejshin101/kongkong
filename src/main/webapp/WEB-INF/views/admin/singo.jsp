<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html lang="ko">
<head>
<style type="text/css">

#sideBar {

}


</style>
<meta charset="UTF-8">
<%@ include file="/WEB-INF/inc/top.jsp"%>

<title>Insert title here</title>
</head>
<body>
<div class="row">
<div class="container" >
<div id="sideBar">
	<nav id="sideNav" class="navbar flex-column align-items-stretch p-3 ">
        <nav class="nav nav-pills flex-column">
        
        <div class="container overflow-hidden" style="margin-bottom: 15px; margin-top: 15px">
 			<div id="singo_block" class="row gx-5">
    			<div class="col">
     				<div id="singo" style="cursor: pointer; text-align: center;" class="p-3 border bg-light">신고 관리</div>
    			</div>
    			<div class="col">
      				<div id="block" style="cursor: pointer; text-align: center;" class="p-3 border bg-light">블락 관리</div>
    			</div>
  			</div>
		</div>
		</nav>
	</nav>
</div>
<div class="row">
	<div class="col-md-12" style="margin-bottom: 50px">
		<div id="targetdiv"></div>
		
	</div>
</div>

</div>
</div>

</body><!-- end.container -->
<%@ include file="/WEB-INF/inc/footer.jsp"%>

<script type="text/javascript">
$(document).ready(
		function() {
			
			$("#singo_block div").click(function() {
				var selectedLi = $(this).attr("id");
				if(selectedLi == "singo"){
					$("#targetdiv").load("realSingo.wow");
				}else if(selectedLi == "block"){
					$("#targetdiv").load("block.wow");
				}
			
			}) //
		});
			
</script>
</html>