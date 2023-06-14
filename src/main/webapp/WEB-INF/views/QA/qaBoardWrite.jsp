<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="/resources/css/bootstrap.min.css">
<link rel="stylesheet" href="/resources/css/csBoardWrite.css">
<script src="/resources/js/bootstrap.min.js"></script>
<title>페스티켓</title>
</head>
<body>
	<!-- 헤더 -->
	<%@ include file="include/header.jsp" %>
	<!-- 헤더 끝 -->
	
	<!-- 게시글 작성 폼 -->
	<div class="container">
		<div class="container_1">
		<div id="csBoard_page_form">
		<h2 class="csBoardTitle">문의하기</h2>
			<form action="qaBoardWriteOk" method="post" id="detail_form" onsubmit="return validateCheck()">
				<div class="input-group mt-3">
					<span class="input-group-text" id="basic-addon1">제목</span>
	  				<input type="text" class="form-control" aria-describedby="basic-addon1" name="q_title" id="q_title">
				</div>
				<div id="title_error" class="error"></div>
				
				<div class="input-group mt-3">
				    <span class="input-group-text" id="basic-addon1">작성자</span>
				    <input type="text" class="form-control" aria-describedby="basic-addon1" 
				        value="${sessionId }" name="q_userId" readonly="readonly">
				</div>
				
				<div class="input-group mt-3">
	  				<textarea class="form-control" placeholder="문의사항을 입력해주세요." aria-label="With textarea" name="q_content" id="q_content"></textarea>
				</div>
				<div id="content_error" class="error"></div>
				
				<!-- 등록, 취소 버튼 -->
				<div class="container" style="padding-top: 10px">
				<div class="button_area">
					<div class="button_submit">
						<input type="hidden" name="eventNum" value="${eventNum}">
						<input type="submit" class="btn" id="button_submit" value="등록">
					</div>
					<div class="button_cancel">
						<input type="button" class="btn" id="button_cancel" onclick="window.history.back();" value="취소">
					</div>
				</div>
				</div>
				<!-- 등록, 취소 버튼 끝 -->
			</form>
		</div>
		</div>
	</div>
	<!-- 게시글 작성 끝 -->
	
	<!-- 푸터 -->
	<%@ include file="include/footer.jsp" %>
	<!-- 푸터 끝 -->
	
	<script>
	<!-- 글쓰기 폼 유효성 검사 -->
	function validateCheck() {
	  var title = document.getElementById("q_title").value;
	  var content = document.getElementById("q_title").value;

	  var titleError = document.getElementById("title_error");
	  var contentError = document.getElementById("content_error");

	  titleError.innerHTML = "";
	  contentError.innerHTML = "";

	  var isValid = true;

	  if (title.trim().length === 0) {
	    titleError.innerHTML = "※ 제목을 입력해주세요.";
	    isValid = false;
	  } else if (title.trim().length > 50) {
	    titleError.innerHTML = "※ 제목은 50글자 이하여야 합니다.";
	    isValid = false;
	  }

	  if (content.trim().length < 10) {
	    contentError.innerHTML = "※ 내용은 10글자 이상이어야 합니다.";
	    isValid = false;
	  }

	  return isValid;
	}
	</script>
</body>
</html>