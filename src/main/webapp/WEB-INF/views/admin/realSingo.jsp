<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@taglib prefix="kongkong" tagdir="/WEB-INF/tags/kongkong"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">

<title>Insert title here</title>
</head>
<body>
<!-- START : 검색 폼  --> 
	<div align="center" class="form-group border">
	<div class="form-group"></div>
	<div id="targetdiv">
	
    <form id="frm_search" name="frm_search" action="realSingo.wow" method="get" class="form-horizontal" onsubmit="return false;">
        <input type="hidden" name="curPage" value="${searchVO.curPage }">
        <input type="hidden" name="rowSizePerPage" value="${searchVO.rowSizePerPage }">
          <div class="form-group row">
            <label for="id_searchType" class="control-label"></label>
	            <label for="id_searchCategory" class="col-sm-1 control-label">분류</label>
            <div class="col-sm-2">
                <select id="id_searchCategory" name="searchCategory" class="form-control input-sm">
                    <option value="">-- 전체 --</option>
                    <option value="FREE"
						${searchVO.searchCategory eq "FREE" ? 'selected="selected"' : '' }>FREE</option>
                    <option value="TIP"
						${searchVO.searchCategory eq "TIP" ? 'selected="selected"' : '' }>TIP</option>
                </select>
            </div>

            <label for="id_searchStartDate" class="col-sm-1 control-label">시작일</label>
            <div class="col-sm-2">	
            	<input type="date" id="id_searchStartDate" name="searchStartDate" class="form-control input-sm" value="${searchVO.searchStartDate}">
            </div>
            <label for="id_searchEndDate" class="col-sm-1 control-label">종료일</label>
            <div class="col-sm-2">
            	<input type="date" id="id_searchEndDate" name="searchEndDate" class="form-control input-sm" value="${searchVO.searchEndDate}">
            </div>
            <div class="col-sm-2" >
              <button type="reset" id="id_btn_reset" class="btn btn-sm btn-warning">
                    <i class="fa fa-sync"></i>
                    &nbsp;&nbsp;초기화 
                </button>
                <button onclick="fnSubmit();" class="btn btn-sm btn-primary ">
                    <i class="fa fa-search"></i>
                    &nbsp;&nbsp;검 색
                </button>
            </div>    
          	<div class="col-sm-1" ></div>
            </div>     
    </form>
    </div>
    </div>
<!-- END : 검색 폼  -->  

<!-- START : 목록건수 및 새글쓰기 버튼  --> 
<div class="row mb-10" style="margin-bottom: 10px">
    <div class="col-sm-3 form-inline"  >
        전체 ${searchVO.totalRowCount} 건 조회
        <select id="id_rowSizePerPage" name="rowSizePerPage" class="form-control input-sm" >
            <option value="10"${searchVO.rowSizePerPage eq '10' ? 'selected="selected"' : '' } >10</option>
            <option value="20"${searchVO.rowSizePerPage eq '20' ? 'selected="selected"' : '' } >20</option>
            <option value="30"${searchVO.rowSizePerPage eq '30' ? 'selected="selected"' : '' } >30</option>
            <option value="50"${searchVO.rowSizePerPage eq '40' ? 'selected="selected"' : '' } >50</option>
        </select>
    </div>
</div>
<!-- END : 목록건수 및 새글쓰기 버튼  --> 

<table class="table text-center" id="table">
				<thead>
					<tr>
						<th>아이디</th>
						<th>글 번호</th>
						<th>게시판</th>
						<th>신고 게시글</th>
						<th>신고 날짜</th>
						<th>블락 및 취소</th>
					</tr>
				</thead>
				<tbody>
				<c:forEach items="${singoInfo}" var="singoInfo" varStatus="st">
					<tr class="">
						<td>${singoInfo.boId}  </td>
						<td>${singoInfo.boNo}</td>
						<td>${singoInfo.boCategory}</td>
						<td><a href="<%=request.getContextPath()%>/free/freeView.wow?boNo=${singoInfo.boNo}">${singoInfo.boTitle}</a></td>
						<td>${singoInfo.boSingoDate}</td>
						<td><%-- <a href="blockUpdate.wow?boNo=${singoInfo.boNo}" id="block" style="margin-right: 10px;" class="kongkongsRed-sm">블락</a> --%>
							<button class="kongkongsRed-sm"  style="margin-right: 10px;" data-bo-no="${singoInfo.boNo}" type="button" >블락</button>
							<button class="kongkongsYellow-sm"  style="margin-right: 10px;" data-bo-no="${singoInfo.boNo}" type="button" >취소</button>
							<%-- <a href="singoNope.wow?boNo=${singoInfo.boNo}" class="kongkongsYellow-sm">취소</a> --%></td>
					</tr>
					</c:forEach>
				</tbody>
			</table> 
		<kongkong:pagingRealSingo pagingVO="${searchVO}" />
			
</body><!-- end.container -->

<script type="text/javascript">

//---전역 변수 설정
//자바스크립트객체하고 jQuery 객체하고 구분하기 위한  jQuery 객체변수는 $로 시작
$frm = $('form[name=frm_search]');

// ---일반 함수 설정

function fnSubmit() {
	// $('#targetdiv').load('realSingo.wow', $("#frm_search").serialize(), "post");
	$.ajax({
		url: "realSingo.wow",		
		data : $("#frm_search").serialize(),		
		type : "POST",
		success: function(data){ 
			$('#targetdiv').html("");
			$('#targetdiv').append(data);
		},
		error: function(request, status, error){
		console.log("request", request);	
		console.log("status", status);
		}
	}); //ajax 
	
}
/* 
 $(".btn_block_proc").click(function (e) {
	 alert($(this).attr("data-bo-no"));
	$(this).closest('tr').remove();
});
 */
 $(".kongkongsRed-sm").click(function (e) {
	 boNo = $(this).attr("data-bo-no");
	$.ajax({
		url: "blockUpdate.wow?boNo=" + boNo,		
		type : "POST",
		success: function(data){ 
			$(".kongkongsRed-sm").click(function (e) {
				$(this).closest('tr').remove();
			});
		},
		error: function(request, status, error){
		console.log("request", request);	
		console.log("status", status);
	
		}
	}); //ajax 
 });
 
 $(".kongkongsYellow-sm").click(function (e) {
	 boNo = $(this).attr("data-bo-no");
	$.ajax({
		url: "singoNope.wow?boNo=" + boNo,		
		type : "POST",
		success: function(data){ 
			$(".kongkongsYellow-sm").click(function (e) {
				$(this).closest('tr').remove();
			});
		},
		error: function(request, status, error){
		console.log("request", request);	
		console.log("status", status);
	
		}
	}); //ajax 
 });


// ---이벤트 함수 설정

// $frm 서브밋 이벤트가 발생할 때
// curPage = 1
$('button[type=submit]', $frm).click(function(e) {
	e.preventDefault();
	$frm.find("input[name=curPage]").val(1);
	fnSubmit();
	//$frm.submit();
});

//id_btn_reset 클릭 할 때
//curPage = 1
//모든 객체는 초기화 해주시면 됩니다.

//페이지네이션의 a 링크 클릭

$('nav ul.pagination a[data-page]').click(function(e) {
	e.preventDefault();
	$this = $(this);
	$frm.find("input[name=curPage]").val($this.data('page'));
	fnSubmit();
	//$frm.submit();
});


//로우 사이즈 변경
$('#id_rowSizePerPage').change(function(e) {
	e.preventDefault();
	console.log("eeeeeeeeeeeeeee");
	$this = $(this);
	console.log('select val', $this.val());
	$frm.find("input[name=curPage]").val(1);
	$frm.find("input[name=rowSizePerPage]").val($this.val());
	fnSubmit();
	//$frm.submit();
});

$('#id_btn_reset').click(
		function(e) {
			e.preventDefault();
			$frm.find("input[name=curPage]").val(1);
			$frm.find("input[name=searchWord]").val("");
			$frm.find("select[name=searchType]").val("T");
			$frm.find("select[name=searchCategory] option:first").prop(
					"selected", true);
		});


// --- 초기화 호출







</script>


</html>