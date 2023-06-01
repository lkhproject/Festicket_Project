<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="/resources/css/header.css">
<title>페스티켓</title>
</head>
<body>
	<div class="headerline">
		<table border="0" cellspacing="0" cellpadding="0" width="100%">
			<tr class="top_menu">
				<td class="margin01">&nbsp;</td>
				<%
					String sessionId = (String)session.getAttribute("sessionId");
					if(sessionId == null) {
				%>
				<td class="toptext"><a href="">로그인</a></td>
				<%
					} else {
				%>
				<td class="toptext"><a href="">로그아웃</a></td>
				<%
					}
				%>
				<td class="margin02">&nbsp;</td>
				<td class="toptext"><a href="">회원가입</a></td>
				<td class="margin02">&nbsp;</td>
				<td class="toptext"><a href="">마이페이지</a></td>
				<td class="margin02">&nbsp;</td>
				<td class="toptext"><a href="">고객센터</a></td>
				<td class="margin02">&nbsp;</td>
			</tr>
		</table>
		<hr class="line">
		<div class="categoryline">
			<ul class="category">
				<li><a href="#"><img class="logo" src="/resources/img/festicket_logo.png" alt="로고"></a></li>
				<li class="categorytext"><a href="index">홈</a></li>
				<li class="categorytext"><a href="reservation">예매</a></li>
				<li class="categorytext"><a href="festival">페스티벌</a></li>
				<li class="categorytext"><a href="exhibition">전시</a></li>
			    <li class="categorytext"><a href="ranking">랭킹</a></li>
			</ul>
		</div>
		
		<form class="search" method='get' action='' onSubmit="return">
		  <div class="search_btn">
		    <input class="search_box" type=text id="search_word" placeholder='검색어를 입력하세요.'>
		    <div class="search_btn_img">
		      <input type="image" src='/resources/img/search_btn.png' style="padding: 8px;" alt='검색하기' onfocus="this.blur();" >
		    </div>
		  </div>
		</form>
    </div>
</body>
</html>