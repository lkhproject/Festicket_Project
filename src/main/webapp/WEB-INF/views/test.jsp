<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
	<link rel="stylesheet" type="text/css" href="/resources/css/bootstrap.min.css">
	<link rel="stylesheet" type="text/css" href="/resources/css/style.css">
</head>
<body>

	<div class="row row-cols-1 g-4">
	<c:forEach items="${event }" var="event"  begin="0" end="3">
  <div class="col">
    <div class="card">
      <img src="${event.main_img }" class="card-img-top">
      <div class="card-body">
        <h3 class="card-title">${event.title }</h3>
        <h3 class="card-subtitle">서울/${event.gunName }</h3>
		<p class="card-text">${event.type }</p>
      </div>
    </div>
  </div>
  </c:forEach>
 </div>


</body>
</html>