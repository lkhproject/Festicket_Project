<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>   
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>페스티켓</title>
<link rel="stylesheet" type="text/css" href="/resources/css/bootstrap.min.css">
<link rel="stylesheet" type="text/css" href="/resources/css/myPageUnreg.css">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.3/font/bootstrap-icons.css">
</head>
<body>
<body>
			<!-- 헤더 -->
			<%@ include file="include/header.jsp" %>
			
			<!-- 상단 box 시작 -->
			<div class="inner">
				<div class="quick_menu_wrap">
			 			<div class="title"><h2 class="title_txt">마이페이지</h2></div>
			<ul class="quick_menu_list">
			 	    <li class="quick_menu_item">
			 	    <a href="" class="quick_link">
				<div class="qmemu_box">
			                		<span class="qmenu_tit">
			                			<i class="bi bi-ticket-perforated"></i>
			                		</span>
			             </div>
			              <div class="qmemu_box01">
			                 <span class="qmenu_tit"> 나의 예매내역 </span>
			             </div>
			         </a>
			     	</li>
			     	
			   		<li class="quick_menu_item">
			         <a href="" class="quick_link">
			             <div class="qmemu_box">
			                 <span class="qmenu_tit">
			               	 	<i class="bi bi-person-gear"></i>
			                 </span>
			             </div>
			              <div class="qmemu_box01">
			                 <span class="qmenu_tit"> 나의 회원정보 </span>
			             </div>
			         </a>
			   	  	</li>
				  	</ul>
				</div>
			<!-- 상단 box 끝 -->
			
			<!-- 왼쪽 box -->
			<div class="help_cont">
				<ul class="help_lmenu">
				<li class="has_sub">
						<span class="help_submenu_tit">예매관리</span>
				<ul class="help_submenu">
				<li >
						<a href="myPage">예매확인/취소</a>
				</li>
				</ul>
				</li>
			
				<li class="has_sub">
						<span class="help_submenu_tit">활동관리</span>
				<ul class="help_submenu">
				<li>
						<a href="">나의 후기</a>
				</li>
				</ul>
				</li>
			
				<li class="has_sub">
					<span class="help_submenu_tit">회원정보관리</span>
				<ul class="help_submenu">
				<li>
						<a href="myPageModify">회원정보수정</a>
				</li>
					<li  class="on">
						<a href="myPageUnreg">회원탈퇴</a>
					</li>
				</ul>
				</li>
				</ul>
			</div>
			
			<!-- 가운데 box -->
			<table border="0" cellspacing="0" cellpadding="0" width="0">	
				<tr>
					<td class="contentbox">
						<center>
					<img src = "/resources/img/festicket_logo.png" width="30%"> 
					<br><br>
				 	<form action="index" method="post" name="index_frm">
					<h5><b> 회원탈퇴 </b></h5>
					<table border="0" cellspacing="0" cellpadding="10">
					<tr>
						<td class="content_text">아이디
						<input class="inputbox01" type="text" name="userId" placeholder="아이디"></td>
					</tr>
					<tr>
						<td class="content_text">비밀번호
						<input class="inputbox01" type="password" name="userPassword" placeholder="비밀번호"></td>
					</tr>
					<tr>
						<td colspan="2" align="center">
						<input class="content_btn01" type="submit" value="탈퇴하기" onclick="script:window.location.href='index'">			
					</td>										
					</tr>
					</table>
					</form>
						</center>
					</td>
				</tr>
			</table>
		</div>
			
			
	<%@ include file="include/footer.jsp" %>

</body>
</html>