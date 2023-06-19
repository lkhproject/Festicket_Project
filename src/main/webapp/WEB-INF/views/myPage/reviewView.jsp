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
		<h2 class="rvWriteTitle">작성 후기</h2>
			<!-- 별점 기능 -->
		 	<form class="mb-1" name="myform" id="myform" method="post">
				<fieldset>
					<span class="text-bold">별점을 선택해주세요</span>
					<input type="radio" name="reviewStar" value="5" id="rate1" disabled>
						<label for="rate1">★</label>
					<input type="radio" name="reviewStar" value="4" id="rate2" disabled>
						<label for="rate2">★</label>
					<input type="radio" name="reviewStar" value="3" id="rate3" disabled>
						<label for="rate3">★</label>
					<input type="radio" name="reviewStar" value="2" id="rate4" disabled>
						<label for="rate4">★</label>
					<input type="radio" name="reviewStar" value="1" id="rate5" disabled>
						<label for="rate5">★</label>
				</fieldset>
			</form>
			<!-- 별점 기능 끝 -->
			
			<!-- 리뷰 내용 폼 -->
			<div class="input-group mt-3">
  				<textarea class="form-control" aria-label="With textarea" name="rw_content" id="rw_content" readonly="readonly">${reviewDto.rw_content }</textarea>
			</div>
				
				<!-- 버튼 -->

				<!-- 버튼 끝 -->
			
			<!-- 리뷰 내용 끝 -->
		</div>
		</div>
	</div>
	
	<!-- 푸터 -->
	<%@ include file="../include/footer.jsp" %>
	<!-- 푸터 끝 -->
	
	<script>
	<!-- 별점에 rw_rating 값 적용 -->
	var rwRating = "${reviewDto.rw_rating}";
	var rateButtons = document.getElementsByName("reviewStar");

	for (var i = 0; i < rateButtons.length; i++) {
		if (rateButtons[i].value == rwRating) {
			rateButtons[i].checked = true;
			break;
		}
	}
	</script>
	
</body>
</html>