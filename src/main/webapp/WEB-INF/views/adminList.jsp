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
	<link rel="stylesheet" type="text/css" href="/resources/css/style.css">
	<link rel="stylesheet" type="text/css" href="/resources/css/header.css">
	<link rel="stylesheet" type="text/css" href="/resources/css/adminList.css">
	<script src="/resources/js/bootstrap.min.js"></script>
</head>
<body style="background-color: #eeeeee;">
<!-- 헤더 -->
	<%@ include file="include/header.jsp" %>
<!-- 헤더 끝 -->

<!-- 행사 리스트 6개 -->
<div class="container">
<div class="container_1">
<div id="admin_page_form">
	<h2 class="adminTitle">관리자 페이지</h2>
	<table class="table table-hover" id="adminTable">
	  <thead style="background-color: #eeeeee">
	    <tr>
	      <th scope="col">번호</th>
	      <th scope="col">장소</th>
	      <th scope="col">행사명</th>
	      <th scope="col">행사기간</th>
	    </tr>
	  </thead>
	  <tbody class="table-group-divider">
		  <c:forEach items="${event }" var="event"  begin="0" end="5">
		    <tr>
		      <th scope="row">${event.eventNum }</th>
		      <td>서울/${event.gunName }</td>
		      <td><a href="#">${event.title }</a></td>
		      <td>${event.eventDate }</td>
		    </tr>
		  </c:forEach>
	  </tbody>
	</table>
<!-- 행사 리스트 끝 -->

<!-- 검색, 등록 -->
	<div class="container" style="padding-top: 10px">
		<input class="search_box_little" type=text>
		<div class="search_btn_img_little">
			<input type="image" src='/resources/img/search_btn.png' style="padding: 8px;" alt='검색하기' onfocus="this.blur();" >
		</div>
		<input type="button" class="btn" style="float: right;" onclick="script:window.location.href='adminEventAdd'" value="등록">
	</div>
<!-- 검색, 등록 끝 -->

<!-- 페이징 -->
	<div class="container" id="pagingNum">
		
			<c:out value="${'<' }"></c:out>
			 1 2 3 4 5 
			<c:out value="${'>' }"></c:out>
		<!-- 
		<c:if test="${pageMaker.prev }">
			<a href="list?pageNum=${pageMaker.startPage-5 }"><c:out value="${'<' }"></c:out></a>&nbsp;&nbsp;&nbsp;
		</c:if>
		
		<c:forEach begin="${pageMaker.startPage }" end="${pageMaker.endPage }" var="num">
			<c:choose>
				<c:when test="${currPage == num }">
					<span style="color: #FFFFFF; background-color: #000000; font-weight: bold;">${num }</span>&nbsp;&nbsp;&nbsp;
				</c:when>
				<c:otherwise>
					<a href="list?pageNum=${num }">${num }</a>&nbsp;&nbsp;&nbsp;
				</c:otherwise>
			</c:choose>
		</c:forEach>
		
		<c:if test="${pageMaker.next }">
			<a href="list?pageNum=${pageMaker.startPage+5 }"><c:out value="${'>' }"></c:out></a>
		</c:if>
		 -->
	</div>
	
<!-- 페이징 끝 -->
	</div>
	</div>
</div>

<!-- 푸터 -->
	<%@ include file="include/footer.jsp" %>
<!-- 푸터 끝 -->

</body>
</html>