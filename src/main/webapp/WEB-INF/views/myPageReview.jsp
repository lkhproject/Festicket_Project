<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>페스티켓</title>
<link rel="stylesheet" type="text/css" href="/resources/css/bootstrap.min.css">
<link rel="stylesheet" type="text/css" href="/resources/css/myPageReview.css">
<script src="/resources/js/bootstrap.min.js"></script>
</head>
<body>

<!-- 헤더 시작 -->
<%@ include file="include/header.jsp" %>
<!-- 헤더 끝 -->

<div class="inner">
	<div class="quick_menu_wrap">
		<div class="title">
			<h2 class="title_txt">마이페이지</h2>
		</div>
		<ul class="quick_menu_list">
			<li class="quick_menu_item">
				<a href="" class="quick_link">
					<div class="qmemu_box">
						<span class="qmenu_tit">나의 예매내역</span>
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
						<a href="/myPage">예매확인/취소</a>
					</li>
				</ul>
			</li>
			<li class="has_sub">
				<span class="help_submenu_tit">활동관리</span>
				<ul class="help_submenu">
					<li class="on">
						<a href="/myPageReview" class="my_lmenu32">나의 후기</a>
					</li>
				</ul>
			</li>
			<li class="has_sub_last">
				<span class="help_submenu_tit">회원정보관리</span>
				<ul class="help_submenu">
					<li>
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
			<h4 class="tit_reserve01">나의 후기</h4>
		</div>
		<div class="guide_txt">
			<p class="guide_txt">
				고객님께서 남겨주신 후기를 확인하실 수 있습니다.<br>
				운영정책에 위반되거나, 후기의 성격에 맞지 않는 글은 고객님께 사전 통보 없이 삭제될 수 있습니다.
			</p>
		</div>
		<br>
		<div class="container">
			<div id="review_page_form">
				<table class="table table-hover" id="reviewListTable">
					<thead>
						<tr>
					      <th scope="col" style="width:30%;">행사명</th>
					      <th scope="col" style="width:35%">후기내용</th>
					      <th scope="col" style="width:20%">작성일</th>
					      <th scope="col" style="width:15%">상태</th>
			    		</tr>
			  		</thead>
			  		<tbody class="table-group-divider">
			  			<tr ng-show="reserveList.length === 0">
							<td colspan="6" class="no_data">아직 작성된 후기가 없습니다.</td>
						</tr>
			  		</tbody>
			  	</table>
			</div>
		</div>
	</div>
</div>

<!-- 푸터 시작 -->
	<%@ include file="include/footer.jsp" %>
<!-- 푸터 끝 -->
</body>
</html>
