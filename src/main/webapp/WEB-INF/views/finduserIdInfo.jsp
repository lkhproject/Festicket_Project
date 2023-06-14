<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>아이디/비밀번호 찾기</title>
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
                    <table border="0" cellspacing="0" cellpadding="10">
                        <tr>
                            <td class="contentbox">
                                <center>
                                    <table border="0" cellspacing="0" cellpadding="10">
                                        <img src="/resources/img/festicket_logo.png" width="75%">
                                        <form action="findUserInfo" method="post">
                                            <div>
                                                <label for="email">이메일</label>
                                                <input type="text" name="email" class="login_box" id="email" required>
                                            </div>
                                            <div>
                                                <label for="phone">휴대폰번호</label>
                                                <input type="text" name="userPhone" class="login_box" id="userPhone" required>
                                            </div>
                                            <div>
                                                <input class="login-button" type="submit" value="아이디 찾기" name="findIdBtn">
                                                <br>
                                                <input class="login-button" type="submit" value="비밀번호 찾기" name="findPwdBtn">
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
