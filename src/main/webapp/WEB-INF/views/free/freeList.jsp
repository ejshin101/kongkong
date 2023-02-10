<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="kongkong" tagdir="/WEB-INF/tags/kongkong"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div class="row">
		<div class="col-12">
			<!-- 기본 게시판 시작 -->
			<table
				class="table table-bordered table-hover text-center fifth-gray">
				<colgroup>
					<col width="10%" />
					<col />
					<col width="10%" />
					<col width="10%" />
				</colgroup>
				<thead>
					<tr>
						<th>글번호</th>
						<th>일반게시판</th>
						<th>분류</th>
						<th>작성자</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach items="${freeBoardList}" var="freeBoard">
						<tr class="text-center">
							<td>${freeBoard.boNo}</td>
							<td class="text-left"><a
								href="freeView.wow?boNo=${freeBoard.boNo}">
									${freeBoard.boTitle} </a></td>
							<td>${freeBoard.boWriter}</td>
							<td>${freeBoard.boCategory}</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
			<kongkong:paging pagingVO="${searchVO}" />
		</div>
	</div>
</body>
<script type="text/javascript">
	// ---전역 변수 설정
	//자바스크립트객체하고 jQuery 객체하고 구분하기 위한  jQuery 객체변수는 $로 시작
	$frm = $('form[name=frm_search]');

	// ---일반 함수 설정

	// ---이벤트 함수 설정

	// $frm 서브밋 이벤트가 발생할 때
	// curPage = 1
	$('button[type=submit]', $frm).click(function(e) {
		e.preventDefault();
		$frm.find("input[name=curPage]").val(1);
		$frm.submit();
	});

	//id_btn_reset 클릭 할 때
	//curPage = 1
	//모든 객체는 초기화 해주시면 됩니다.

	//페이지네이션의 a 링크 클릭

	$('nav ul.pagination a[data-page]').click(function(e) {
		e.preventDefault();
		$this = $(this);
		$frm.find("input[name=curPage]").val($this.data('page'));
		$frm.submit();
	});

	//로우 사이즈 변경
	$('#id_rowSizePerPage').change(function(e) {
		e.preventDefault();
		$this = $(this);
		console.log('select val', $this.val());
		$frm.find("input[name=curPage]").val(1);
		$frm.find("input[name=rowSizePerPage]").val($this.val());
		$frm.submit();

	});
	// --- 초기화 호출
	$('#id_btn_reset').click(
			function(e) {
				e.preventDefault();
				$frm.find("input[name=curPage]").val(1);
				$frm.find("input[name=searchWord]").val("");
				$frm.find("select[name=searchType]").val("T");
				$frm.find("select[name=searchCategory] option:first").prop(
						"selected", true);
			});
</script>
</html>