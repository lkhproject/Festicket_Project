<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>페스티켓</title>
	<link rel="stylesheet" type="text/css" href="/resources/css/bootstrap.min.css">
	<link rel="stylesheet" type="text/css" href="/resources/css/header.css">
	<link rel="stylesheet" type="text/css" href="/resources/css/login.css">
</head>
<body>
<%@ include file="include/header.jsp" %>
<br><Br>
	<center>
		<table border="0" cellspacing="0" cellpadding="20" width="75%">		
			<tr>
				<td>
					<center>
					<table border="0" cellspacing="0" cellpadding="10" width="60%">
				<tr>
					<td class="contentbox">
					<center>
					<table border="0" cellspacing="0" cellpadding="10">
                    <img src = "/resources/img/festicket_logo.png" width="25%">
                    <form action="loginOk" method="post">
	                    <input type="text" name="userId" class="login_box" placeholder="아이디" id="userId" autocomplete="off">
	                    <input type="password" name="userPassword" class="login_box" placeholder="・・・・" id="userPassword" autocomplete="off">
                    	<input class="login-button" type="submit" value="로그인"></input>
                    </form>
                 	<br>
                    <div class="joinpage"><a  href="find"><b>아이디/비밀번호찾기</b></a></div>
					<div class="joinpage"><a  href="join">처음이신가요? <b>회원가입</b></a></div>
						</table>
					</center>
					</td>
				</tr>
					</table>
					</center>
				</td>
			</tr>	
		</table>
	</center>
<%@ include file="include/footer.jsp" %>
</body>
</html>