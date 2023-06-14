<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>페스티켓</title>
    <link rel="stylesheet" type="text/css" href="/resources/css/bootstrap.min.css">
    <link rel="stylesheet" type="text/css" href="/resources/css/header.css">
    <link rel="stylesheet" type="text/css" href="/resources/css/find.css">
</head>
<body>
<%@ include file="include/header.jsp" %>
<br><br>
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
                                        <form action="finduserInfo" method="post">
                                            <div>
                                                <input type="text" name="email" class="login_box" placeholder="이메일"  id="email" required>
                                            </div>
                                            <div>
                                                <input type="text" name="userPhone" class="login_box" placeholder="휴대폰 번호"  id="userPhone" required>
                                            </div>
                                            <div>
                                            <td colspan="2" align="center">
                                                <input class="login-button" type="submit" value="아이디 찾기" name="findIdBtn">&nbsp;&nbsp;
                                                <input class="login-button" type="submit" value="비밀번호 찾기" name="findPwdBtn">
                                           </td>
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
<%@ include file="include/footer.jsp" %>
</body>
</html>
