<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>페스티켓</title>
	<link rel="stylesheet" type="text/css" href="/resources/css/bootstrap.min.css">
	<link rel="stylesheet" type="text/css" href="/resources/css/style.css">
	<link rel="stylesheet" type="text/css" href="/resources/css/header.css">
	<link rel="stylesheet" type="text/css" href="/resources/css/main.css">
	<script src="/resources/js/bootstrap.min.js"></script>
</head>
<body>
<!-- 헤더 -->
	<%@ include file="include/header.jsp" %>
<!-- 헤더 끝 -->

<!-- 롤링배너 -->
<div id="carouselExampleControls" class="carousel slide" data-bs-ride="carousel" style="margin: 50px 0px 0px">
  <div class="carousel-inner">
    <div class="carousel-item active">
      <img src="https://img.freepik.com/free-photo/cloud-and-blue-sky_1150-35749.jpg" class="d-block w-100" style="height: 500px">
    </div>
    <div class="carousel-item">
      <img src="/resources/img/search_btn.png" class="d-block w-100" style="height: 500px">
    </div>
  </div>
  <button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleControls" data-bs-slide="prev">
    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
    <span class="visually-hidden">Previous</span>
  </button>
  <button class="carousel-control-next" type="button" data-bs-target="#carouselExampleControls" data-bs-slide="next">
    <span class="carousel-control-next-icon" aria-hidden="true"></span>
    <span class="visually-hidden">Next</span>
  </button>
</div>
<!-- 롤링배너 끝-->

<!-- 이벤트 5개 이미지, 자치구, 행사분류, 행사명 넘김 -->
	<div class="container">
	<div class="card-group center-block" style="padding: 60px">
		<div class="row justify-content-center">
		<c:forEach items="${event }" var="event"  begin="0" end="4">
	  <div class="col" style="float: none; margin 0 auto">
	    <div class="card" style="width: 200px; height: 400px">
	      <img src="${event.main_img }" class="card-img-top" style="width: 200px; height:250px">
	      <div class="card-body">
	        <h5 class="card-title">${event.title }</h5>
	        <h6 class="card-subtitle">서울/${event.gunName }</h6>
			<p class="card-text"><small class="text-muted">${event.type }</small></p>
	      </div>
	    </div>
	  </div>
	  </c:forEach>
	 </div>
	 </div>
	</div>
<!-- 이미지, 디테일 넘김 끝 -->


</body>
</html>