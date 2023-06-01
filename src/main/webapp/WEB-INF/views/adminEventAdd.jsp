<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>페스티켓</title>
</head>
<body>
<!-- 헤더 -->
	<%@ include file="include/header.jsp" %>
<!-- 헤더 끝 -->

<!-- 행사 리스트 6개 -->
<div class="container" style="padding-top: 50px; padding-bottom: 50px">
<div class="container" id="admin_page_form" style="padding-bottom: 50px">
	<h2 id="adminTitle" style="padding-top: 60px">관리자 페이지</h2>
	<table class="table table-hover" id="adminTable" style="margin-top: 40px">
	  <thead style="background-color: #eeeeee">
	    <tr id="trline">
	      <th scope="col">번호</th>
	      <th scope="col">장소</th>
	      <th scope="col">행사명</th>
	      <th scope="col">행사기간</th>
	    </tr>
	  </thead>
	  <tbody class="table-group-divider">
		  <c:forEach items="${event }" var="event"  begin="0" end="5">
		    <tr id="trline">
		      <th scope="row">${event.eventNum }</th>
		      <td>서울/${event.gunName }</td>
		      <td><a href="#">${event.title }</a></td>
		      <td>${event.eventDate }</td>
		    </tr>
		  </c:forEach>
	  </tbody>
	</table>
<!-- 행사 리스트 끝 -->

<!-- 검색, 등록 -->
	<div class="container">
		<input class="search_box_little" type=text>
		<input type="image" src='/resources/img/search_btn.png' style="padding: 8px;" alt='검색하기' onfocus="this.blur();" >
		<input type="button" class="btn" style="float: right;" onclick="script:window.location.href='adminEventAdd'" value="등록">
	</div>
<!-- 검색, 등록 끝 -->
</div>
</div>

<!-- 푸터 -->
	<%@ include file="include/footer.jsp" %>
<!-- 푸터 끝 -->
</body>
</html>