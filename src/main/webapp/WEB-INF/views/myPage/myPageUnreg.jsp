<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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
		<%@ include file="../include/header.jsp" %>
		<!-- 헤더 끝 -->
	
		<!-- 상단 box 시작 -->
					<div class="inner">
						<div class="quick_menu_wrap">
		    			<div class="title"><h2 class="title_txt">마이페이지</h2></div>
					<ul class="quick_menu_list">
		    	    <li class="quick_menu_item">
		    	    <a href="myPage" class="quick_link">
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
		            <a href="myPageModify" class="quick_link">
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
						<a href="myPageReview">나의 후기</a>
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
			<div class="contentbox">
				<center>
					<img src="/resources/img/festicket_logo.png" width="30%">
					<br><br>
					<h5><b>회원탈퇴</b></h5>
					<table border="0" cellspacing="0" cellpadding="10">
						<form action="myPageUnregOk" method="post" name="myPageUnreg_frm">
						    <tr>
						        <td class="content_text">아이디
						            <input class="inputbox01" type="text" name="userId" id="userId" value="${memberDto.userId }" readonly="readonly" placeholder="아이디" required>
						        </td>
						    </tr>
						    <tr>
						        <td class="content_text">비밀번호
						            <input class="inputbox01" type="password" name="userPassword" id="userPassword" placeholder="비밀번호" required>
						        </td>
						    </tr>
						    <tr>
						        <td colspan="2" align="center">
						            <input class="content_btn01" type="submit" value="탈퇴하기" onclick="confirmDelete()">
						        </td>
						    </tr>
						</form>
					</table>
				</center>
			</div>

	<!-- 푸터 -->
	<%@ include file="../include/footer.jsp" %>
	<!-- 푸터 끝 -->

	<script>
		function confirmDelete() {
	        var userId = document.getElementById("userId").value;
	        var password = document.getElementById("userPassword").value;
	
	        // 아이디와 비밀번호의 유효성 검사 로직 작성
	        // 이 예시에서는 간단한 빈 값 검사만 수행합니다.
	        if (userId.trim() === '' || password.trim() === '') {
	            alert("아이디와 비밀번호를 모두 입력해주세요.");
	            return false; // 빈 값이 있을 경우 false 반환하여 인덱스로 넘어가지 않음
	        } else {
	            // 회원 탈퇴를 진행하기 전에 확인하는 팝업
	            return confirm("회원 탈퇴를 진행하시겠습니까?");
	        }
	    }
	</script>

</body>
</html>