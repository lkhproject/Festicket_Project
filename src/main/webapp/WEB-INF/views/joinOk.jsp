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
	<link rel="stylesheet" type="text/css" href="/resources/css/join.css">
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
	<center>
				<table border="0" cellspacing="0" cellpadding="20" width="40%">	
					<tr>
						
						<center>
							<td class="contentbox">
							<img src = "/resources/img/festicket_logo.png" width="30%"> 
							<br><br>
								<h5><b> 회원가입 </b></h5>
								<table border="0" cellspacing="0" cellpadding="10">
									<form action="joinOk" method="post" name="join_frm">
									
									
									
									<tr>
										<td colspan="2" align ="center" class="main_text">											
											${name }님 회원가입을 축하드립니다!<br>
											가입하신 아이디는 ${userId }입니다.<br><br>
											<input class="content_btn01" type="button" value="로그인 바로가기" onclick="script:window.location.href='login'">
										</td>										
									</tr>
									</form>
								</table>
							</td>
						</center>
						
					</tr>
				</table>
				</center>
	
	<%@ include file="include/footer.jsp" %>
</body>
</html>