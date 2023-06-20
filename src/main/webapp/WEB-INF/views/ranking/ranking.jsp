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
	<link rel="stylesheet" type="text/css" href="/resources/css/ranking.css">
	<script src="/resources/js/bootstrap.min.js"></script>
	<script src="/resources/js/ranking.js"></script>
</head>
<body style="background-color: #eeeeee;">
	<!-- 헤더 -->
		<%@ include file="../include/header.jsp" %>
	<!-- 헤더 끝 -->
		
	<!-- 탑 5 리스트 -->
	<!-- 이벤트 5개 이미지, 자치구, 행사분류, 행사명 넘김 -->
		<div class="container">
		<div style="float: left;">
			<h2 class="title">예매순위</h2>
			<div class="top5">TOP 5</div>
		</div>
		<div class="card-group center-block" id="rankingCardBox">
				<div class="row justify-content-center">
				<c:forEach items="${topfiveEvent }" var="topfiveEvent"  begin="0" end="4" varStatus="status">
			  <div class="col" style="float: none; margin 0 auto">
			    <div class="card" id="rankingList">
	      			<c:choose>
	  					<c:when test="${topfiveEvent.main_img.startsWith('http')}">
				     	 <img src="${topfiveEvent.main_img }" class="card-img-top" id="cardImg"
				      		onclick="script:window.location.href='rvView?selectedEvent=${topfiveEvent.eventNum }'">
				    </c:when>
					  <c:otherwise>
						<img src="/resources/upload_main_img/${topfiveEvent.main_img.substring(topfiveEvent.main_img.indexOf('upload_main_img/') + 'upload_main_img/'.length())}"
							onclick="script:window.location.href='rvView?selectedEvent=${topfiveEvent.eventNum }'" class="card-img-top" id="cardImg">
					  </c:otherwise>
					</c:choose>
				      	<div class="card-img-overlay" id="overlayText">
				      		<h1 class="rankingCount">${status.count }</h1>
				      	</div>
			      <div class="card-body" style="padding: 14px 0px">
			        <h5 class="card-title" id="cardTitle">${topfiveEvent.title }</h5>
			        <h6 class="card-subtitle text-muted" id="cardDate">${topfiveEvent.eventDate }</h6>
			      </div>
			    </div>
			  </div>
			  </c:forEach>
			 </div>
		 </div>
	  </div>
	<!-- 탑 5 리스트 끝 -->
	
	<!-- 현재 진행중인 행사 배너 -->
	<div class="container" style="width: 60%;">
		<nav class="navbar bg-light">
		  <div class="container-fluid" id="ongoingEventTitle">
		    <div class="navbar-brand">
		      <img src="resources/img/search_board_btn.png" id="search_btn" class="d-inline-block align-text-top">
		      <div style="float: left;">&nbsp;현재 진행중인 행사</div>
		    </div>
		    <div style="float: right;">총 ${fn:length(ongoing) }건</div>
		  </div>
		</nav>
	
	<!-- 행사 리스트 -->
		<div class="table-responsive" id="ongingTable">
		 <table class="table table-hover">
		    <c:forEach items="${ongoing }" var="ongoing">
			     <tbody>
					<tr>
					<!-- 상세 예약페이지로 -->
						<td scope="row" id="ongoingDate"><a href="rvView?selectedEvent=${ongoing.eventNum }">&nbsp;~ ${fn:substring(ongoing.end_date, 0, 11) }</a></td>
						<td><a href="rvView?selectedEvent=${ongoing.eventNum }">${ongoing.title }</a></td>
						<td><a href="rvView?selectedEvent=${ongoing.eventNum }">${ongoing.gunName } / ${ongoing.place }</a></td>
					</tr>
				</tbody>
		    </c:forEach>
		 </table>
		 </div>
	</div>
	<!-- 행사 리스트 끝 -->
		
	<!-- 푸터 -->
		<%@ include file="../include/footer.jsp" %>
	<!-- 푸터 끝 -->
</body>
</html>