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
	<!-- 헤더 시작 -->
	<%@ include file="include/header.jsp" %>
	<!-- 헤더 끝 -->
	
	<!-- 게시글 영역 시작 -->
	<div class="container">
		<div class="container_1">
		<div id="csBoard_page_form">
		<h2 class="csBoardTitle">고객센터</h2>
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
  				<textarea class="form-control" placeholder="문의사항을 입력해주세요." aria-label="With textarea" readonly="readonly">${csBoardDto.c_content }</textarea>
			</div>
	<!-- 게시글 영역 끝 -->
			
			<!-- 댓글 영역 시작 -->
			<!-- 댓글 쓰기 시작 -->
			<form action="replyWrite" method="post">
			<input type="hidden" name="ca_boardNum" value="${csBoardDto.c_idx }">
			<div class="reply_write">
			  <table cellpadding=0 cellspacing=0 width='100%'>
			    <tr>
			      <td><textarea name="ca_content" maxlength="1000" style="font-size:15px; padding:7px; width:95%; height:55px; border:1px solid #ddd; -webkit-appearance:none;"></textarea></td>
			      <td style="width:70px;">
			        <input type="submit" value="등록" style="width:90px; height:70px; margin-bottom:3px; background:#e2e2e2; color:#555; font-weight:700; border:none; border-radius:5px; font-size:16px;"> 	
			      </td>
			    </tr>
			  </table>
			</div>
			</form>
			<!-- 댓글 쓰기 끝 -->				
			<!-- 댓글 리스트 영역 시작 -->
			<div class="container">
		        <c:forEach items="${replyList }" var="replyDto">
			        <table id="reply_list" cellspacing="0" >
			        <tr>
			          <td id="reply_list_id">
			          	<span style='color:#1e6ec9;'>${replyDto.ca_userId }</span>
				        &nbsp;&nbsp;|&nbsp;&nbsp;${replyDto.ca_answerDate }&nbsp;&nbsp;&nbsp;
			          	<a href="replyDelete?ca_idx=${replyDto.ca_idx }&ca_boardNum=${csBoardDto.c_idx }"><img src="/resources/img/btn_del_reply.png"></a>
			          </td>
			        </tr>
			        <tr>
			          <td id="reply_list_cnt" colspan='2'>${replyDto.ca_content }</td>
			        </tr>
			        </table>
		        </c:forEach>
		        <hr style="color:#888888;">
			</div>	
			<!-- 댓글 리스트 영역 끝 -->			
			<!-- 댓글 영역 끝 -->
			
			<!-- 수정, 삭제, 목록 버튼 시작 -->
			<div class="container" style="padding-top: 10px">
			<div class="button_area">
				<div class="button_modify">
					<input type="button" class="btn" id="buttons" value="수정" onclick="script:window.location.href='csBoardModify'">
				</div>
				<div class="button_delete">
					<input type="button" class="btn" id="buttons" value="삭제" onclick="script:window.location.href='csBoardDelete?c_idx=${csBoardDto.c_idx}&ca_boardNum=${csBoardDto.c_idx}'">
				</div>
				<div class="button_list">
					<input type="button" class="btn" id="buttons" value="목록" onclick="script:window.location.href='csBoardList'">
				</div>
			</div>
			</div>
			<!-- 수정, 삭제, 목록 버튼 끝 -->
		</div>
		</div>
	</div>

	<!-- 푸터 시작 -->
	<%@ include file="include/footer.jsp" %>
	<!-- 푸터 끝 -->
</body>
</html>