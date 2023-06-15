<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
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
					고객님께서 남겨주신 후기를 확인하실 수 있습니다.<br>
					운영정책에 위반되거나, 후기의 성격에 맞지 않는 글은 고객님께 사전 통보 없이 삭제될 수 있습니다.
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
								<th scope="col" style="width:40%">행사명</th>
								<th scope="col" style="width:35%">예약일시</th>
								<th scope="col" style="width:25%">후기작성</th>
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
</body>
</html>