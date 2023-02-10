<%@ tag language="java" body-content="empty" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ attribute name="linkPage" type="java.lang.String"%>
<%@ attribute name="pagingVO" type="com.kongkong.common.vo.PagingVO" required="true"%>
<%
	if(linkPage != null && linkPage.startsWith("/") ){
		linkPage = request.getContextPath()+linkPage;
	}
	jspContext.setAttribute("linkPage", linkPage);
%>
<nav class="nav justify-content-left">
  <ul class="pagination">
  <c:if test="${pagingVO.startPage > 1}">
    <li>
      <a class="page-link" href="${linkPage}?curPage=${pagingVO.startPage - 1}" 
      		data-page="${pagingVO.startPage - 1}" aria-label="Previous">
        <span aria-hidden="true">&laquo;</span> 
      </a>
    </li>
  </c:if>
  
    <c:forEach begin="${pagingVO.startPage}" end="${pagingVO.endPage}" var="i">
    	<!-- 만약 i하고 curPage가 같으면 -->
    	<li ${pagingVO.curPage eq i ? 'class="page-item active" ': ''} >
    	<a class="page-link" href="boardQna.wow?curPage=${i}" data-page="${i}"> ${i} </a>
    	</li>
    </c:forEach>
    
   <c:if test="${pagingVO.endPage < pagingVO.totalPageCount}">
    <li>
      <a class="page-link" href="${linkPage}?curPage=${pagingVO.endPage+1}" 
      		data-page="${pagingVO.endPage + 1}" aria-label="Next">
        <span aria-hidden="true">&raquo;</span>
      </a>
    </li>
   </c:if>
  </ul>
</nav>
<!-- //end .pagination -->
