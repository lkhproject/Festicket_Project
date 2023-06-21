<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="/resources/css/bootstrap.min.css">
<link rel="stylesheet" href="/resources/css/reviewWrite.css">
<link rel="stylesheet" href="/resources/css/ratingStar.css">
<script src="/resources/js/bootstrap.min.js"></script>
<title>페스티켓</title>
</head>
<body>

	<!-- 헤더 -->
	<%@ include file="../include/header.jsp" %>
	<!-- 헤더 끝 -->
	
	<div class="container">
		<div class="container_1">
		<div id="rvWrite_page_form">
		<h2 class="rvWriteTitle">후기 작성</h2>
			<!-- 별점 기능 -->
		 	<form class="mb-1" name="myform" id="myform" method="post">
				<fieldset>
					<span class="text-bold">별점을 선택해주세요</span>
					<input type="radio" name="reviewStar" value="5" id="rate1">
						<label for="rate1">★</label>
					<input type="radio" name="reviewStar" value="4" id="rate2">
						<label for="rate2">★</label>
					<input type="radio" name="reviewStar" value="3" id="rate3">
						<label for="rate3">★</label>
					<input type="radio" name="reviewStar" value="2" id="rate4">
						<label for="rate4">★</label>
					<input type="radio" name="reviewStar" value="1" id="rate5">
						<label for="rate5">★</label>
				</fieldset>
				<div id="rating_error" class="error"></div>
			</form>
			<!-- 별점 기능 끝 -->
			
			<!-- 리뷰 작성 폼 -->
			<form action="reviewModifyOk" method="post" id="detail_form" onsubmit="return validateCheck()">
				<div class="input-group mt-3">
	  				<textarea class="form-control" placeholder="최소 10자 이상 입력해주세요." aria-label="With textarea" name="rw_content" id="rw_content">${reviewDto.rw_content }</textarea>
				</div>
				<div id="content_error" class="error"></div>
				
				<!-- 등록, 취소 버튼 -->
				<div class="container" style="padding-top: 10px">
				<div class="button_area">
					<div class="button_submit">
					    <input type="hidden" name="rw_idx" value="${reviewDto.rw_idx }">
					    <input type="hidden" name="rw_revNum" value="${reviewDto.rw_revNum }">
		                <input type="hidden" name="rw_rating" id="rw_rating">
						<input type="submit" class="btn" id="button_submit" value="등록">
					</div>
					<div class="button_cancel">
						<input type="button" class="btn" id="button_cancel" onclick="history.go(-2)" value="취소">
					</div>
				</div>
				</div>
				<!-- 등록, 취소 버튼 끝 -->
			</form>
			<!-- 리뷰 작성 끝 -->
		</div>
		</div>
	</div>
	
	<!-- 푸터 -->
	<%@ include file="../include/footer.jsp" %>
	<!-- 푸터 끝 -->
	
	<script>
    // 별점에 rw_rating 값 적용
    var rwRating = "${reviewDto.rw_rating}";
    var rateButtons = document.getElementsByName("reviewStar");

    // 기존 값을 선택
    for (var i = 0; i < rateButtons.length; i++) {
        if (rateButtons[i].value == rwRating) {
            rateButtons[i].checked = true;
            break;
        }
    }

    // 별점 클릭 시 선택된 값을 저장
    for (var i = 0; i < rateButtons.length; i++) {
        rateButtons[i].addEventListener("click", function() {
            if (this.checked) {
                rwRating = this.value;
                document.getElementById("rating_error").innerHTML = ""; // 선택 시 에러 메시지 초기화
            }
        });
    }

    // 폼 제출 시 선택된 별점 값 전달
    document.getElementById("detail_form").addEventListener("submit", function() {
        document.getElementById("rw_rating").value = rwRating;
        if (rwRating === "") {
            alert("별점을 선택해주세요.");
            return false; // 폼 제출 취소
        }
    });

    // 글쓰기 폼 유효성 검사
    function validateCheck() {
        var content = document.getElementById("rw_content").value;

        var contentError = document.getElementById("content_error");

        contentError.innerHTML = "";

        var isValid = true;

        if (content.trim().length < 10) {
            contentError.innerHTML = "※ 내용은 10글자 이상이어야 합니다.";
            isValid = false;
        }

        return isValid;
    }

    // 페이지 로드 시 별점 선택 여부 확인
    window.addEventListener("load", function() {
        var isChecked = false;

        for (var i = 0; i < rateButtons.length; i++) {
            if (rateButtons[i].checked) {
                isChecked = true;
                break;
            }
        }

        if (!isChecked && rwRating === "") {
            alert("별점을 선택해주세요.");
        }
    });
	</script>
	
</body>
</html>