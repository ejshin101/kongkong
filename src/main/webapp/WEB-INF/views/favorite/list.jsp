<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="paging" tagdir="/WEB-INF/tags/kongkong" %>
<!DOCTYPE html>
<html lang="ko">
<head>
<style>
       #sideBar {
        	border-style: solid;
            position: absolute;
            top: 200px;
            width: 150px;
        }
        #ad {
        	border-style: solid;
            position: absolute;
            top: 550px;
            height: 150px;
            width: 150px;
            background-color: aqua;
        }
    </style>
    <!-- 아래 제이쿼리는 1.0이상이면 원하는 버전을 사용하셔도 무방합니다. -->
<script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js" ></script>	
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%@include file="/WEB-INF/inc/top.jsp"%>
<%@include file="/WEB-INF/inc/topMypageHome.jsp"%>

<div style="height: 50px"></div>

<div class="container">
<div class="page-header">
		<h3>즐겨찾기 목록</h3>
	</div>
<div style="height: 30px"></div>
<!-- START : 검색 폼  --> 
	<div align="center" class="form-group border">
	<div class="form-group"></div>
    <form name="frm_search" action="favoriteList" method="get" class="form-horizontal">
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
                    <option value="QNA"
						${searchVO.searchCategory eq "QNA" ? 'selected="selected"' : '' }>QNA</option>
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
                <button type="submit" class="btn btn-sm btn-primary ">
                    <i class="fa fa-search"></i>
                    &nbsp;&nbsp;검 색
                </button>
            </div>    
          	<div class="col-sm-1" ></div>
            </div>     
    </form>
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
	

	

	<table class="table table-bordered table-hover text-center fifth-gray">
	<thead>
		<tr>
			<th>제목</th>
			<th>즐겨찾기 추가일</th>
		</tr>
	</thead>	
	<tbody>

	<c:forEach items="${results}" var="vo">
<tr>
		<td>
		<a href="<%=request.getContextPath()%>/free/${vo.faCategorys}View.wow?boNo=${vo.faBoNo}">
									${vo.faTitle} </a>
		</td>
		<td>
		${vo.faDate}
		
		</td>
	 </tr>
	 </c:forEach>
	</tbody>
	</table>
	<!-- start pagination -->
	<div style="margin-bottom: 50%">
	<paging:paging pagingVO="${searchVO }"/>
	</div>
	<!-- end pagination -->
</div> <!-- end .container -->


<script type="text/javascript">
$frm = $('form[name=frm_search]');


//일반 함수 설정

//이벤트 함수 설정

//$frm이 서브밋 이벤트가 발생할 때
//curPage = 1로 변경 후 submit
$('button[type=submit]',$frm).click(function(e) {
	e.preventDefault();
	$frm.find("input[name=curPage]").val(1);
	$frm.submit();
});

//id_btn_reset 클릭할 때
//curPage = 1, 모든 객체는 초기화
$('#id_btn_reset').click(function(e) {
	e.preventDefault();
	$this = $(this);
	$frm.find("input[name=curPage]").val(1);
	$frm.find("input[name=searchStartDate]").val("");
	$frm.find("input[name=searchEndDate]").val("");
	$frm.find("select[name=searchType]").val("");
	$frm.find("#id_searchType:radio[value='']").attr("checked", true) ;

	//-------------selectbox 제어 방법 3가지
	//$frm.find("select[name=searchCategory]").val("");
	//$frm.find("select[name=searchCategory] option:first").attr("selected","selected");
	$frm.find("select[name=searchCategory] option:first").prop("selected",true); //권장
});

//pagination의 a 링크를 클릭했을 때
$('nav ul.pagination a[data-page]').click(function(e){
 e.preventDefault();
	$this = $(this);
 //console.log('this',this.dataset.page);  //javascript 객체
 //console.log('$this',$this.data('page')); //jQuery 객체
 
 $frm.find("input[name=curPage]").val($this.data('page'));
 $frm.submit();
}); // end 'nav ul.pagination a[data-page]').click

//rowSizePerPage 변경
$('#id_rowSizePerPage').change(function(e){
	e.preventDefault();
	$this = $(this);
	console.log('select val', $this.val());
 $frm.find("input[name=curPage]").val(1);
 $frm.find("input[name=rowSizePerPage]").val($this.val());
 $frm.submit();
	
});

//초기화 호출
</script> 
<script type="text/javascript">
//전역변수 설정
//자바스크립트 객체하고 jQuery 객체하고 구분하기 위해 jQuery 객체변수는 $로 시작
$frm = $('form[name=frm_search]');

//$frm이 서브밋 이벤트가 발생할 때
//curPage = 1로 변경 후 submit
$('button[type=submit]',$frm).click(function(e) {
	e.preventDefault();
	$frm.find("input[name=curPage]").val(1);
	$frm.submit();
});

//id_btn_reset 클릭할 때
//curPage = 1, 모든 객체는 초기화
$('#id_btn_reset').click(function(e) {
	e.preventDefault();
	$this = $(this);
	$frm.find("input[name=curPage]").val(1);
	$frm.find("input[name=searchWord]").val("");
	$frm.find("select[name=searchType]").val("T");
	
	//-------------selectbox 제어 방법 3가지
	//$frm.find("select[name=searchCategory]").val("");
	//$frm.find("select[name=searchCategory] option:first").attr("selected","selected");
	$frm.find("select[name=searchCategory] option:first").prop("selected",true); //권장
});

//pagination의 a 링크를 클릭했을 때
$('nav ul.pagination a[data-page]').click(function(e){
 e.preventDefault();
	$this = $(this);
 //console.log('this',this.dataset.page);  //javascript 객체
 //console.log('$this',$this.data('page')); //jQuery 객체
 
 $frm.find("input[name=curPage]").val($this.data('page'));
 $frm.submit();
}); // end 'nav ul.pagination a[data-page]').click

//rowSizePerPage 변경
$('#id_rowSizePerPage').change(function(e){
	e.preventDefault();
	$this = $(this);
	console.log('select val', $this.val());
 $frm.find("input[name=curPage]").val(1);
 $frm.find("input[name=rowSizePerPage]").val($this.val());
 $frm.submit();
	
});

//초기화 호출
</script> 
</body>
</html>