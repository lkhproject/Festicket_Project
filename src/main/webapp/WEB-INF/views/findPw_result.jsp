<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>페스티켓</title>
<link rel="stylesheet" type="text/css" href="/resources/css/bootstrap.min.css">
<link rel="stylesheet" type="text/css" href="/resources/css/joinOk.css">
<script src="/resources/js/bootstrap.min.js"></script>
</head>
<body>
<%
 	int checkPw = request.getAttribute("checkPw") != null ? Integer.parseInt(request.getAttribute("checkPw").toString()) : 0;
	
  	if (checkPw == 1) {
%>
	<script type="text/javascript">
		alert("입력하신 정보는 일치하지 않습니다. 확인해주세요");
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
				<div class="confirm">회원님의 비밀번호는<br> <b>${findPw }</b> 입니다.</div>
				<input class="content_btn01" type="button" value="로그인 바로가기" onclick="script:window.location.href='login'">
			</div>
		</div>
	</div>
	<!-- 푸터 시작 -->
	<%@ include file="include/footer.jsp" %>
	<!-- 푸터 끝 -->
</body>
</html>