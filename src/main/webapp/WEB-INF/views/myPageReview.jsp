<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>페스티켓</title>
<link rel="stylesheet" type="text/css" href="/resources/css/bootstrap.min.css">
<link rel="stylesheet" type="text/css" href="/resources/css/myPageReview.css">
<script src="/resources/js/bootstrap.min.js"></script>
</head>
<body>
<%
	int loginOk = Integer.parseInt((request.getAttribute("loginOk")).toString());

	if(loginOk == 0) {
%>
	<script>
		alert("접근 권한이 없는 페이지입니다. 로그인이 필요합니다.");
		window.location.href = "login";
	</script>
<%
	}
%>

<!-- 헤더 시작 -->
<%@ include file="include/header.jsp" %>
<!-- 헤더 끝 -->

<div class="inner">
	<div class="quick_menu_wrap">
		<div class="title">
			<h2 class="title_txt">마이페이지</h2>
		</div>
		<ul class="quick_menu_list">
			<li class="quick_menu_item">
				<a href="myPage" class="quick_link">
					<div class="qmemu_box">
						<span class="qmenu_tit">나의 예매내역</span>
					</div>
				</a>
			</li>
			<li class="quick_menu_item_info">
				<a href="myPageModify" class="quick_link">
					<div class="qmemu_box">
						<span class="qmenu_tit">나의 회원정보</span>
					</div>
				</a>
			</li>
		</ul>
	</div>
	<div class="help_cont">
		<ul class="help_lmenu">
			<li class="has_sub">
				<span class="help_submenu_tit">예매관리</span>
				<ul class="help_submenu">
					<li>
						<a href="myPage">예매확인/취소</a>
					</li>
				</ul>
			</li>
			<li class="has_sub">
				<span class="help_submenu_tit">활동관리</span>
				<ul class="help_submenu">
					<li class="on">
						<a href="myPageReview" class="my_lmenu32">나의 후기</a>
					</li>
				</ul>
			</li>
			<li class="has_sub_last">
				<span class="help_submenu_tit">회원정보관리</span>
				<ul class="help_submenu">
					<li>
						<a href="myPageModify" class="my_lmenu52">회원정보수정</a>
					</li>
					<li>
						<a href="myPageUnreg" class="my_lmenu53">회원탈퇴</a>
					</li>
				</ul>
			</li>
		</ul>
	</div>
	<div class="help_rcont">
		<div class="h3_line">
			<h4 class="tit_reserve01">나의 후기</h4>
		</div>
		<div class="guide_txt">
			<p class="guide_txt">
				고객님께서 남겨주신 후기를 확인하실 수 있습니다.<br>
				운영정책에 위반되거나, 후기의 성격에 맞지 않는 글은 고객님께 사전 통보 없이 삭제될 수 있습니다.
			</p>
		</div>
		<br>
		<div class="container">
			<div class="basic_tbl basic_tbl_v3">
				<table class="table table-striped">
					<thead>
						<tr>
							<th scope="col" style="width:45%">행사명</th>
							<th scope="col" style="width:35%">예약일시</th>
							<th scope="col" style="width:20%">후기작성</th>
						</tr>
					</thead>
					<tbody>
						<c:choose>
							<c:when test="${totalCount == 0}">
								<tr ng-show="reserveList.length === 0">
									<td colspan="6" class="no_data">등록된 후기가 없습니다.</td>
								</tr>
							</c:when>
							<c:otherwise>
								<c:forEach items="${revListDtos }" var="revList">
									<tr>
										<td id="revDetailsNum">${revList.re_idx }</td>
										<td id="revDetails">
											<div style="cursor:pointer;" onclick="script:window.location.href='detailedRev?selectedRev=${revList.re_idx}'">
												<c:choose>
								                  <c:when test="${fn:length(revList.title) gt 40}">
								                    ${fn:substring(revList.title, 0, 39)}...
								                  </c:when>
								                  <c:otherwise>
								                    ${revList.title}
								                  </c:otherwise>
								                </c:choose>
								            </div>
										</td>
										<td id="revDetails">${revList.re_ticketDate }</td>
										<td id="revDetailsNum">${revList.re_ticketCount }</td>
									</tr>
								</c:forEach>
							</c:otherwise>
						</c:choose>
					</tbody>
				</table>
				
	<!-- 페이징 시작 -->
	<div class="container" id="csPagingNum">
	  <ul class="pagination">
    	<li class="page-item" id="page-item">
			<c:if test="${pageMaker.prev }">
				<a class="page-link" aria-label="Previous" href="myPage?pageNum=${pageMaker.startPage-5 }">
					<span aria-hidden="true">&laquo;</span>
				</a>
			</c:if>
		</li>
		
		<c:forEach begin="${pageMaker.startPage }" end="${pageMaker.endPage }" var="num">
			<c:choose>
				<c:when test="${currPage == num }">
					<li class="page-item">
						<span class="page-link" style="font-weight: bold;">${num }</span>
					</li>
				</c:when>
				<c:otherwise>
					<li class="page-item">
						<a class="page-link" href="myPage?pageNum=${num }">${num }</a>
					</li>
				</c:otherwise>
			</c:choose>
		</c:forEach>
		
		<li class="page-item">
			<c:if test="${pageMaker.next }">
				<a class="page-link" aria-label="Next" href="myPage?pageNum=${pageMaker.startPage+5 }">
					<span aria-hidden="true">&raquo;</span>
				</a>
			</c:if>
		</li>
	  </ul>
	</div>
	<!-- 페이징 끝 -->
	
			</div>
		</div>
	</div>
</div>

<!-- 푸터 시작 -->
	<%@ include file="include/footer.jsp" %>
<!-- 푸터 끝 -->
</body>
</html>
