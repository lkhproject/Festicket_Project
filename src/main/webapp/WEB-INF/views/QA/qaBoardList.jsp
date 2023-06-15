<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" type="text/css" href="/resources/css/bootstrap.min.css">
<link rel="stylesheet" type="text/css" href="/resources/css/csBoardList.css">
<script src="/resources/js/bootstrap.min.js"></script>
<title>페스티켓</title>
</head>
<body>
	<!-- 헤더 시작 -->
	<%@ include file="../include/header.jsp" %>
	<!-- 헤더 끝-->

	<!-- 게시글 리스트 시작 -->
	<div class="container">
	<div class="container_1">
	<div id="csBoard_page_form">
		<h2 class="csBoardTitle">QA 게시판</h2>
		<h5 style="float: right;">${event.title }</h5>
		<table class="table table-hover" id="csListTable">
			<thead>
				<tr>
			      <th scope="col">번호</th>
			      <th scope="col" style="width:350px;">제목</th>
			      <th scope="col">작성자</th>
			      <th scope="col">작성일</th>
			      <th scope="col">조회수</th>
	    		</tr>
	  		</thead>
	  		<tbody class="table-group-divider">
		  		<c:forEach items="${QAListDtos }" var="qaList"  begin="0" end="11">
				    <tr>
				      <th scope="row">${qaList.q_idx }</th>
				      <td>
						<a href="qaView?selectedQA=${qaList.q_idx }">
						<!-- 제목 글자수 제한 -->
						<c:choose>
							<c:when test="${fn:length(qaList.q_title) > 20}">
								<c:out value="${fn:substring(qaList.q_title, 0, 19)}"></c:out>...
							</c:when>
							<c:otherwise>
								<c:out value="${qaList.q_title }"></c:out>
							</c:otherwise>
						</c:choose>
						</a>
						<!-- 댓글 수 -->
						<c:if test="${qaList.q_replyCount != 0 }">
			            	<span class="badge">${qaList.q_replyCount }</span>
			            </c:if>   
				      </td>
				      <td>${qaList.q_userId }</td>
				      <td><fmt:formatDate value="${qaList.q_writeDate }" pattern="yyyy-MM-dd"/></td>
				      <td>${qaList.q_hit }</td>
				    </tr>
			  	</c:forEach>
	  		</tbody>
	  	</table>
	  	<input type="button" value="돌아가기" id="QAbtn" onclick="script:window.location.href='rvView?selectedEvent=${event.eventNum}'">
	  	<c:if test="${sessionId != null && sessionId ne 'admin'}">
			<input type="button" value="문의하기" id="inquiry" onclick="script:window.location.href='qaBoardWrite?eventNum=${event.eventNum}'">
		</c:if>
	<!-- 게시글 리스트 끝 -->
	
	<!-- 페이징 시작 -->
	<div class="container" id="csPagingNum">
		<c:if test="${pageMaker.prev }">
			<a href="qaBoardList?pageNum=${pageMaker.startPage-5 }"><c:out value="${'<' }"></c:out></a>&nbsp;&nbsp;&nbsp;
		</c:if>
		
		<c:forEach begin="${pageMaker.startPage }" end="${pageMaker.endPage }" var="num">
			<c:choose>
				<c:when test="${currPage == num }">
					<span style="font-weight: bold;">${num }</span>&nbsp;&nbsp;&nbsp;
				</c:when>
				<c:otherwise>
					<a href="qaBoardList?pageNum=${num }">${num }</a>&nbsp;&nbsp;&nbsp;
				</c:otherwise>
			</c:choose>
		</c:forEach>
		
		<c:if test="${pageMaker.next }">
			<a href="qaBoardList?pageNum=${pageMaker.startPage+5 }"><c:out value="${'>' }"></c:out></a>
		</c:if>
	</div>
	<!-- 페이징 끝 -->

	</div>
	</div>
	</div>
	
	<!-- 푸터 시작 -->
	<%@ include file="../include/footer.jsp" %>
	<!-- 푸터 끝 -->
</body>
</html>