<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" type="text/css" href="/resources/css/bootstrap.min.css">
<link rel="stylesheet" type="text/css" href="/resources/css/reservation.css">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css">
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
		<div class="totalNum">총 ${totalCount }건</div>
		<div class="card-group center-block" id="cardBox">
		<div class="row">
		<c:forEach items="${event }" var="event" varStatus="loop">
		  <input type="hidden" value="${event.eventNum }">
		    <div class="card hidden" id="cardList">
		      <img src="${event.main_img }" class="card-img-top" id="card_img"
		      	onclick="script:window.location.href='rvView?selectedEvent=${event.eventNum }'" style="cursor:pointer">
		      <div class="card-body">
		        <h5 class="card-title" onclick="script:window.location.href='rvView?selectedEvent=${event.eventNum }'" style="cursor:pointer">
					<c:choose>
						<c:when test="${fn:length(event.title) > 19}">
							${fn:substring(event.title, 0, 18)}...
						</c:when>
						<c:otherwise>
							${event.title}
						</c:otherwise>
					</c:choose>
		        </h5>
		        <h6 class="card-subtitle">서울/${event.gunName }</h6>
				<p class="card-text"><small class="text-muted">${event.type }</small></p>
		      </div>
		    </div>
		 </c:forEach>
		 </div>
		 </div>
		<div id="showMoreButtonWrapper">
		  <button type="button" class="btn custom-button" onclick="showMoreEvents()">
		    더보기 <i class="bi bi-arrow-down-circle"></i>
		  </button>
		</div>
	</div>
	</div>
	<!-- 모든 이벤트 리스트 끝 -->
	
	<!-- 푸터 -->
	<%@ include file="include/footer.jsp" %>
	<!-- 푸터 끝 -->
	
	<!-- 더보기 버튼 기능 (16개씩 나오게 하기) -->
	<script>
	var startIndex = 0;
	var endIndex = 15;
	
	function showMoreEvents() {
	    var cards = document.getElementsByClassName("card");
	    for (var i = startIndex; i <= endIndex; i++) {
	        if (cards[i]) {
	            cards[i].classList.remove("hidden");
	        }
	    }
	    startIndex += 16;
	    endIndex += 16;
	    if (endIndex >= cards.length) {
	        document.getElementById("showMoreButton").style.display = "none";
	    }
	}
	
	window.addEventListener("DOMContentLoaded", function() {
	    showMoreEvents();
	});
	</script>
</body>
</html>
