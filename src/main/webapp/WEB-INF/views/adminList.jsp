<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>페스 티켓</title>
</head>
<body>


<!-- 행사 리스트 6개 -->
	<div>
		<c:forEach items="${event }" var="event"  begin="0" end="5">
			<div>
				<ul>
					<li>${event.eventNum }</li>
					<li>${event.gunName }</li>
					<li>${event.title }</li>
					<li>${event.eventDate }</li>
				</ul>
			</div>
	    </c:forEach>
	</div>
<!-- 행사 리스트 끝 -->
	
</body>
</html>