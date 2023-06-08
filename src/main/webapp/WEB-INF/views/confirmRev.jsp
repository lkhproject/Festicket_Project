<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" type="text/css" href="/resources/css/bootstrap.min.css">
<link rel="stylesheet" type="text/css" href="/resources/css/rvView.css">
<script src="/resources/js/bootstrap.min.js"></script>

<title>페스티켓</title>
</head>
<body>
	<!-- 헤더 -->
	<%@ include file="include/header.jsp" %>
	<!-- 헤더 끝-->
	
<div class="container" style="margin-top: 30px">
	<div class="container" id="rvView_page_form">
		<div class="card mb-3" style="max-width: 540px;">
		  <div class="row g-0">
		    <div class="col-md-4">
		      <img src="${event.main_img }" class="img-fluid rounded-start" alt="${event.title }">
		    </div>
		    <div class="col-md-8">
		      <div class="card-body">
		        <h5 class="card-title">${event.title }</h5>
		        <p class="card-text">${event.gunName } / ${event.place }</p>
		        <p class="card-text"><small class="text-muted">예약일 : ${comfirmedRev.re_ticketDate }</small></p>
		        <p class="card-text"><small class="text-muted">${comfirmedRev.re_userId } 님,</small></p>
		        <p class="card-text"><small class="text-muted">티켓수 : ${comfirmedRev.re_ticketCount }</small></p>
		        <p class="card-text"><small class="text-muted">가격 : ${comfirmedRev.re_price }</small></p>
		      </div>
		    </div>
		  </div>
		</div>
	</div>
</div>
	
	
	<!-- 푸터 -->
	<%@ include file="include/footer.jsp" %>
	<!-- 푸터 끝 -->
</body>
</html>