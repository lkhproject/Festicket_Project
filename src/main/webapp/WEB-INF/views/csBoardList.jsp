<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" type="text/css" href="/resources/css/bootstrap.min.css">
<script src="/resources/js/bootstrap.min.js"></script>
<title>페스티켓</title>
</head>
<body>
	<!-- 헤더 -->
	<%@ include file="include/header.jsp" %>
	<!-- 헤더 끝-->

	<!-- 게시글 리스트 -->
	<div class="container">
	<div class="container_1">
	<div id="csBoard_page_form">
		<h2 class="csBoardTitle">고객센터</h2>
		<table class="table table-hover" id="adminTable">
			<thead style="background-color: #eeeeee">
				<tr>
			      <th scope="col">번호</th>
			      <th scope="col">제목</th>
			      <th scope="col">작성자</th>
			      <th scope="col">작성일</th>
			      <th scope="col">조회수</th>
	    		</tr>
	  		</thead>
	  		<tbody class="table-group-divider">
		  		<c:forEach items="${csList }" var="csList"  begin="0" end="1">
				    <tr>
				      <th scope="row">${csList.c_idx }</th>
				      <td><a href="#">${csList.c_title }</a></td>
				      <td>${csList.c_userId }</td>
				      <td>${csList.c_writeDate }</td>
				      <td>${csList.c_hit }</td>
				    </tr>
			  	</c:forEach>
	  		</tbody>
	  	</table>	  		
	 <!-- 게시글 리스트 끝 -->
	
	</div>
	</div>
	</div>
	

	<!-- 푸터 -->
	<%@ include file="include/footer.jsp" %>
	<!-- 푸터 끝 -->
</body>
</html>