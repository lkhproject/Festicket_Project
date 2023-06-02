<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>페스티켓</title>
	<link rel="stylesheet" type="text/css" href="/resources/css/bootstrap.min.css">
	<link rel="stylesheet" type="text/css" href="/resources/css/style.css">
	<link rel="stylesheet" type="text/css" href="/resources/css/ranking.css">
	<script src="/resources/js/bootstrap.min.js"></script>
</head>
<body style="background-color: #eeeeee;">
<!-- 헤더 -->
	<%@ include file="include/header.jsp" %>
<!-- 헤더 끝 -->
	
<!-- 탑 5 리스트 -->
<!-- 이벤트 5개 이미지, 자치구, 행사분류, 행사명 넘김 -->
	<div class="container">
<div style="margin-top: 40px">
	<div class="top5">
		TOP 5
	</div>
	<div class="card-group center-block" id="rankingCardBox">
			<div class="row justify-content-center">
			<c:forEach items="${event }" var="event"  begin="0" end="4" varStatus="status">
		  <div class="col" style="float: none; margin 0 auto">
		    <div class="card" id="rankingList">
			      <img src="${event.main_img }" class="card-img-top" id="cardImg">
			      	<div class="card-img-overlay" id="overlayText">
			      		<h1 class="rankingCount">${status.count }</h1>
			      	</div>
		      <div class="card-body" style="padding: 14px 0px">
		        <h5 class="card-title" id="cardTitle">${event.title }</h5>
		        <h6 class="card-subtitle text-muted" id="cardDate">${event.eventDate }</h6>
		      </div>
		    </div>
		  </div>
		  </c:forEach>
		 </div>
	 </div>
</div>
  </div>
<!-- 탑 5 리스트 끝 -->

<!-- 현재 진행중인 행사 배너 -->
<div class="container" style="padding-bottom: 400px">
	<nav class="navbar bg-light">
	  <div class="container-fluid">
	    <a class="navbar-brand" href="#" id="ongoingEventTitle">
	      <img src="/docs/5.2/assets/brand/bootstrap-logo.svg" alt="Logo" width="30" height="24" class="d-inline-block align-text-top">
	      현재 진행중인 행사&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 총 100건   
	    </a> <!-- 건수 오른쪽으로 정렬 -->
	  </div>
	</nav>

<!-- 행사 리스트 -->
<div class="container">
	<div class="eventListScroll">
		    <div id="list-example" class="list-group">
		    <c:forEach items="${event }" var="event" begin="0" end="12">
			    <div class="row">
			      <a class="list-group-item list-group-item-action" href="#">${event.title }</a>
				</div>
		    </c:forEach>
		    </div>
		  </div>
	<div class="col-8">
	    <div data-bs-spy="scroll" data-bs-target="#navbar-example3" data-bs-smooth-scroll="true" class="scrollspy-example-2" tabindex="0">
	      <div id="item-1">
	        <h4>설명</h4>
	        <p>...</p>
	      </div>
	    </div>
	</div>
</div>
</div>
<!-- 행사 리스트 끝 -->
	
<!-- 푸터 -->
	<%@ include file="include/footer.jsp" %>
<!-- 푸터 끝 -->
</body>
</html>