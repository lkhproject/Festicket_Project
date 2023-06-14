<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>페스티켓</title>
	<link rel="stylesheet" type="text/css" href="/resources/css/bootstrap.min.css">
	<link rel="stylesheet" type="text/css" href="/resources/css/header.css">
	<link rel="stylesheet" type="text/css" href="/resources/css/joinOk.css">
	<script src="/resources/js/bootstrap.min.js"></script>
</head>
<body>
	<%
		int checkId = Integer.parseInt(request.getAttribute("checkId").toString());
		int checkEmail = Integer.parseInt(request.getAttribute("checkEmail").toString());
	
		if(checkId == 1) {
	%>
		<script type="text/javascript">
			alert("입력하신 아이디는 이미 가입된 아이디 입니다. 다시 입력해 주세요.");
			history.go(-1);
		</script>
	<%			
		}
		if(checkEmail == 1) {
	%>
		<script type="text/javascript">
			alert("입력하신 이메일은 이미 존재하는 이메일 입니다. 다시 입력해 주세요.");
			history.go(-1);
		</script>
	<%			
		} else {
			// 회원가입이 완료되었을 경우 index 페이지로 이동
			response.sendRedirect("index");
		}
	%>
	
	<!-- 헤더 -->
	<%@ include file="include/header.jsp" %>
	<!-- 헤더 끝 -->

	<!-- 푸터 -->
	<%@ include file="include/footer.jsp" %>
	<!-- 푸터 끝 -->
</body>
</html>