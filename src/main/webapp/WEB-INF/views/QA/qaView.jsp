<%@page import="com.festicket.dto.QABoardDto"%>
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
	<%@ include file="../include/header.jsp" %>
	<!-- 헤더 끝 -->
	
	<!-- 게시글 작성 폼 -->
	<div class="container">
		<div class="container_1">
		<div id="csBoard_page_form">
		<h2 class="csBoardTitle" style="margin-bottom: 35px">Q&A</h2>
		
				<div class="input-group mb-3">
					<span class="input-group-text" id="basic-addon1">제목</span>
	  				<input type="text" class="form-control" aria-describedby="basic-addon1" 
	  				 value="${qaDto.q_title }" readonly="readonly">
				</div>
				
				<div class="input-group mb-3">
					<span class="input-group-text" id="basic-addon1">작성자</span>
	  				<input type="text" class="form-control" aria-describedby="basic-addon1" 
	  				 value="${qaDto.q_userId }" readonly="readonly">
				</div>
				
				<div class="input-group mb-3">
					<span class="input-group-text" id="basic-addon1">작성일</span>
	  				<input type="text" class="form-control" aria-describedby="basic-addon1" 
	  				 value="${qaDto.q_writeDate }" readonly="readonly">
				</div>
				
				<div class="input-group">
	  				<textarea class="form-control" placeholder="문의사항을 입력해주세요." aria-label="With textarea" readonly="readonly">${qaDto.q_content }
	  				</textarea>
				</div>
				
				<!-- 댓글 영역 -->
				<!-- 댓글 쓰기 -->
                <!-- 세션 아이디가 작성자와 같거나 'admin'일 때만 댓글창 보이기 -->
                <c:if test="${qaDto.q_userId eq sessionId or sessionId eq 'admin'}">
                <form action="QAreplyWrite" method="get">
                    <input type="hidden" name="sessionId" value="${sessionId}">
                    <input type="hidden" name="selectedQA" value="${qaDto.q_idx }">
                    <div class="reply_write">
                        <table cellpadding=0 cellspacing=0 width='100%'>
                            <tr>
                                <td><textarea name="qa_content" maxlength="1000" style="font-size:15px; padding:7px; width:95%; height:55px; border:1px solid #ddd; -webkit-appearance:none;"></textarea></td>
                                <td style="width:70px;">
                                    <input type="submit" value="등록" style="width:90px; height:70px; margin-bottom:3px; background:#e2e2e2; color:#555; font-weight:700; border:none; border-radius:5px; font-size:16px;">
                                </td>
                            </tr>
                        </table>
                    </div>
                </form>
                </c:if>
                <!-- 댓글 쓰기 끝 -->
                
                <!-- 댓글 리스트 영역 시작 -->
				<div class="container ">
				  <c:forEach items="${QAreplyList}" var="QAreply">
				    <table id="reply_list" cellspacing="0">
				      <tr>
				        <td id="reply_list_id">
				        <!-- 댓글 아이디가 'admin'이면 아이디 대신 '관리자'로 뜨게 -->
				          <c:choose>
				            <c:when test="${QAreply.qa_userId eq 'admin'}">
				              <span style='color:#1e6ec9; font-weight:bold;'>관리자</span>
				            </c:when>
				            <c:otherwise>
				              <span style='color:#1e6ec9; font-weight:bold;'>${QAreply.qa_userId}</span>
				            </c:otherwise>
				          </c:choose>
				          &nbsp;&nbsp;|&nbsp;&nbsp;${QAreply.qa_answerDate}&nbsp;&nbsp;&nbsp;
				          <!-- 세션 아이디가 작성자와 같으면 삭제 버튼 보이게 -->
				          <c:if test="${QAreply.qa_userId eq sessionId}">
				            <img src="/resources/img/btn_del_reply.png" onclick="replyRemoveCheck('${QAreply.qa_idx}', '${qaDto.q_idx}')" style="cursor:pointer">
				          </c:if>
				        </td>
				      </tr>
				      <tr>
				        <td id="reply_list_cnt" colspan='2'>${QAreply.qa_content}</td>
				      </tr>
				    </table>
				  </c:forEach>
				</div>
                <!-- 댓글 리스트 영역 끝 -->
				<!-- 댓글 영역 끝 -->
				
				<!-- 세션 아이디를 userId 변수에 저장 -->
				<!-- 수정, 삭제, 목록 버튼 -->
				<div class="container" style="padding-top: 10px">
				    <div class="button_area">
				        <!-- 작성자와 세션 아이디 비교하여 수정, 삭제 버튼 보이기 -->
				        <c:if test="${qaDto.q_userId eq sessionId}">
				            <div class="button_modify">
				                <form action="qaBoardModify" method="get">
				                    <input type="hidden" name="selectedQA" value="${qaDto.q_idx}">
				                    <input type="submit" class="btn" id="buttons" value="수정">
				                </form>
				            </div>
				            <div class="button_delete">
				                <input type="button" class="btn" id="buttons" value="삭제" onclick="removeCheck()">
				            </div>
				        </c:if>
				        <div class="button_list">
				            <input type="button" class="btn" id="buttons" value="목록" onclick="script:window.location.href='qaBoardList'">
				        </div>
				    </div>
				</div>
				<!-- 수정, 삭제, 목록 버튼 끝 -->
				
		</div>
		</div>
	</div>
	<!-- 게시글 작성 끝 -->

	<!-- 푸터 -->
	<%@ include file="../include/footer.jsp" %>
	<!-- 푸터 끝 -->
	
<script>
	<!-- 글 삭제시 경고창 -->
	function removeCheck() {
		if (confirm("삭제하시겠습니까?") == true){
			location.href='qaBoardDelete?selectedQA=${qaDto.q_idx}&qa_boardNum=${qaDto.q_idx}'
	 	} else {return false;}
	}
	
	<!-- 댓글 삭제시 경고창 -->
	function replyRemoveCheck(qa_idx) {
		 if (confirm("삭제하시겠습니까?") == true) {
		   var form = document.createElement("form");
		   form.action = 'QAreplyDelete';
		   form.method = 'post';
	
		   var qa_idxInput = document.createElement("input");
		   qa_idxInput.type = 'hidden';
		   qa_idxInput.name = 'qa_idx';
		   qa_idxInput.value = qa_idx;
		   form.appendChild(qa_idxInput);
	
		   var qa_boardNumInput = document.createElement("input");
		   qa_boardNumInput.type = 'hidden';
		   qa_boardNumInput.name = 'qa_boardNum';
		   qa_boardNumInput.value = '${qaDto.q_idx }';
		   form.appendChild(qa_boardNumInput);
	
		   document.documentElement.appendChild(form);
		   form.submit();
		 } else {
		   return false;
		 }
	}
	
	<!-- 댓글 유효성 검사 -->
	function replyValidateCheck() {
	    var content = document.getElementsByName("qa_content")[0].value;
	    if (content.trim() === "") {
	        alert("내용을 입력해주세요.");
	        return false;
	    }
	    return true;
	}
</script>
</body>
</html>