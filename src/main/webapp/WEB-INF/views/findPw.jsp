<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>페스티켓</title>
<link rel="stylesheet" type="text/css" href="/resources/css/bootstrap.min.css">
<link rel="stylesheet" type="text/css" href="/resources/css/find.css">
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
                   <form action="findPw_result" method="post"name="findPw_result_frm" onsubmit="">
                   <tr>
						<input class="login_box" type="text" name="userId" placeholder="아이디">
					</tr>
					<tr>
						<input class="login_box" type="text" name="email" placeholder="이메일">
					</tr>
					<tr>
						<input class="login_box" type="text" name="userPhone" placeholder="휴대폰번호">
					</tr>
                    <input class="IDPWbutton" type="submit" value="비밀번호 찾기"onclick=""></input>
                    <input class="IDPWbutton01" type="submit" value="취소"onclick="script:window.location.href='index'"></input>
             	    </form>
                    <br>
                    <div class="joinpage"><a href="findId"><b>아이디 찾기</b></a></div>
					<div class="joinpage"><a href="join"><b>회원가입</b></a></div>
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