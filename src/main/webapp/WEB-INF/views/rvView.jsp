<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" type="text/css" href="/resources/css/bootstrap.min.css">
<link rel="stylesheet" type="text/css" href="/resources/css/rvView.css">
<script src="/resources/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css">

<!-- jquery -->
<link rel="stylesheet" href="http://code.jquery.com/ui/1.8.18/themes/base/jquery-ui.css" type="text/css" />  
<script type="text/javascript" src="https://code.jquery.com/jquery-3.2.0.min.js" ></script>
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>  
<script src="http://code.jquery.com/ui/1.8.18/jquery-ui.min.js"></script>

<script type="text/javascript" src="/resources/js/rvView.js"></script>

<title>페스티켓</title>
</head>
<body>

<%
	int loginOk = Integer.parseInt((request.getAttribute("loginOk")).toString());
%>
<input type="hidden" id="login-ok" value="<%= loginOk %>">

	<!-- 헤더 -->
	<%@ include file="include/header.jsp" %>
	<!-- 헤더 끝-->
	
	<div class="container" style="margin-top: 30px">
	<div class="container" id="rvView_page_form">
			<div class="container" id="rev_detail_container_1">
				<img src="${event.main_img }" class="img-thumbnail" alt="포스터"><br>
				<button type="button" class="btn rounded-pill btn-light" id="like_btn" onclick="likeButtonClicked()">
				  <span class="badge text-bg-danger">♥</span>&nbsp;&nbsp;좋아요
				</button>
			</div>
		<div class="container" id="rev_detail_container_2">
		<!-- method 설정 필요 -->
			<form action="confirmRev" name="confirm">
				<div class="eventTitle">${event.title }</div>
				<div class="detailTitle">
					<div id="details_1">장소: </div><div>${event.place }</div>
					<div id="details">공연기간: </div><div>${event.eventDate }</div>
					<div id="details">관람연령: </div><div>${event.use_trgt }</div>
					<div id="details_1">가격: </div><div>
					<c:set var="eventPrice" value="${event.eventPrice}" />
						<c:if test="${empty eventPrice}">
						    <c:set var="eventPrice" value="무료" />
						</c:if>
						${eventPrice}
					</div>
				</div>
				<div class="cal">
				<!-- 따로 js 파일로 뺄 수 있는지 -->
					<script type="text/javascript"> 
	                    $(function(){ 
	                    	var dateRange = "${event.eventDate}".split("~");
	                    	var start_date = dateRange[0]; // "2023-06-28"
	                    	var end_date = dateRange[1]; // "2023-07-09"
	                    	
	                    	var year_start = parseInt(start_date.substring(0, 4), 10);
	                        var month_start = parseInt(start_date.substring(5, 7), 10) - 1;
	                        var day_start = parseInt(start_date.substring(8, 10), 10); 
	                    	var minDate = new Date(year_start, month_start, day_start);
	                    	
	                    	var year_end = parseInt(end_date.substring(0, 4), 10);
	                    	var month_end = parseInt(end_date.substring(5, 7), 10) - 1;
	                    	var day_end = parseInt(end_date.substring(8, 10), 10);
	                    	var maxDate = new Date(year_end, month_end, day_end);
	                        
	                    	$("#datepicker").datepicker({ 
	                            changeMonth: true, 
	                            changeYear: true, 
	                            nextText: '다음 달',
	                            prevText: '이전 달', 
	                            dayNames: ['일요일', '월요일', '화요일', '수요일', '목요일', '금요일', '토요일'],
	                            dayNamesMin: ['일', '월', '화', '수', '목', '금', '토'], 
	                            monthNamesShort: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'],
	                            monthNames: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'],
	                            dateFormat: "yy-mm-dd",
	                            showButtonPanel: true, 
	                            yearRange: "c-99:c+99", 
	                            minDate: minDate,
	                            maxDate: maxDate,
	                            autoclose: false,
	                            onSelect: function(dateText, inst) {
	                                var date = $.datepicker.formatDate("yy-mm-dd", $("#datepicker").datepicker("getDate"));
	                                alert(date);
	                                $("#selectedDate").val(date);
	                              }
	                        }); 
	                    }); 
	                </script> 
	                <div style="width:110px;" id="datepicker"></div>
	                <!-- 값 표시 안됨 -->
				</div>
				<div>티켓매수(최대 5매 선택가능)</div>
				<div>
					<select class="form-select form-select-sm" name="ticketCount" style="width: 70%;">
						<option value="1" selected="selected">1</option>
						<option value="2">2</option>
						<option value="3">3</option>
						<option value="3">4</option>
						<option value="3">5</option>
					</select>
				</div>
				<script>
				  var ticketCountSelect = document.getElementById("ticketCount");
				  var selectedTicketCountInput = document.getElementById("selectedTicketCount");
				
				  ticketCountSelect.addEventListener("change", function() {
				    selectedTicketCountInput.value = ticketCountSelect.value;
				  });
				</script>
				<!-- js로 디테일 포함 알림창 띄운다음 확인 누르면 confirmRev로 넘어감 -->
				<input type="hidden" name="selectedDate" id="selectedDate" value="">
				<input type="hidden" name="selectedEventNum" id="selectedEventNum" value="${event.eventNum }">
				<input type="hidden" name="eventPrice" id="eventPrice" value="${eventPrice }">
				<!-- 로그인시에만 예매가능 -->
				<input type="submit" value="예매하기" onclick="return confirmRev(event)">
			</form>
		</div>
	<!-- 예매 영역 끝 -->
		
		<!-- 리뷰 시작 -->
<div class="container" id="reviewContainer">
  <table class="table table-hover">
    <thead>
      <tr>
        <th scope="col" style="font-size: 16px">평점</th>
        <th scope="col" colspan="4" style="font-size: 16px">리뷰</th>
      </tr>
    </thead>
    <tbody class="table-group-divider" id="reviewTableBody">
      <c:choose>
        <c:when test="${not empty reviewList}">
          <c:forEach items="${reviewList}" var="review">
            <tr class="reviewRow" id="reviewRow" style="display: none;">
              <td id="tb_num1">${review.rw_rating}/5</td>
              <th id="tb_num2">
                <c:choose>
                  <c:when test="${fn:length(review.rw_content) gt 22}">
                    ${fn:substring(review.rw_content, 0, 21)}...
                  </c:when>
                  <c:otherwise>
                    ${review.rw_content}
                  </c:otherwise>
                </c:choose>
              </th>
              <td id="tb_num3">${review.rw_userId}</td>
              <td id="tb_num3">${review.rw_date}</td>
              <td id="tb_num3">
                <button type="button" class="btn btn-sm btn-light rounded-pill" id="btn_like" onclick="reviewLikeClicked(this)">
                  <span class="badge text-bg-danger">♥</span>&nbsp;&nbsp;좋아요
                </button>
              </td>
              <!-- 본인이면 수정버튼 추가 -->
            </tr>
          </c:forEach>

          <!-- 더보기 버튼 표시 -->
          <tr id="showMoreRow">
            <td colspan="5">
              <div id="showMoreButtonWrapper">
                <h6 onclick="showMoreReviews()" id="showMoreButton">
                  더보기 <i class="bi bi-caret-down-fill"></i>
                </h6>
              </div>
            </td>
          </tr>
        </c:when>
        <c:otherwise>
          <tr>
            <td colspan="5">등록된 리뷰가 존재하지 않습니다.</td>
          </tr>
        </c:otherwise>
      </c:choose>
    </tbody>
  </table>
		<!-- 리뷰 끝 -->
		
<!-- Q&A 시작 -->
	<table class="table table-hover">
	  <thead>
	    <tr>
	      <th scope="col" colspan="4" style="font-size: 16px">Q<c:out value="&"></c:out>A</th>
	    </tr>
	  </thead>
	  <tbody class="table-group-divider">
	  <c:choose>
	  		<c:when test="${not empty QA_List }">
			  <c:forEach items="${QA_List }" var="QA" begin="0" end="5">
			    <tr>
			      <td id="tb_num1">${QA.q_idx }</td>
			      <th id="tb_num2">
				      <div style="cursor:pointer;" onclick="script:window.location.href='qaView?selectedQA=${QA.q_idx }'">
					      <c:choose>	
					      	<c:when test="${fn:length(QA.q_title) gt 22 }">
					      		${fn:substring(QA.q_title, 0, 21) }...
					      	</c:when>
					      	<c:otherwise>
					      		${QA.q_title }
					      	</c:otherwise>
					      </c:choose>
					  </div>
			      </th>
			      <td id="tb_num3">${QA.q_userId }</td>
			      <td id="tb_num3">${QA.q_writeDate }</td>
			      <td id="tb_num3" style="text-align: center;">${QA.q_hit }</td>
			    </tr>
			  </c:forEach>
		  	</c:when>
			<c:otherwise>
				<tr>
					<td colspan="5">등록된 Q&A가 존재하지 않습니다.</td>
				</tr>
			</c:otherwise>
		</c:choose>
	  </tbody>
	</table>
	<input type="button" value="QA 목록" id="moreQAbtn" onclick="script:window.location.href='qaBoardList?eventNum=${event.eventNum}'">
<%
	if(loginOk == 1) {
%>
	<input type="button" value="문의하기" onclick="script:window.location.href='qaBoardWrite?eventNum=${event.eventNum}'">
<%
	}
%>
</div>
<!-- Q&A 끝 -->
	</div>
</div>
	
	<!-- 푸터 -->
	<%@ include file="include/footer.jsp" %>
	<!-- 푸터 끝 -->

</body>
</html>