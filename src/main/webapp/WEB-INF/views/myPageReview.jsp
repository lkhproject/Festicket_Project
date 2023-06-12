<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>페스티켓</title>
<link rel="stylesheet" type="text/css" href="/resources/css/bootstrap.min.css">
<link rel="stylesheet" type="text/css" href="/resources/css/header.css">
<link rel="stylesheet" type="text/css" href="/resources/css/myPageReview.css">
</head>
<body>
<%@ include file="include/header.jsp" %>
<div class="inner">
	<div class="quick_menu_wrap">
		<div class="title">
			<h2 class="title_txt">마이페이지</h2>
		</div>
		<ul class="quick_menu_list">
			<li class="quick_menu_item">
				<a href="" class="quick_link">
					<div class="qmemu_box">
						<span class="qmenu_tit">나의 예매권</span>
					</div>
				</a>
			</li>
			<li class="quick_menu_item_info">
				<a href="" class="quick_link">
					<div class="qmemu_box">
						<span class="qmenu_tit">나의 회원정보</span>
					</div>
				</a>
			</li>
		</ul>
	</div>
	<div class="help_cont">
		<ul class="help_lmenu">
			<li class="has_sub">
				<span class="help_submenu_tit">예매관리</span>
				<ul class="help_submenu">
					<li>
						<a href="">예매확인/취소</a>
					</li>
				</ul>
			</li>
			<li class="has_sub">
				<span class="help_submenu_tit">할인혜택</span>
				<ul class="help_submenu">
					<li>
						<a href="">예매권</a>
					</li>
				</ul>
			</li>
			<li class="has_sub">
				<span class="help_submenu_tit">활동관리</span>
				<ul class="help_submenu">
					<li>
						<a href="" class="my_lmenu32">후기관리</a>
					</li>
				</ul>
			</li>
			<li class="has_sub">
				<span class="help_submenu_tit">회원정보관리</span>
				<ul class="help_submenu">
					<li class="on">
						<a href="" class="my_lmenu52">회원정보수정</a>
					</li>
					<li>
						<a href="" class="my_lmenu53">회원탈퇴</a>
					</li>
				</ul>
			</li>
		</ul>
	</div>
	<div class="help_rcont">
		<div class="h3_line">
			<h4 class="tit_reserve01">후기관리</h4>
		</div>
		<div class="guide_txt">
			<p class="guide_txt">
				고객님께서 남겨주신 후기를 확인하실 수 있습니다.<br>
				운영정책에 위반되거나, 후기의 성격에 맞지 않는 글은 고객님께 사전 통보 없이 삭제될 수 있습니다.
			</p>
		</div>
		
		
	</div>
		
		
	<%@ include file="include/footer.jsp" %>
</body>
</html>
