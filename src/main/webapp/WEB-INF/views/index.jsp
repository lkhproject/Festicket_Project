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
</head>
<body>


<!-- 이벤트 3개 이미지, 자치구, 행사분류, 행사명 넘김 -->
	<div class="container">
	<div class="card-group">
		<div class="row">
		<c:forEach items="${event }" var="event"  begin="0" end="3">
	  <div class="col" style="float: none; margin 0 auto">
	    <div class="card" style="width: 250px; height: 450px">
	      <img src="${event.main_img }" class="card-img-top" style="width: 250px; height:300px">
	      <div class="card-body">
	        <h5 class="card-title">${event.title }</h5>
	        <h5 class="card-subtitle">서울/${event.gunName }</h5>
			<p class="card-text">${event.type }</p>
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