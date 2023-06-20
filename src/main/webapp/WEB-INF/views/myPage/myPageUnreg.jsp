<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>페스티켓</title>
	<link rel="stylesheet" type="text/css" href="/resources/css/bootstrap.min.css">
	<link rel="stylesheet" type="text/css" href="/resources/css/myPageUnreg.css">
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.3/font/bootstrap-icons.css">
	<script>
        function deleteCheck() {
            var userPassword = document.getElementById("userPassword").value;

            if (userPassword.trim() === "") {
                alert("비밀번호를 입력해주세요.");
                return false;
            }
            
            var storedPassword = document.myPageUnregOk_frm.storedPassword.value;
            var inputPassword = document.myPageUnregOk_frm.userPassword.value;
           
            if (storedPassword !== inputPassword) {
                alert("가입하신 비밀번호와 일치하지 않습니다. 다시 확인 해주세요");
                return false;
            }

            var confirmation = confirm("회원탈퇴하시겠습니까?");
            if (!confirmation) {
            	alert("취소되었습니다.")
              return false;
             }

            alert("회원탈퇴되었습니다.");

            return true;
        }
    </script>
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
						<form action="myPageUnregOk" method="post" name="myPageUnregOk_frm" onsubmit="return deleteCheck()">
						    <tr>
						        <td class="content_text">아이디
						        <input class="inputbox01" type="text" name="userId" id="userId" value="${memberDto.userId }" readonly="readonly" placeholder="아이디" >
						        </td>
						    </tr>
						    <tr>
						        <td class="content_text">비밀번호
						        <input class="inputbox01" type="password" name="userPassword" id="userPassword" placeholder="비밀번호" >
						        </td>
						    </tr>
						        <td colspan="2" align="center">
						            <input class="content_btn01" type="submit" value="탈퇴하기" onclick=" returndeleteCheck()">
						            <input class="content_btn02" type="button" value="취소" onclick="script:window.location.href='myPage'" >
						        </td>
						    </tr>
						    <input type="hidden" name="storedPassword" value="${memberDto.userPassword}">
						</form>
					</table>
				</center>
			</div>
		</div>
			
	<!-- 푸터 -->
	<%@ include file="../include/footer.jsp" %>
	
</body>
</html>