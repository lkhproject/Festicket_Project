<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>페스티켓</title>
<link rel="stylesheet" type="text/css" href="/resources/css/bootstrap.min.css">
<link rel="stylesheet" type="text/css" href="/resources/css/myPageModify.css">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.3/font/bootstrap-icons.css">
<script>
function validateForm() {
    // 아이디, 비밀번호, 비밀번호확인, 이름, 이메일, 휴대폰번호 필드 값 가져오기
    var userId = document.forms["myPageModifyOk_frm"]["userId"].value;
    var password = document.forms["myPageModifyOk_frm"]["userPassword"].value;
    var passwordCheck = document.forms["myPageModifyOk_frm"]["userPasswordCheck"].value;
    var name = document.forms["myPageModifyOk_frm"]["name"].value;
    var email = document.forms["myPageModifyOk_frm"]["email"].value;
    var phone = document.forms["myPageModifyOk_frm"]["userPhone"].value;
    
    
    // 비밀번호 유효성 검사
    if (password.length < 4 || password.length > 12) {
        alert("비밀번호는 4자 이상, 12자 이하로 입력해주세요.");
        return false;
    }

    // 비밀번호 확인 유효성 검사
    if (password !== passwordCheck) {
        alert("비밀번호와 비밀번호 확인이 일치하지 않습니다.");
        return false;
    }  

    // 이메일 유효성 검사
    var emailRegex = /^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$/;
    if (!emailRegex.test(email)) {
        alert("유효한 이메일 주소를 입력해주세요.");
        return false;
    }

    // 휴대폰 번호 유효성 검사
    var phoneRegex = /^\d{10,11}$/;
    if (!phoneRegex.test(phone)) {
        alert("휴대폰 번호는 숫자로 10자 또는 11자로 입력해주세요.");
        return false;
    }

	// 모든 유효성 검사 통과
    alert("수정이 완료되었습니다."); // 수정 완료 안내 팝업
    return true;
    
}
</script>
</head>
<body>
<!-- 헤더 시작 -->
<%@ include file="include/header.jsp" %>
<!-- 헤더 끝 -->

<!-- 상단 box 시작 -->
<div class="inner">
    <div class="quick_menu_wrap">
        <div class="title">
            <h2 class="title_txt">마이페이지</h2>
        </div>
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
                    <li>
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

            <li class="has_sub_last">
                <span class="help_submenu_tit">회원정보관리</span>
                <ul class="help_submenu">
                    <li class="on">
                        <a href="myPageModify">회원정보수정</a>
                    </li>
                    <li>
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
                    <img src="/resources/img/festicket_logo.png" width="30%">
                    <br><br>
                    <form action="myPageModifyOk" method="post" name="myPageModifyOk_frm" onsubmit="return validateForm()">
                        <h5><b> 회원정보수정 </b></h5>
                        <table border="0" cellspacing="0" cellpadding="10">
                            <tr>
                                <td class="content_text">아이디
                                    <input class="inputbox01" type="text" name="userId" value="${memberDto.userId }" readonly="readonly" placeholder="아이디" ></td>
                            </tr>
                            <tr>
                                <td class="content_text">비밀번호
                                    <input class="inputbox01" type="password" name="userPassword" placeholder="비밀번호"></td>
                            </tr>
                            <tr>
                                <td class="content_text">비밀번호확인
                                    <input class="inputbox01" type="password" name="userPasswordCheck" placeholder="비밀번호확인"></td>
                            </tr>
                            <tr>
                                <td class="content_text">이름
                                    <input class="inputbox01" type="text" name="name" value="${memberDto.name }" readonly="readonly" placeholder="이름"></td>
                            </tr>
                            <tr>
                                <td class="content_text">이메일
                                    <input class="inputbox01" type="text" name="email" value="${memberDto.email }" placeholder="이메일"></td>
                            </tr>
                            <tr>
                                <td class="content_text">휴대폰번호
                                    <input class="inputbox01" type="text" name="userPhone" value="${memberDto.userPhone }" placeholder="휴대폰번호"></td>
                            </tr>
                            <tr>
                                <td colspan="2" align="center">
                                    <input class="content_btn01" type="submit" value="수정완료" onclick="return joinCheck();">&nbsp;&nbsp;
                                    <input class="content_btn02" type="button" value="취소" onclick="script:window.location.href='myPage'">
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
