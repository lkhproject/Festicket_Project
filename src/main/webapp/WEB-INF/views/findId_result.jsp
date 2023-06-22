<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>페스티켓</title>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/resources/css/bootstrap.min.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/resources/css/joinOk.css">
<script src="${pageContext.request.contextPath }/resources/js/bootstrap.min.js"></script>
</head>
<body>
<%
	int checkname = Integer.parseInt(request.getAttribute("checkname").toString());

	if (checkname == 1) {
%>
	<script type="text/javascript">
		alert("입력하신 정보는 일치하지 않습니다. 확인해주세요");
		window.location.href = document.referrer; // 이전 페이지로 이동
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
				<img src = "${pageContext.request.contextPath }/resources/img/festicket_logo.png" id="logoImg"> 
				<div class="confirm">회원님의 아이디는<br> <b>${findId }</b> 입니다.</div>
				<input class="content_btn01" type="button" value="로그인 바로가기" onclick="script:window.location.href='login'">
			</div>
		</div>
	</div>
	
	<!-- 푸터 시작 -->
	<%@ include file="include/footer.jsp" %>
	<!-- 푸터 끝 -->

</body>
</html>