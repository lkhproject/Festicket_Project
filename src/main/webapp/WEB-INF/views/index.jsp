<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>페스티켓</title>
</head>
<body>


<!-- 이벤트 3개 이미지, 자치구, 행사분류, 행사명 넘김 / css로 사이즈 지정해줘야함-->
	<div>
		<c:forEach items="${event }" var="event"  begin="0" end="3">
			<img src="${event.main_img }">
			<div>
				<ul>
					<input type="hidden" name="eventNum" value="${event.eventNum }">
					<li>서울/${event.gunName }</li>
					<li>${event.type }</li>
					<li>${event.title }</li>
				</ul>
			</div>
	    </c:forEach>
	</div>
<!-- 이미지, 디테일 넘김 끝 -->


</body>
</html>