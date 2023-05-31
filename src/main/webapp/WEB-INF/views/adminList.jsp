<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" type="text/css" href="/css/bootstrap.min.css">
<title>Insert title here</title>
</head>
<body>

	<p items="${eventDto }" var="dto">${dto.eventNum == 1 }</p>
	<p>${dto.type }</p>
	<p>${dto.gunName }</p>
	<p>${dto.title }</p>
	<p>${dto.eventDate }</p>
	
	
</body>
</html>