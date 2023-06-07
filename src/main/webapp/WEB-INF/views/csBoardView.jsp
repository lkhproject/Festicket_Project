<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="/resources/css/bootstrap.min.css">
<link rel="stylesheet" href="/resources/css/csBoardView.css">
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
		<h2 class="csBoardTitle">고객센터</h2>
			<form action="csBoardWriteOk" method="post" id="detail_form">
				<div class="input-group mb-3">
					<span class="input-group-text" id="basic-addon1">제목</span>
	  				<input type="text" class="form-control" aria-describedby="basic-addon1" 
	  				 value="${csBoardDto.c_title }" readonly="readonly">
				</div>
				
				<div class="input-group mb-3">
					<span class="input-group-text" id="basic-addon1">작성자</span>
	  				<input type="text" class="form-control" aria-describedby="basic-addon1" 
	  				 value="${csBoardDto.c_userId }" readonly="readonly">
				</div>
				
				<div class="input-group">
	  				<textarea class="form-control" placeholder="문의사항을 입력해주세요." aria-label="With textarea" readonly="readonly">${csBoardDto.c_content }
	  				</textarea>
				</div>
				
				<!-- 댓글 영역 -->

				<!-- 댓글 영역 끝 -->
				
				<!-- 수정, 삭제, 목록 버튼 -->
				<div class="container" style="padding-top: 10px">
				<div class="button_area">
					<div class="button_modify">
						<input type="button" class="btn" id="buttons" value="수정" onclick="script:window.location.href='csBoardModify'">
					</div>
					<div class="button_delete">
						<input type="button" class="btn" id="buttons" value="삭제" onclick="script:window.location.href='csBoardDelete?c_idx=${CSboardDto.c_idx}'">
					</div>
					<div class="button_list">
						<input type="button" class="btn" id="buttons" value="목록" onclick="script:window.location.href='csBoardList'">
					</div>
				</div>
				</div>
				<!-- 수정, 삭제, 목록 버튼 끝 -->
				
			</form>
		</div>
		</div>
	</div>
	<!-- 게시글 작성 끝 -->

	<!-- 푸터 -->
	<%@ include file="include/footer.jsp" %>
	<!-- 푸터 끝 -->
</body>
</html>