<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
    // 세션 무효화 (세션 제거)
    session.invalidate();
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>페스티켓</title>
</head>
<body>
    <h1>로그아웃되었습니다.</h1>
    <a href="login.jsp">로그인 페이지로 이동</a>
</body>
</html>
