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
		
		if(checkId == 1) {
	%>
		<script type="text/javascript">
			alert("입력하신 아이디는 이미 가입된 아이디 입니다. 다시 입력해 주세요.");
			history.go(-1);
		</script>
	<%			
		}	
	%>
	
	<!-- 헤더 시작 -->
	<%@ include file="include/header.jsp" %>
	<!-- 헤더 끝 -->

	<div class="container">
		<div class="container_1">
			<div class="joinOk_container">
				<img src = "/resources/img/festicket_logo.png" id="logoImg"> 
				
				<div class="confirm"><b>${memberName}</b>님 회원가입을 축하드립니다!</div>
				<div class="confirm">가입하신 아이디는 <b>${memberId}</b>입니다.</div>
				
				<input class="content_btn01" type="button" value="로그인 바로가기" onclick="script:window.location.href='login'">
			</div>
		</div>
	</div>
	
	<%@ include file="include/footer.jsp" %>
</body>
</html>