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
		<h2 class="csBoardTitle">고객센터</h2>
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
		  		<c:forEach items="${CSboardDtos }" var="csList"  begin="0" end="11">
				    <tr>
				      <th scope="row">${csList.c_idx }</th>
				      <td>
						<a href="csBoardView?c_idx=${csList.c_idx }">
						<!-- 제목 글자수 제한 -->
						<c:choose>
							<c:when test="${fn:length(csList.c_title) > 25}">
								<c:out value="${fn:substring(csList.c_title, 0, 24)}"></c:out>...
							</c:when>
							<c:otherwise>
								<c:out value="${csList.c_title }"></c:out>
							</c:otherwise>
						</c:choose>
						</a>
						<!-- 댓글 수 -->
						<c:if test="${csList.c_replyCount != 0 }">
			            	<span class="badge">${csList.c_replyCount }</span>
			            </c:if>   
				      </td>
				      <td>${csList.c_userId }</td>
				      <td><fmt:formatDate value="${csList.c_writeDate }" pattern="yyyy-MM-dd"/></td>
				      <td>${csList.c_hit }</td>
				    </tr>
			  	</c:forEach>
	  		</tbody>
	  	</table>	  		
	<!-- 게시글 리스트 끝 -->
	 
	<!-- 검색 기능, 등록 버튼 시작 -->
	<div class="container">
	  <form action="csBoardSearch" method="get" class="search_form">
	  	<div class="search_button_area">    
	      <div class="search_select">
	        <select class="form-select" name="searchOption">
	          <option value="title">제목</option>
	          <option value="content">내용</option>
	          <option value="writer">아이디</option>
	        </select>
	      </div>
	      <div class="search_board">
	        <input class="search_board_box" type="text" name="keyword">
	        <input class="search_board_img" type="image" src="/resources/img/search_board_btn.png" alt='검색버튼'>
	      </div>
	      <div class="button">
	        <input type="button" class="btn" onclick="script:window.location.href='csBoardWrite'" value="등록">
	      </div>
	    </div>
	   </form>
	</div>
	<!-- 검색 기능, 등록 버튼 끝 -->
	
	<!-- 페이징 시작 -->
	<div class="container" id="csPagingNum">
	  <ul class="pagination">
    	<li class="page-item" id="page-item">
			<c:if test="${pageMaker.prev }">
				<a class="page-link" aria-label="Previous" href="csBoardSearch?pageNum=${pageMaker.startPage-5 }&searchOption=${param.searchOption}&keyword=${param.keyword}">
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
						<a class="page-link" href="csBoardSearch?pageNum=${num }&searchOption=${param.searchOption}&keyword=${param.keyword}">${num }</a>
					</li>
				</c:otherwise>
			</c:choose>
		</c:forEach>
		
		<li class="page-item">
			<c:if test="${pageMaker.next }">
				<a class="page-link" aria-label="Next" href="csBoardSearch?pageNum=${pageMaker.startPage+5 }&searchOption=${param.searchOption}&keyword=${param.keyword}">
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
	
	<!-- 푸터 시작 -->
	<%@ include file="../include/footer.jsp" %>
	<!-- 푸터 끝 -->
</body>
</html>