<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="/resources/css/bootstrap.min.css">
<link rel="stylesheet" href="/resources/css/csBoardWrite.css">
<title>페스티켓</title>
</head>
<body>
	<%@ include file="include/header.jsp" %>
	
	<div class="category_name"><h1>고객센터</h1></div>
	
	<form class="board_content" action="csWrite">
		<div style="float:left; width:100px; height:24px; padding:13px 15px; background:#eee;">
			제목
		</div>

		<div style="float:left; width:605px; padding:9px 20px; background:#f9f9f9;">
			<input name='bbs_title' type='text' value='' maxlength="100" style="width:590px; height:24px; padding:2px 5px; font-size:15px; color:#313131;" placeholder="제목을 입력해주세요" required />
		</div>
		
		<div style="clear:both;"></div>

		<div style="float:left; width:100px; height:24px; padding:13px 15px; background:#eee; border-top:1px solid #ccc;">
			작성자
		</div>

		<div style="float:left; width:605px; padding:9px 20px; background:#f9f9f9; border-top:1px solid #ccc;">
			<input type='tel' name='hphone' value='' maxlength="15" style="width:200px; height:24px; padding:2px 5px; font-size:15px; color:#313131;" placeholder="휴대폰번호를 남겨주세요" required="required">
		</div>
		
		<div style="margin-top:10px; border:1px solid #ccc; width:775px;">
			<textarea style="width:745px; height:200px; border:none; font-size:15px; color:#313131; line-height:22px; padding:15px; resize: none;" name="bbs_review" placeholder="문의사항을 입력해주세요" required></textarea>
		</div>
	</form>
	<input class="submit_btn" type="button" value="등록" style="">
	
	<%@ include file="include/footer.jsp" %>
</body>
</html>