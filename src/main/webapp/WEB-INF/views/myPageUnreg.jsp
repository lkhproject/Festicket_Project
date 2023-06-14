<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>페스티켓</title>
	<link rel="stylesheet" type="text/css" href="/resources/css/bootstrap.min.css">
	<link rel="stylesheet" type="text/css" href="/resources/css/header.css">
	<link rel="stylesheet" type="text/css" href="/resources/css/myPageUnreg.css">
</head>
<body>
	<!-- 헤더 -->
	<%@ include file="include/header.jsp" %>
	
	<!-- 상단 box -->
			<div class="inner">
				<div class="quick_menu_wrap">
    			<div class="title"><h2 class="title_txt">마이페이지</h2></div>
    			
    		<ul class="quick_menu_list">
    	    <li class="quick_menu_item">
    	    <a href="" class="quick_link">
				<div class="qmemu_box">
                    <span class="qmenu_tit">나의 예매내역</span>
                </div>
            </a>
        	</li>
        	
      		<li class="quick_menu_item">
            <a href="" class="quick_link">
                <div class="qmemu_box">
                    <span class="qmenu_tit">나의 회원정보</span>
                </div>
            </a>
      	  	</li>
  		  	</ul>
				</div>
	
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
						<h5><b> 회원탈퇴 </b></h5>
						<table border="0" cellspacing="0" cellpadding="10">
							<form action="joinOk" method="post" name="join_frm">
					<tr>
						<td class="content_text">아이디
						<input class="inputbox01" type="text" name="mid" placeholder="아이디"></td>
					</tr>
					<tr>
						<td class="content_text">비밀번호
						<input class="inputbox01" type="password" name="mpw" placeholder="비밀번호"></td>
					</tr>
					<tr>
					<tr>
						<td colspan="2" align="center">
						<input class="content_btn01" type="button" value="탈퇴하기" onclick="">					
					</td>										
					</tr>
							</form>
						</table>
					</center>
				</td>
			</tr>
			</table>
			</div>
	<%@ include file="include/footer.jsp" %>

</body>
</html>