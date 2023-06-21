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
                   <form action="findPw_result" method="post" name="findPw_result_frm" onsubmit="return validateForm()">
                   <tr>
						<input class="login_box" type="text" name="userId" placeholder="아이디" >
					</tr>
					<tr>
						<input class="login_box" type="text" name="email" placeholder="이메일">
					</tr>
					<tr>
						<input class="login_box" type="text" name="userPhone" placeholder="휴대폰번호" >
					</tr>
                    <input class="IDPWbutton" type="submit" value="비밀번호 찾기"></input>
                    <input class="IDPWbutton01" type="button" value="취소" onclick="script:window.location.href='login'"></input>
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

<script>
function validateForm() {
  var userId = document.forms["findPw_result_frm"]["userId"].value;
  var email = document.forms["findPw_result_frm"]["email"].value;
  var userPhone = document.forms["findPw_result_frm"]["userPhone"].value;

  if (userId === "") {
    alert("아이디를 입력해주세요.");
    return false;
  }

  if (email === "") {
    alert("이메일을 입력해주세요.");
    return false;
  }

  if (userPhone === "") {
    alert("휴대폰번호를 입력해주세요.");
    return false;
  }
}
</script>
</body>
</html>