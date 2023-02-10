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


.table .tdcell {
    padding: 32px 0 32px 30px;
}

div {
    display: block;
}

.table td {
    color: #565656;
}

.table td, .table-bordered th {
    text-align: left;
    vertical-align: top;
    letter-spacing: -1px;
    border: 0;
    border-top: 1px solid #e5e5e5;
}

.table {
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

.table .tdcell {
    padding: 32px 0 32px 30px;
}

div {
    display: block;
}
.table td {
    color: #565656;
}
.table td, .tbl_model th {
    line-height: 14px;
    text-align: left;
    vertical-align: top;
    letter-spacing: -1px;
    border: 0;
    border-top: 1px solid #e5e5e5;
}
.table {
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
<%@ include file="/WEB-INF/inc/topSignup.jsp"%>
<body>
<div class="container" style="margin-top: 100px; margin-bottom:100px;" >
	<form:form action="signupUser.wow" name="frmSignup" method="post" modelAttribute="member" >
	<%-- <form name="frmSignup" action="signupUser.wow" method="post" style="margin-top: 100px;"> --%>
		<div id="frm_assign" align="center" >
		<div class="col-10" >
		
			<div style="width: auto;height: 200px; overflow: auto; margin-top: 30px " class="form-control">
				<%-- <c:import url="/resources/assignment" charEncoding="utf-8" /> --%>
				<%@ include file="/WEB-INF/inc/assignment.jsp"%>				
			 </div><br>
		</div>
			
			
			<form:checkbox path="memCheckbox" cssClass="form-check-input" /><span style="font-size:12px; margin-bottom: 10px ">개인정보 수집ㆍ이용에 동의합니다.(필수)</span><br>
			<form:errors path="memCheckbox" /> <br><br>
			<!-- <input name="memCheckbox" type="checkbox" required="required" style=""><span style="font-size:12px; margin-bottom: 10px "> 개인정보 수집ㆍ이용에 동의합니다.(필수)</span></input> -->
		</div>
		
		<table class="table">
				<tbody>
					
					<tr>
						<th class="col-2"><div class="thcell"><b>아이디</b></div></th>
						<td class="col-4"><div class="tdcell">
							<form:input path="memId" id="idDoubleChk" cssClass="form-control" placeholder="영문, 숫자, 언더바 4~8자리 까지 입력"/><br>
							<form:errors path="memId" />
							<span id="result_id_msg"></span>
							</div>
						</td>
					</tr>
					
					<tr>
						<th class="col-2"><div class="thcell"><b>비밀번호</b></div></th>
						<td class="col-4"><div class="tdcell">
							<form:password path="memPass" id="pwDoubleChk" cssClass="form-control" placeholder=" 특수문자 / 문자 / 숫자 포함 형태의 8~15자리 까지 입력 "/><br>
							<form:errors path="memPass" />
							</div>
						</td>
					</tr>
					
					<tr>
						<th class="col-2"><div class="thcell"><b>비밀번호 확인</b></div></th>
						<td class="col-4"><div class="tdcell">
							<form:password path="memPassChk" id="pwDoubleChk2" cssClass="form-control" /><br>
							<form:errors path="memPassChk" />
							<span id="result_pw_msg"></span>
							</div>
						</td>
					</tr>
				
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
							<input type="date" name="memBir" class="form-control" required="required">
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
							<input type="text" name="memAdd2" id="memAdd2" class="form-control" placeholder="상세주소"/>
							</div>
						</td>
					</tr>
					
					<tr>
						<th class="col-2"><div class="thcell"><b>핸드폰</b></div></th>
						<td class="col-4"><div class="tdcell">
							<form:input path="memHp" cssClass="form-control" placeholder="'-'없이 숫자만 입력"/><br>
							<form:errors path="memHp" />
							</div>
						</td>
					</tr>
					
					<tr>
						<th class="col-2"><div class="thcell"><b>메일</b></div></th>
						<td class="col-4"><div class="tdcell">
							<form:input path="memMail" cssClass="form-control" id="memMail" required="required" style="width: 87%; float:left" placeholder="abcd@naxxx.com" />
							<button type="button" id="sendMailButton" onclick="fn_email()" class="kongkongsDark-sm" style="float:right; position: relative; top: 4px;">인증</button><br><br>
							
							<br><input type="text" hidden="" class="form-control" id="mailHidden" style="width: 87%; float: left">
							<button type="button" hidden="" id="mailButtonHidden" onclick="fn_email_Chk()" class="kongkongsDark-sm" style="float:right; position: relative; top: 4px;" >인증확인</button>
							<input type="hidden" value="" class="form-control" id="emailnumRepository">
							<input type="hidden" value="false" name="emailNumKeyChecked" class="form-control" id="emailNumKeyChecked"><br>
							<form:errors path="memMail" />	
							</div>
						</td>
					</tr>
				</tbody>
			</table>
			
		<div align="center" style="margin: 10px; margin-bottom: 50px;">
			<button type="submit" class="kongkongsDark"><strong>회원가입</strong></button>
		</div>
	</form:form>

</div>
<%@ include file="/WEB-INF/inc/loginfooter.jsp"%>
</body><!-- end.container -->

<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script type="text/javascript">


//아이디 중복 확인
$(document).ready(function(){
    $('#idDoubleChk').keyup(function(){
        if ( $('#idDoubleChk').val().length > 3) {
            var memId = $(this).val();
            var url = '<c:url value="/signup/findUser.wow"/>';
            // ajax 실행
            $.ajax({
                type : 'POST',				//화면에서 controller로 보내는 정보들
                url : url,					//화면에서 controller로 보내는 정보들
                data: {"memId": memId},		//화면에서 controller로 보내는 정보들
                success : function(data) {	//return에서 데려온 정보
                	if (data === "null") {
                        $("#result_id_msg").html("사용 가능한 아이디 입니다.");
                    } else {
                        $("#result_id_msg").html("사용 불가능한 아이디 입니다.");
                    } 
                }
            }); // end ajax
        }
    }); // end keyup
});



//비밀번호 위에입력한거랑 같은지
$(document).ready(function(){
    $('#pwDoubleChk2').keyup(function(){
        if ( $('#pwDoubleChk2').val().length > 7) {
            var memPw = $('#pwDoubleChk').val();
            var memPassChk = $('#pwDoubleChk2').val();
            
            if(memPw != memPassChk) {
            	$("#result_pw_msg").html("비밀번호가 일치하지 않습니다");
            }else{
            	$("#result_pw_msg").html("비밀번호가 일치합니다");
            }
            
         
        }
    }); // end keyup
});



//메일 실존 확인

function fn_email() {
	//ajax 의 url을 spring Controller의 RequstMapping("") 으로 요청
	var memMail = $("#memMail").val();
	var url = '<c:url value="/email/sendEmail.wow"/>';
	
	$.ajax({
		url: url,		
		data : {"memMail" : memMail },		
		type : "POST",
		success: function(data){ //data = 6자리 랜덤 키
			console.log(data);
			$("#mailHidden").removeAttr("hidden"); // 이메일 인증번호 입력칸 나오게 
			$("#mailButtonHidden").removeAttr("hidden"); // 이메일 인증번호 확인 버튼 나오게 
			$("#emailnumRepository").val(data); // 이메일 인증번호 저장하기 
		},
		error: function(request, status, error){
			alert("인증번호가 일치하지 않습니다. 올바르게 입력해 주세요.");
		}
	}); //ajax
}//fn_email

function fn_email_Chk() {
	//emailnumRepository에 저장된 값 이랑 사용자가 입력한 6자리 숫자 - emailAuthKey 값이 같으면 emailAuthKeyChecked의 value값이 Y로 
	if($("#emailnumRepository").val()==$("#mailHidden").val()){
		$("#emailNumKeyChecked").val("true");
		 swal("메일인증이 완료되었습니다.","","success");
	}else {
		swal("인증번호가 일치하지 않습니다.","","error");
	}
	
}

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