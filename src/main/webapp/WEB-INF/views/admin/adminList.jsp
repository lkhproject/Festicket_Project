<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>페스티켓</title>
	<link rel="stylesheet" type="text/css" href="/resources/css/bootstrap.min.css">
	<link rel="stylesheet" type="text/css" href="/resources/css/adminList.css">
	<script src="/resources/js/bootstrap.min.js"></script>
</head>
<body style="background-color: #eeeeee;">

<%
	int adminCheck = Integer.parseInt((request.getAttribute("adminCheck")).toString());

	if(adminCheck == 0) {
%>
	<script>
		alert("권한이 없는 페이지 입니다.");
		history.back();
	</script>
<%
	}
%>

<!-- 헤더 -->
	<%@ include file="../include/header.jsp" %>
<!-- 헤더 끝 -->

<!-- 행사 리스트 6개 -->
<div class="container">
<div class="container_1">
<div id="admin_page_form">
	<h2 class="adminTitle">관리자 페이지</h2>
	<div style="margin-bottom: 10px;">총 <b>${totalCount }</b>개의 행사가 조회되었습니다.</div>
	<table class="table table-hover" id="adminListTable">
	  <thead style="background-color: #eeeeee">
	    <tr>
	      <th scope="col">번호</th>
	      <th scope="col">장소</th>
	      <th scope="col">행사명</th>
	      <th scope="col">행사기간</th>
	    </tr>
	  </thead>
	  <tbody class="table-group-divider">
	  <c:choose>
		<c:when test="${totalCount > 0 }">
		  <c:forEach items="${eventListDtos }" var="event">
		    <tr>
		      <th scope="row">${event.eventNum }</th>
		      <td>서울/${event.gunName }</td>
		      <td><a href="adminModify?selectedEvent=${event.eventNum }">
			      <c:choose>
						<c:when test="${fn:length(event.title) > 25}">
							<c:out value="${fn:substring(event.title, 0, 24)}"></c:out>...
						</c:when>
						<c:otherwise>
							<c:out value="${event.title }"></c:out>
						</c:otherwise>
				  </c:choose>
			  </a></td>
		      <td>${event.eventDate }</td>
		    </tr>
		  </c:forEach>
		  </c:when>
  		  <c:otherwise>
             <div id="noResult">조회된 결과가 없습니다.</div>
	     </c:otherwise>
		</c:choose>
	  </tbody>
	</table>
<!-- 행사 리스트 끝 -->

<!-- 검색, 등록 -->
	<div class="container" style="padding-top: 10px">
	 <div class="search_board_area">
	 <form class="search" method='get' action='searchResult'>
		 <div class="search_board">
		 	<input class="search_board_box" type="text" id="search_word" name="keyword">
			<input class="search_board_img" type="image" src="/resources/img/search_board_btn.png" alt='검색하기'>
		 </div>
	 </form>
	 <div class="button">
		<input type="button" class="btn" onclick="script:window.location.href='adminEventAdd'" value="등록">
	 </div>
	 </div>
	 </div>
<!-- 검색, 등록 끝 -->

<!-- 페이징 -->
	<div class="container" id="pagingNum">
	  <ul class="pagination">
    	<li class="page-item" id="page-item">
			<c:if test="${pageMaker.prev }">
				<a class="page-link" aria-label="Previous" href="adminList?pageNum=${pageMaker.startPage-5 }">
					<span aria-hidden="true">&laquo;</span>
				</a>
			</c:if>
		</li>
		
		<c:forEach begin="${pageMaker.startPage }" end="${pageMaker.endPage }" var="num">
			<c:choose>
				<c:when test="${currPage == num }">
					<li class="page-item">
						<span class="page-link" style="font-weight: bold;">${num }</span>
					</li>
				</c:when>
				<c:otherwise>
					<li class="page-item">
						<a class="page-link" href="adminList?pageNum=${num }">${num }</a>
					</li>
				</c:otherwise>
			</c:choose>
		</c:forEach>
		
		<li class="page-item">
			<c:if test="${pageMaker.next }">
				<a class="page-link" aria-label="Next" href="adminList?pageNum=${pageMaker.startPage+5 }">
					<span aria-hidden="true">&raquo;</span>
				</a>
			</c:if>
		</li>
	  </ul>
	</div>
	
<!-- 페이징 끝 -->
	</div>
	</div>
</div>

<!-- 푸터 -->
	<%@ include file="../include/footer.jsp" %>
<!-- 푸터 끝 -->

</body>
</html>