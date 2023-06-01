<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%@ include file="include/header.jsp" %>
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
									<form action="loginOk" method="post">
									  <div class="section text-center">
                     <img src = "/resources/img/festicket_logo.png">
                      <div class="form-group">
                       <br>
                       <input type="email" name="logemail" class="login_box" placeholder="아이디" id="logemail" autocomplete="off">
                        <i class="input-icon uil uil-at"></i>
                      </div>  
                      <div class="form-group mt-2">
                        <input type="password" name="logpass" class="login_box" placeholder="********" id="logpass" autocomplete="off">
                        <i class="input-icon uil uil-lock-alt"></i>
                      </div>
                      <a href="#" class="btn mt-4">로그인</a>
                      <p class="mb-0 mt-4 text-center"><a href="#0" class="link">아이디/비밀번호찾기</a></p>
                       <p class="mb-0 mt-4 text-center"><a href="#0" class="link">처음이신가요? 회원가입</a></p>
                        </div>
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

</body>
</html>