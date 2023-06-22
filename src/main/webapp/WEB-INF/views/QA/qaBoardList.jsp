<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>

<head>
    <meta charset="UTF-8">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/resources/css/bootstrap.min.css">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/resources/css/csBoardList.css">
    <script src="${pageContext.request.contextPath }/resources/js/bootstrap.min.js"></script>
    <title>페스티켓</title>
</head>

<body>
    <!-- 헤더 시작 -->
    <%@ include file="../include/header.jsp" %>
    <!-- 헤더 끝-->

    <!-- 게시글 리스트 시작 -->
    <div class="container">
        <div class="container_1">
            <div id="csBoard_page_form">
                <h2 class="csBoardTitle">Q&A</h2>
                <h5 style="float: right;">${event.title }</h5>
                <table class="table table-hover" id="csListTable">
                    <thead>
                        <tr>
                            <th scope="col">번호</th>
                            <th scope="col" style="width:350px;">제목</th>
                            <th scope="col">작성자</th>
                            <th scope="col">작성일</th>
                            <th scope="col">조회수</th>
                        </tr>
                    </thead>
                    <tbody class="table-group-divider">
                        <c:choose>
                            <c:when test="${totalCount == 0}">
                                <tr ng-show="QAList.length === 0">
                                    <td colspan="6" class="no_data">등록된 Q&A가 없습니다.</td>
                                </tr>
                            </c:when>
                            <c:otherwise>
                                <c:forEach items="${QAListDtos }" var="qaList" begin="0" end="11">
                                    <tr>
                                        <th scope="row">${qaList.q_idx }</th>
                                        <td>
                                            <a href="qaView?selectedQA=${qaList.q_idx }">
                                                <!-- 제목 글자수 제한 -->
                                                <c:choose>
                                                    <c:when test="${fn:length(qaList.q_title) > 20}">
                                                        <c:out value="${fn:substring(qaList.q_title, 0, 19)}"></c:out>...
                                                    </c:when>
                                                    <c:otherwise>
                                                        <c:out value="${qaList.q_title }"></c:out>
                                                    </c:otherwise>
                                                </c:choose>
                                            </a>
                                            <!-- 댓글 수 -->
                                            <c:if test="${qaList.q_replyCount != 0 }">
                                                <span class="badge">${qaList.q_replyCount }</span>
                                            </c:if>
                                        </td>
                                        <td>${qaList.q_userId }</td>
                                        <td>
                                            <fmt:formatDate value="${qaList.q_writeDate }" pattern="yyyy-MM-dd" />
                                        </td>
                                        <td>${qaList.q_hit }</td>
                                    </tr>
                                </c:forEach>
                            </c:otherwise>
                        </c:choose>
                    </tbody>
                </table>
                <input type="button" value="돌아가기" id="QAbtn" onclick="script:window.location.href='rvView?selectedEvent=${event.eventNum}'">
                <c:if test="${sessionId != null && sessionId ne 'admin'}">
                    <input type="button" value="문의하기" id="QAbtn" style="margin-right: 3px;" onclick="script:window.location.href='qaBoardWrite?eventNum=${event.eventNum}'">
                </c:if>
                <!-- 게시글 리스트 끝 -->

                <!-- 페이징 시작 -->
				<div class="container" id="csPagingNum">
				  <ul class="pagination">
			    	<li class="page-item" id="page-item">
						<c:if test="${pageMaker.prev }">
							<a class="page-link" aria-label="Previous" href="qaBoardList?pageNum=${pageMaker.startPage-5 }">
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
									<a class="page-link" href="qaBoardList?pageNum=${num }">${num }</a>
								</li>
							</c:otherwise>
						</c:choose>
					</c:forEach>
					
					<li class="page-item">
						<c:if test="${pageMaker.next }">
							<a class="page-link" aria-label="Next" href="qaBoardList?pageNum=${pageMaker.startPage+5 }">
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

    <!-- 푸터 시작 -->
    <%@ include file="../include/footer.jsp" %>
    <!-- 푸터 끝 -->
</body>

</html>