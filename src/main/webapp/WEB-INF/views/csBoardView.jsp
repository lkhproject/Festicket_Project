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
	
	<!-- 게시글 영역 -->
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
  				<textarea class="form-control" placeholder="문의사항을 입력해주세요." aria-label="With textarea" readonly="readonly">${csBoardDto.c_content }
  				</textarea>
			</div>
	<!-- 게시글 영역 끝 -->
			
			<!-- 댓글 영역 -->
			<!-- 댓글 쓰기 영역 -->
			<form action="replyWrite" method="post">
			<input type="hidden" name="ca_boardNum" value="${csBoardDto.c_idx }">
			<div class="reply_write" style='border:1px solid #e4e4e4; padding:10px 15px 8px 15px; background:#f6f6f6'>
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
			<!-- 댓글 쓰기 영역 끝 -->				
			<!-- 댓글 리스트 영역 -->
			<div class="reply_list" style="padding-top:0px; width:778px;">
				<table cellspacing="0" style="width:100%; margin:10px 0 15px 0; padding:15px 0; border-top:1px solid #ddd;">
			        <c:forEach items="${replyList }" var="replyDto">
			        <tr>
			          <td style='font-size:14px; height:15px; color:#aaa; padding-top:15px;' align='left'>
			          	<span style='color:#1e6ec9;'>${replyDto.ca_userId }</span>
				        &nbsp;&nbsp;|&nbsp;&nbsp;${replyDto.ca_answerDate }&nbsp;&nbsp;&nbsp;
						<input type="button" value="삭제" onclick="script:window.location.href='replyDelete?ca_idx=${replyDto.ca_idx }&ca_boardNum=${csBoardDto.c_idx }'">
			          </td>
			        </tr>
			        <tr>
			          <td colspan='2' style='font-size:15px; height:14px; padding-top:10px; color:#000; font-weight:300; line-height:22px;' align="left">
			          	${replyDto.ca_content }
			          </td>
			        </tr>
			        </c:forEach>
		        </table>
			</div>
			<!-- 댓글 리스트 영역 끝 -->			
			<!-- 댓글 영역 끝 -->
			
			<!-- 수정, 삭제, 목록 버튼 -->
			<div class="container" style="padding-top: 10px">
			<div class="button_area">
				<div class="button_modify">
					<input type="button" class="btn" id="buttons" value="수정" onclick="script:window.location.href='csBoardModify'">
				</div>
				<div class="button_delete">
					<input type="button" class="btn" id="buttons" value="삭제" onclick="script:window.location.href='csBoardDelete?c_idx=${csBoardDto.c_idx}'">
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

	<!-- 푸터 -->
	<%@ include file="include/footer.jsp" %>
	<!-- 푸터 끝 -->
</body>
</html>