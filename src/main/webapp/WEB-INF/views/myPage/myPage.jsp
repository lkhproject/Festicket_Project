<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>페스티켓</title>
<link rel="stylesheet" type="text/css" href="/resources/css/bootstrap.min.css">
<link rel="stylesheet" type="text/css" href="/resources/css/myPage.css">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.3/font/bootstrap-icons.css">
</head>
<body>

	<%
		int loginOk = Integer.parseInt((request.getAttribute("loginOk")).toString());
	
		if(loginOk == 0) {
			response.sendRedirect("login");
		}
	%>
	
	<!-- 헤더 -->
	<%@ include file="../include/header.jsp" %>
	<!-- 헤더 끝 -->
	
	<!-- 상단 box 시작 -->
			<div class="inner">
				<div class="quick_menu_wrap">
    			<div class="title"><h2 class="title_txt">마이페이지</h2></div>
			<ul class="quick_menu_list">
    	    <li class="quick_menu_item">
    	    <a href="myPage" class="quick_link">
				<div class="qmemu_box">
                   		<span class="qmenu_tit">
                   			<i class="bi bi-ticket-perforated"></i>
                   		</span>
                </div>
                 <div class="qmemu_box01">
                    <span class="qmenu_tit"> 나의 예매내역 </span>
                </div>
            </a>
        	</li>
        	
      		<li class="quick_menu_item">
            <a href="myPageModify" class="quick_link">
                <div class="qmemu_box">
                    <span class="qmenu_tit">
                  	 	<i class="bi bi-person-gear"></i>
                    </span>
                </div>
                 <div class="qmemu_box01">
                    <span class="qmenu_tit"> 나의 회원정보 </span>
                </div>
            </a>
      	  	</li>
  		  	</ul>
				</div>
	<!-- 상단 box 끝 -->
		
		<div class="help_cont">
			<ul class="help_lmenu">
				<li class="has_sub">
					<span class="help_submenu_tit">예매관리</span>
					<ul class="help_submenu">
						<li class="on">
							<a href="myPage">예매확인/취소</a>
						</li>
					</ul>
				</li>
				<li class="has_sub">
					<span class="help_submenu_tit">활동관리</span>
					<ul class="help_submenu">
						<li>
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
				<h4 class="tit_reserve01">예매확인/취소</h4>
			</div>
			<div class="guide_txt">
				<p class="guide_txt">
					<span class="color_point">예매번호</span>를 클릭하면 예매 상세 내용을 확인할 수 있습니다.<br>
					공연/전시 예매 내역은 하단의 공연/전시 탭을 선택하면 확인할 수 있습니다.
				</p>
			</div>
			<div class="sortbx">
				<dl class="daysortbx fl">
					<dt>기간별 조회</dt>
					<dd>
						<ul class="daysort">
							<li ng-repeat="period in periodList" ng-class="{'on' : period.name == search.period.name}" class="ng-scope">
								<a href="" ng-click="periodSelection.select(period)" class="ng-binding">15일</a>
							</li>
							<li ng-repeat="period in periodList" ng-class="{'on' : period.name == search.period.name}" class="ng-scope on">
								<a href="" ng-click="periodSelection.select(period)" class="ng-binding">1개월</a>
							</li>
							<li ng-repeat="period in periodList" ng-class="{'on' : period.name == search.period.name}" class="ng-scope">
								<a href="" ng-click="periodSelection.select(period)" class="ng-binding">2개월</a>
							</li>
							<li ng-repeat="period in periodList" ng-class="{'on' : period.name == search.period.name}" class="ng-scope">
								<a href="" ng-click="periodSelection.select(period)" class="ng-binding">3개월</a>
							</li>
						</ul>
					</dd>
				</dl>
			</div>
			<br><br><br><br>
			<p class="guide_text">예매한 내역이 확인이 안되실 경우 <a href="csBoardList" class="color_point">고객센터</a>를 이용해주세요.</p>
			<br>
			<div class="container">
				<div class="basic_tbl basic_tbl_v3">
					<table class="table table-striped">
						<thead>
							<tr>
								<th scope="col">예매번호</th>
								<th scope="col">티켓명</th>
								<th scope="col">예약일시</th>
								<th scope="col">매수</th>
							</tr>
						</thead>
						<tbody>
							<c:choose>
								<c:when test="${totalCount == 0}">
									<tr ng-show="reserveList.length === 0">
										<td colspan="6" class="no_data">예매한 내역이 없습니다.</td>
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
	
	<!-- 푸터 -->
		<%@ include file="../include/footer.jsp" %>
	<!-- 푸터 끝 -->
	
</body>
</html>