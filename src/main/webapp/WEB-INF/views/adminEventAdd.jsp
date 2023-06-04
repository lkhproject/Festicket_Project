<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>페스티켓</title>
	<link rel="stylesheet" type="text/css" href="/resources/css/bootstrap.min.css">
	<link rel="stylesheet" type="text/css" href="/resources/css/style.css">
	<link rel="stylesheet" type="text/css" href="/resources/css/adminEventAdd.css">
	<script src="/resources/js/bootstrap.min.js"></script>
</head>
<body style="background-color: #eeeeee;">
<!-- 헤더 -->
	<%@ include file="include/header.jsp" %>
<!-- 헤더 끝 -->

<!--  -->
<div class="container">
	<div class="container_1" >
	
	<div class="container_2" >
		<h2 class="adminTitle" style="font-size: 25px; font-weight: bold">관리자 페이지</h2>
			<form action="" id="detail_form">
		<!-- 행사 디테일 폼 입력 -->
				<div class="input-group mb-3">
				  <label class="input-group-text" for="inputGroupSelect01">행사분류</label>
				  <select class="form-select" id="inputGroupSelect01">
				    <option selected>Choose...</option>
				    <option value="1">페스티벌</option>
				    <option value="2">전시</option>
				  </select>
				</div>
				
				<div class="input-group has-validation">
				  <span class="input-group-text">행사명</span>
				  <div class="form-floating is-invalid">
				    <input type="text" class="form-control is-invalid" id="floatingInputGroup2" placeholder="Username" required>
				    <label for="floatingInputGroup2">Username</label>
				  </div>
				  <div class="invalid-feedback">
				    Please choose a username.
				  </div>
				</div>
				
				<div class="row g-2">
				  <div class="col-md">
					    <div class="input-group has-validation">
					  <span class="input-group-text">시작일</span>
					  <div class="form-floating is-invalid">
					    <input type="text" class="form-control is-invalid" id="floatingInputGroup2" placeholder="Username" required>
					    <label for="floatingInputGroup2">Username</label>
					  </div>
					  <div class="invalid-feedback">
					    Please choose a username.
					  </div>
					</div>
				  </div>
				  <div class="col-md">
				    <div class="form-floating">
						      <div class="input-group has-validation">
						  <span class="input-group-text">종료일</span>
						  <div class="form-floating is-invalid">
						    <input type="text" class="form-control is-invalid" id="floatingInputGroup2" placeholder="Username" required>
						    <label for="floatingInputGroup2">Username</label>
						  </div>
						  <div class="invalid-feedback">
						    Please choose a username.
						  </div>
						</div>
				    </div>
				  </div>
				</div>
					
				
				<div class="input-group has-validation">
				  <span class="input-group-text">장소</span>
				  <div class="form-floating is-invalid">
				    <input type="text" class="form-control is-invalid" id="floatingInputGroup2" placeholder="Username" required>
				    <label for="floatingInputGroup2">Username</label>
				  </div>
				  <div class="invalid-feedback">
				    Please choose a username.
				  </div>
				</div>
				
				<div class="input-group mb-3">
				  <span class="input-group-text" id="basic-addon1">기관명</span>
				  <input type="text" class="form-control" placeholder="Username" aria-label="Username" aria-describedby="basic-addon1">
				</div>
				
				<div class="input-group mb-3">
				  <span class="input-group-text" id="basic-addon1">이용대상</span>
				  <input type="text" class="form-control" placeholder="Username" aria-label="Username" aria-describedby="basic-addon1">
				</div>
				
				<div class="input-group mb-3">
				  <span class="input-group-text" id="basic-addon1">출연자정보</span>
				  <input type="text" class="form-control" placeholder="Username" aria-label="Username" aria-describedby="basic-addon1">
				</div>
				
				<div class="input-group has-validation">
				  <span class="input-group-text">홈페이지주소</span>
				  <div class="form-floating is-invalid">
				    <input type="text" class="form-control is-invalid" id="floatingInputGroup2" placeholder="Username" required>
				    <label for="floatingInputGroup2">Username</label>
				  </div>
				  <div class="invalid-feedback">
				    Please choose a username.
				  </div>
				</div>
				
				<div class="input-group mb-3">
				  <span class="input-group-text" id="basic-addon1">이용요금</span>
				  <input type="text" class="form-control" placeholder="Username" aria-label="Username" aria-describedby="basic-addon1">
				</div>
				
				<div class="input-group mb-3">
				  <span class="input-group-text" id="basic-addon1">대표이미지</span>
				  <input type="text" class="form-control" placeholder="Username" aria-label="Username" aria-describedby="basic-addon1">
				</div>
				
				<div class="form-floating">
				  <textarea class="form-control" placeholder="Leave a comment here" id="floatingTextarea2" style="height: 300px"></textarea>
				  <label for="floatingTextarea2">프로그램 소개</label>
				</div>
		<!-- 행사 디테일 폼 입력 끝 -->
			</form>
		<!-- 등록, 취소 버튼 -->
				<div style="float: right">
					<input type="submit" class="btn" form="detail_form" value="등록">
					<input type="button" class="btn" onclick="script:window.location.href='adminList'" value="취소">
				</div>
		<!-- 등록, 취소 버튼 끝 -->
			
		</div>
	</div>
</div>

<!-- 푸터 -->
	<%@ include file="include/footer.jsp" %>
<!-- 푸터 끝 -->
</body>
</html>