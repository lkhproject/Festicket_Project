<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>페스티켓</title>
	<link rel="stylesheet" type="text/css" href="/resources/css/bootstrap.min.css">
	<link rel="stylesheet" type="text/css" href="/resources/css/style.css">
	<link rel="stylesheet" type="text/css" href="/resources/css/header.css">
	<link rel="stylesheet" type="text/css" href="/resources/css/festival.css">
	<script src="/resources/js/bootstrap.min.js"></script>
</head>
<body style="background-color: #eeeeee;">
<!-- 헤더 -->
	<%@ include file="include/header.jsp" %>
<!-- 헤더 끝 -->

<div class="container">
<div class="container_1">
<div class="continer_select">
  <div style="float: left;">
	<h2 class="title">티켓 검색결과</h2>
  </div>
	<div style="float: right;">
		<select class="form-select form-select-sm" aria-label=".form-select-sm example">
		  <option selected>정렬선택</option>
		  <option value="1">One</option>
		  <option value="2">Two</option>
		  <option value="3">Three</option>
		</select>
	</div>
</div>
<!-- 페스티벌 리스트 시작 -->
	<div class="container_2">
		<table class="table">
			<tbody>
			  <c:forEach items="${event }" var="event"  begin="0" end="5">
			    <tr>
			      <td scope="row" rowspan="4" id="eventImgCell"><img src="${event.main_img }" class="listImg"></td> <!-- 이미지로 바꾸기 -->
			      <th id="eventTitle">${event.title }</th>
			      <td rowspan="4" colspan="4" id="reserve"><input type="button" value="예매하기"></td>
			    </tr>
			    <tr>
				  <td id="eventDetail" rowspan="3"><b>장 소:</b> ${event.place }
				  	<br><b>기 간:</b> ${event.eventDate }
				  	<br><b>관람가:</b> ${event.eventPrice }</td>
			    </tr>
			    <tr>
			      <td></td>
			    </tr>
			    <tr>
			      <td></td>
			    </tr>
			  </c:forEach>
			</tbody>
		</table>
		
<!-- 페이징 -->
	<div class="container" id="festPagingNum">
		
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
<!-- 페스티벌 리스트 끝 -->


	</div>
</div>

<!-- 푸터 -->
	<%@ include file="include/footer.jsp" %>
<!-- 푸터 끝 -->

</body>
</html>