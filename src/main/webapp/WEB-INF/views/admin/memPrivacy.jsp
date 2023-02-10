<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<%@ include file="/WEB-INF/inc/top.jsp"%>
<title>InfoChange</title>

<style type="text/css">


.table-bordered .tdcell {
    padding: 32px 0 32px 30px;
}

div {
    display: block;
}

.table-bordered td {
    color: #565656;
}

.table-bordered td, .table-bordered th {
    text-align: left;
    vertical-align: top;
    letter-spacing: -1px;
    border: 0;
    border-top: 1px solid #e5e5e5;
}

.table-bordered {
    position: relative;
    width: 100%;
    table-layout: fixed;
    border-spacing: 0;
    border-collapse: collapse;
    word-wrap: break-word;
    word-break: keep-all;
    border: 0;
    border-bottom: 1px solid #e5e5e5;
}


element.style {
}

.table-bordered .tdcell {
    padding: 32px 0 32px 30px;
}
user agent stylesheet
div {
    display: block;
}
.table-bordered td {
    color: #565656;
}
.table-bordered td, .tbl_model th {
    line-height: 14px;
    text-align: left;
    vertical-align: top;
    letter-spacing: -1px;
    border: 0;
    border-top: 1px solid #e5e5e5;
}
.table-bordered {
    position: relative;
    width: 100%;
    table-layout: fixed;
    border-spacing: 0;
    border-collapse: collapse;
    word-wrap: break-word;
    word-break: keep-all;
    border: 0;
    border-bottom: 1px solid #e5e5e5;
}

body, button, input, select, table, textarea {
    font-family: -apple-system,BlinkMacSystemFont,"Malgun Gothic","맑은 고딕",helvetica,"Apple SD Gothic Neo",sans-serif;
    font-size: 12px;
}

table {
    text-indent: initial;
    border-top: 1px solid #e5e5e5;
}

body {
    width: 100%;
    height: 100%;
    -webkit-text-size-adjust: none;
}

p {
	margin-bottom: 50px;
}

.thcell b {
	font-size: 15px;
	text-align: center;
}

</style>

</head>
<body>
<div class="container" style="margin-top: 130px; ">
<form:form action="adminChangeModify.wow" name="frmSignup" method="post" modelAttribute="member" >
	<div id="frm_assign" align="center" class="">
		<div id="frm_input" align="center" style="margin-top: 30px;"> 
		<form:hidden path="memId" />

		<table class="table-bordered">
				<tbody>
				
					<tr>
						<th class="col-2"><div class="thcell"><b>이름</b></div></th>
						<td class="col-4"><div class="tdcell">
							<form:input path="memName" cssClass="form-control" /><br>
							<form:errors path="memName" />
							</div>
						</td>
					</tr>
					
					<tr>
						<th class="col-2"><div class="thcell"><b>선호하는대륙</b></div></th>
						<td class="col-4"><div class="tdcell">
							<form:select path="memLike" cssClass="form-control">
							<option value="">-- 선호하는 대륙 -- </option>
							<form:options items="${categories}" itemValue="commNm" itemLabel="commNm" />
							</form:select>
							</div>
						</td>
					</tr>
					
					<tr>
						<th class="col-2"><div class="thcell"><b>생일</b></div></th>
						<td class="col-4"><div class="tdcell">
							<input type="date" name="memBir" value="${member.memBir}" class="form-control" required="required">
							</div>
						</td>
					</tr>
					
					<tr>
						<th class="col-2"><div class="thcell"><b>우편번호</b></div></th>
						<td class="col-4"><div class="tdcell">
							<form:input path="memZip" id="memZip" cssClass="form-control"/><br>
							<form:errors path="memZip" />
							</div>
						</td>
					</tr>
					
					<tr>
						<th class="col-2"><div class="thcell"><b>주소</b></div></th>
						<td class="col-4"><div class="tdcell">
							<form:input path="memAdd1" id="memAdd1" cssClass="form-control"/><br>
							<form:errors path="memAdd1" />
							</div>
						</td>
					</tr>
					
					<tr>
						<th class="col-2"><div class="thcell"><b>상세주소</b></div></th>
						<td class="col-4"><div class="tdcell">
							<form:input path="memAdd2" id="memAdd2" cssClass="form-control"/>
							</div>
						</td>
					</tr>
					
					<tr>
						<th class="col-2"><div class="thcell"><b>핸드폰</b></div></th>
						<td class="col-4"><div class="tdcell">
							<form:input path="memHp" cssClass="form-control"/><br>
							<form:errors path="memHp" />
							</div>
						</td>
					</tr>
					
					<tr>
						<th class="col-2"><div class="thcell"><b>메일</b></div></th>
						<td class="col-4"><div class="tdcell">
							<form:input path="memMail" cssClass="form-control"/><br>
							<form:errors path="memMail" />
							</div>
						</td>
					</tr>
										
				</tbody>
			</table>
		
<%-- 			<span><b>이름</b></span>
			<form:input path="memName" cssClass="" /><br>
			<form:errors path="memName" /> <br><br>
			
			<span><b>선호하는대륙</b></span>	
			<form:select path="memLike" cssClass="">
			<option value="">-- 선호하는 대륙 -- </option>
			<form:options items="${categories}" itemValue="commNm" itemLabel="commNm" />
			</form:select><br><br>
			
			<span><b>생일</b></span>
			<input type="date" name="memBir" value="${member.memBir}" class="" required="required"><br><br><br>
			
			
			<span><b>우편번호</b></span> 
			<form:input path="memZip" cssClass=""/><br>
			<form:errors path="memZip" /> <br><br>
			
			<span><b>주소</b></span> 
			<form:input path="memAdd1" cssClass=""/><br>
			<form:errors path="memAdd1" /> <br><br>
			
			<span><b>상세주소</b></span>
			<form:input path="memAdd2" cssClass=""/><br><br><br>
		<!-- 	<input type="text" name="memAdd2" class="" placeholder="상세주소"/><br><br> -->
			
			<span><b>핸드폰</b></span>
			<form:input path="memHp" cssClass=""/><br>
			<form:errors path="memHp" /> <br><br>
			
			<span><b>메일</b></span> 
			<form:input path="memMail" cssClass=""/><br>
			<form:errors path="memMail" /> <br><br> --%>
		</div>
		<div align="center" style="margin: 10px; margin-bottom: 100px;">
			<button type="submit" class="btn btn-sm btn-dark">변경</button>
		</div>
	</div>
</form:form>
</div>
<%@ include file="/WEB-INF/inc/footer.jsp"%>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>


	<br>
</body><!-- end.container -->

<script type="text/javascript">

//주소 추가
window.onload = function(){
  document.getElementById("memZip").addEventListener("click", function(){ //주소입력칸을 클릭하면
      //카카오 지도 발생
      new daum.Postcode({
          oncomplete: function(data) { //선택시 입력값 세팅
              document.getElementById("memZip").value = data.zonecode; // 주소 넣기
              document.getElementById("memAdd1").value = data.address; // 주소 넣기
              document.getElementById("memAdd2").focus(); //상세입력 포커싱
          }
      }).open();
  });
}

</script>

</html>