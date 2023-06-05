<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" type="text/css" href="/resources/css/bootstrap.min.css">
<link rel="stylesheet" type="text/css" href="/resources/css/reservation.css">
<script src="/resources/js/bootstrap.min.js"></script>
<title>페스티켓</title>
</head>
<body>
	<!-- 헤더 -->
	<%@ include file="include/header.jsp" %>
	<!-- 헤더 끝-->
	
	<!-- 모든 이벤트 리스트 -->
	<!-- 이벤트 이미지, 자치구, 행사분류, 행사명 넘김 -->
	<div class="container">
	<div id="reservation_page">
		<h2 class="rvTitle">예매</h2>
		<div class="totalNum">총 ${totalCount }건</div> <!-- 총 개수 넣어줘야함 -->
		<div class="card-group center-block" id="cardBox">
		<div class="row">
		<c:forEach items="${event }" var="event" >
		  <input type="hidden" value="${event.eventNum }">
		    <div class="card" id="cardList">
		      <img src="${event.main_img }" class="card-img-top" id="card_img"
		      		onclick="script:window.location.href=''" style="cursor:pointer"><!-- 상세페이지로 이동 -->
		      <div class="card-body" onclick="script:window.location.href=''" style="cursor:pointer">
		        <h5 class="card-title">${event.title }</h5>
		        <h6 class="card-subtitle">서울/${event.gunName }</h6>
				<p class="card-text"><small class="text-muted">${event.type }</small></p>
		      </div>
		    </div>
		 </c:forEach>
		 </div>s
		 </div>
	</div>
	</div>
	<!-- 모든 이벤트 리스트 끝 -->
	
	
	<!-- 푸터 -->
	<%@ include file="include/footer.jsp" %>
	<!-- 푸터 끝 -->
</body>
</html>