<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>페스티켓</title>
	<link rel="stylesheet" type="text/css" href="/resources/css/bootstrap.min.css">
	<link rel="stylesheet" type="text/css" href="/resources/css/header.css">
	<link rel="stylesheet" type="text/css" href="/resources/css/login.css">
	<script src="/resources/js/jquery.min.js"></script> <!-- jQuery 라이브러리를 로드합니다. -->
	<script>
		$(document).ready(function() {
			// 아이디 중복 체크
			$("#userId").blur(function() {
				var userId = $(this).val();
				$.ajax({
					url: "checkIdDuplicate", // 중복 체크를 수행하는 URL
					type: "POST",
					data: { userId: userId },
					success: function(result) {
						if (result === "duplicate") {
							alert("중복된 아이디입니다. 다른 아이디를 입력해주세요.");
							$("#userId").val(""); // 입력 필드 초기화
							$("#userId").focus(); // 아이디 입력 필드에 포커스 설정
						}
					}
				});
			});

			// 이메일 중복 체크
			$("#email").blur(function() {
				var email = $(this).val();
				$.ajax({
					url: "checkEmailDuplicate", // 중복 체크를 수행하는 URL
					type: "POST",
					data: { email: email },
					success: function(result) {
						if (result === "duplicate") {
							alert("중복된 이메일입니다. 다른 이메일을 입력해주세요.");
							$("#email").val(""); // 입력 필드 초기화
							$("#email").focus(); // 이메일 입력 필드에 포커스 설정
						}
					}
				});
			});

			// 폼 제출 시 중복 체크 후 서버로 전송
			$("#loginForm").submit(function() {
				var userId = $("#userId").val();
				var email = $("#email").val();
				
				// 아이디 또는 이메일 중복 체크를 수행하지 않은 경우
				if (userId === "" || email === "") {
					alert("아이디와 이메일을 입력해주세요.");
					return false; // 폼 제출 중지
				}
				
				// 서버로 폼 데이터 전송
				return true; // 폼 제출 진행
			});
		});
	</script>
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
                    <img src="/resources/img/festicket_logo.png" width="25%">
                    <form action="loginOk" method="post" id="loginForm">
	                    <input type="text" name="userId" class="login_box" placeholder="아이디" id="userId" autocomplete="off">
	                    <input type="password" name="userPassword" class="login_box" placeholder="・・・・" id="userPassword" autocomplete="off">
                    	<input class="login-button" type="submit" value="로그인"></input>
                    </form>
                 	<br>
                    <div class="joinpage"><a href=""><b>아이디/비밀번호찾기</b></a></div>
					<div class="joinpage"><a href="">처음이신가요?<b>회원가입</b></a></div>
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
