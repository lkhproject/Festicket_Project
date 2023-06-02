<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>페스티켓</title>
	<link rel="stylesheet" type="text/css" href="/resources/css/bootstrap.min.css">
	<link rel="stylesheet" type="text/css" href="/resources/css/header.css">
	<link rel="stylesheet" type="text/css" href="/resources/css/join.css">
</head>
<body>
	<%@ include file="include/header.jsp" %>
	<center>
				<table border="0" cellspacing="0" cellpadding="20" width="40%">	
					<tr>
						<br><br>
						<td class="contentbox">
							<center>
							<img src = "/resources/img/festicket_logo.png" width="30%"> 
							<br><br>
								<h5><b> 회원가입 </b></h5>
								<table border="0" cellspacing="0" cellpadding="10">
									<form action="joinOk" method="post" name="join_frm">
									<tr>
										<td class="content_text">아이디
										<input class="inputbox01" type="text" name="mid"></td>
									</tr>
									<tr>
										<td class="content_text">비밀번호
										<input class="inputbox01" type="password" name="mpw"></td>
									</tr>
									<tr>
										<td class="content_text">비밀번호확인
										<input class="inputbox01" type="password" name="mpw_check"></td>
									</tr>
									<tr>
										<td class="content_text">이름
										<input class="inputbox01" type="text" name="mname"></td>
									</tr>
									<tr>
										<td class="content_text">이메일
										<input class="inputbox01" type="text" name="memail"></td>
									</tr>
									<tr>
										<td class="content_text">휴대폰번호
										<input class="inputbox01" type="text" name="memail"></td>
									</tr>
									
									
									<tr>
										<td colspan="2" align="center">
											<input class="content_btn01" type="button" value="가입완료" onclick="joinCheck()">&nbsp;&nbsp;
											<input class="content_btn02" type="button" value="취소" >
										</td>										
									</tr>
									</form>
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