<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>페스티켓</title>
</head>
	<link rel="stylesheet" type="text/css" href="/resources/css/bootstrap.min.css">
	<link rel="stylesheet" type="text/css" href="/resources/css/festival.css">
</head>
<body style="background-color: #eeeeee;">
<!-- 헤더 -->
	<%@ include file="../include/header.jsp" %>
<!-- 헤더 끝 -->

<div class="container">
<div class="container_1">
<div class="continer_select">
  <div style="float: left;">
	<h2 class="title">전시</h2>
	<div class="totalNum">총 ${totalCount }건</div>
  </div>
  <!-- 선택하면 정렬 기능 추가 필요 -->
	<div class="selector">
		<select class="form-select form-select-sm" name="orderOption" aria-label=".form-select-sm example">
		  <option selected>정렬선택</option>
		  <option value="startRecent" >시작 날짜 빠른 순</option>
		  <option value="startLate" >시작 날짜 느린 순</option>
		  <option value="endRecent">종료 날짜 빠른 순</option>
		  <option value="endLate">종료 날짜 느린 순</option>
		</select>
	</div>
</div>

<!-- 전시 리스트 시작 -->
	<div class="container_2">
		<table class="table">
			<tbody>
				<c:choose>
					<c:when test="${totalCount > 0 }">
			
					  <c:forEach items="${exhibitionDtos }" var="exhibition">
					  <!-- eventNum 넘기기 -->
					  <input type="hidden" value="${exhibition.eventNum }" name="selectedEvent">
					    <tr>
					      <td scope="row" id="eventImgCell"><img src="${exhibition.main_img }" class="listImg"
					      	onclick="script:window.location.href='rvView?selectedEvent=${exhibition.eventNum }'"></td>
					      <td id="tableCenter">
					      	<div id="eventTitle">${exhibition.title }</div>
					      	<div id="eventDetail"><b>장 소:</b> ${exhibition.place }</div>
						  	<div id="eventDetail"><b>기 간:</b> ${exhibition.eventDate }</div>
						  	<div id="eventDetail"><b>관람가:</b>
						  		<c:choose>
								  	<c:when test="${exhibition.eventPrice == null}">무료</c:when>
								  	<c:otherwise>${exhibition.eventPrice }</c:otherwise>
							  	</c:choose>
						  	</div>
					      </td>
					      <td id="reserve"><input type="button" value="예매하기" onclick="script:window.location.href='rvView?selectedEvent=${exhibition.eventNum }'"></td>
					    </tr>
			  		</c:forEach>
			  		</c:when>
			  		<c:otherwise>
	                    <div id="noResult">조회된 결과가 없습니다.</div>
		            </c:otherwise>
			  	</c:choose>
			</tbody>
		</table>
		
<!-- 페이징 -->
	<div class="container" id="festPagingNum">
		
		<c:if test="${pageMaker.prev }">
			<a href="exhibition?pageNum=${pageMaker.startPage-5 }"><c:out value="${'<' }"></c:out></a>&nbsp;&nbsp;&nbsp;
		</c:if>
		
		<c:forEach begin="${pageMaker.startPage }" end="${pageMaker.endPage }" var="num">
			<c:choose>
				<c:when test="${currPage == num }">
					<span style="font-weight: bold;">${num }</span>&nbsp;&nbsp;&nbsp;
				</c:when>
				<c:otherwise>
					<a href="exhibition?pageNum=${num }">${num }</a>&nbsp;&nbsp;&nbsp;
				</c:otherwise>
			</c:choose>
		</c:forEach>
		
		<c:if test="${pageMaker.next }">
			<a href="exhibition?pageNum=${pageMaker.startPage+5 }"><c:out value="${'>' }"></c:out></a>
		</c:if>
	</div>
	
<!-- 페이징 끝 -->
		
	</div>
<!-- 전시 리스트 끝 -->


	</div>
</div>

<!-- 푸터 -->
	<%@ include file="../include/footer.jsp" %>
<!-- 푸터 끝 -->

</body>
</html>