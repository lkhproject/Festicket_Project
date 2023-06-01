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
					<table border="0" cellspacing="0" cellpadding="10" width="80%">
				<tr>
					<td class="contentbox">
					<center>
						<table border="0" cellspacing="0" cellpadding="10">
                  	
                    <img src = "/resources/img/festicket_logo.png" width="30%">
                    <div class="form-group">
                    <br>
                    <input type="email" name="logid" class="login_box" placeholder="아이디" id="logid" autocomplete="off">
                    </div>  
                    <div class="form-group">
                    <input type="password" name="logpass" class="login_box" placeholder="********" id="logpass" autocomplete="off"></input> 
                   	</div>
                   	<div class="form-group">
                    <input class="login-button" type="submit" value="로그인"></input>
                  	</div>
                    <div class="join"><a  href=""  ><b>아이디/비밀번호찾기</b></a></div>
					<div class="join"><a  href="">처음이신가요?<b>회원가입</b></a></div>
					
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

</body>
</html>