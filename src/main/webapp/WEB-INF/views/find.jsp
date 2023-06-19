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
                    <form action="loginOk" method="post">
                      <input type="text" name="userId" class="login_box" placeholder="아이디" id="userId" autocomplete="off" >
                      <input type="password" name="userPassword" class="login_box" placeholder="・・・・・・" id="userPassword" autocomplete="off" onfocus="this.placeholder = ''">
                    </form>
                    <br>
                    <input class="login-button" value="아이디 찾기"><a href="findId"></a></input>
                    <input class="login-button" value="비밀번호 찾기"><a href="findPassword"></a></input>
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