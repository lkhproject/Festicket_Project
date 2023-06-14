<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>페스티켓</title>
</head>
<body>
	<%
		int checkIdPwFlag = Integer.parseInt(request.getAttribute("checkIdPwFlag").toString());
		
		if(checkIdPwFlag == 0) {
	%>
		<script type="text/javascript">
			alert("입력하신 아이디 또는 비밀번호가 일치하지 않습니다. 다시 입력해 주세요.");
			history.go(-1);
		</script>
	<%			
		} else {
	%>
		<script>
			window.location.href="index";
		</script>
	<%
		}
	%>
</body>
</html>