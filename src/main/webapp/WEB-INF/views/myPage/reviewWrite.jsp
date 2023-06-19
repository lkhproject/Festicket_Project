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

	<%
	  int loginOk = Integer.parseInt((request.getAttribute("loginOk")).toString());
	
	  if(loginOk == 0) {
	      String previousPage = request.getRequestURL().toString();
	      session.setAttribute("previousPage", previousPage);
	%>
	  <script>
	      window.location.href = "login";
	  </script>
	<%
	  }
	%>
	
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
			</form>
			<!-- 별점 기능 끝 -->
			
			<!-- 리뷰 작성 폼 -->
			<form action="reviewWriteOk" method="post" id="detail_form" onsubmit="return validateCheck()">
				<div class="input-group mt-3">
	  				<textarea class="form-control" placeholder="최소 10자 이상 입력해주세요." aria-label="With textarea" name="rw_content" id="rw_content"></textarea>
				</div>
				
				<!-- 등록, 취소 버튼 -->
				<div class="container" style="padding-top: 10px">
				<div class="button_area">
					<div class="button_submit">
					   	<input type="hidden" name="sessionId" value="${sessionId}">
                    	<input type="hidden" name="eventNum" value="${eventNum}">
                    	<input type="hidden" name="re_idx" value="${re_idx}">
						<input type="hidden" name="rw_rating" id="rw_rating">
						<input type="submit" class="btn" id="button_submit" value="등록">
					</div>
					<div class="button_cancel">
						<input type="button" class="btn" id="button_cancel" onclick="script:window.location.href='myPageReview'" value="취소">
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
	<!-- 별점 선택 시 값 설정 -->
	var rateButtons = document.getElementsByName("reviewStar");
	var rwRatingInput = document.getElementById("rw_rating");

	for (var i = 0; i < rateButtons.length; i++) {
	  rateButtons[i].addEventListener("click", function() {
	    rwRatingInput.value = this.value;
	  });
	}
	
	<!-- 글쓰기 폼 유효성 검사 -->
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
	</script>
	
</body>
</html>