<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" type="text/css" href="/resources/css/bootstrap.min.css">
<link rel="stylesheet" type="text/css" href="/resources/css/rvView.css">
<script src="/resources/js/bootstrap.min.js"></script>

<!-- jquery -->
<link rel="stylesheet" href="http://code.jquery.com/ui/1.8.18/themes/base/jquery-ui.css" type="text/css" />  
<script type="text/javascript" src="https://code.jquery.com/jquery-3.2.0.min.js" ></script>
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>  
<script src="http://code.jquery.com/ui/1.8.18/jquery-ui.min.js"></script>

<title>페스티켓</title>
</head>
<body>
	<!-- 헤더 -->
	<%@ include file="include/header.jsp" %>
	<!-- 헤더 끝-->
	
	<!-- 예매 영역 -->
	<div class="container">
	<div class="container" id="rvView_page_form">
			<div class="container" id="rev_detail_container_1">
					<img src="${event.main_img }" class="img-thumbnail" alt="포스터"><br>
				<button type="button" class="btn rounded-pill btn-light">
				  <span class="badge text-bg-danger">♥</span>&nbsp;&nbsp;좋아요
				</button>
			</div>
		<form action="">
			<div class="container" id="rev_detail_container_2">
				<div class="eventTitle">${event.title }</div>
				<div class="detailTitle">
					<div id="details_1">장소: </div><div>${event.place }</div>
					<div id="details">공연기간: </div><div>${event.eventDate }</div>
					<div id="details">관람연령: </div><div>${event.use_trgt }</div>
					<div id="details_1">가격: </div><div>
					<c:choose>
					  	<c:when test="${event.eventPrice == null}">무료</c:when>
					  	<c:otherwise>${event.eventPrice }</c:otherwise>
				  	</c:choose>
					</div>
				</div>
				<div class="cal">
					<script type="text/javascript"> 
	                    $(function(){ 
	                    	var end_date = "${event.end_date }";
	                    	var year = parseInt(end_date.substring(0, 4), 10);
	                        var month = parseInt(end_date.substring(5, 7), 10) - 1;
	                        var day = parseInt(end_date.substring(8, 10), 10); 
	                    	var maxDate = new Date(year, month, day);
	                        $("#datepicker_from, #datepicker_to").datepicker({ 
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
	                            minDate: 0,
	                            maxDate: maxDate
	                        }); 
	                        $("#datepicker_from").focus(); 
	                    }); 
	                </script> 
	                <div style="width:110px;" id="datepicker_from"></div>
				</div>
				<div>티켓매수</div>
				<div>
					<select class="form-select form-select-sm" name="ticketCount" style="width: 70%;">
						<option value="1" selected="selected">1</option>
						<option value="2">2</option>
						<option value="3">3</option>
						<option value="3">4</option>
						<option value="3">5</option>
					</select>
				</div>
				<input type="submit" value="예매하기">
			</div>
		</form>
	<!-- 예매 영역 끝 -->
		
		<!-- 리뷰, Q&A 시작 -->
		<div class="container">
			<table class="table table-hover" id="adminListTable">
			  <thead style="background-color: #eeeeee">
			    <tr>
			      <th scope="col" colspan="3">리뷰</th>
			    </tr>
			  </thead>
			  <tbody class="table-group-divider">
				  <c:forEach items="${reviewList }" var="reviewList"  begin="0" end="5">
				    <tr>
				      <th>${reviewList.rw_content }</th>
				      <td>${reviewList.rw_userId }</td>
				      <td>${reviewList.rw_date }</td>
				      <td>${reviewList.rw_rating }</td>
				    </tr>
				  </c:forEach>
			  </tbody>
			</table>
		</div>
		
		<!-- 리뷰, Q&A 끝 -->
	</div>
	</div>
	
	
	<!-- 푸터 -->
	<%@ include file="include/footer.jsp" %>
	<!-- 푸터 끝 -->
</body>
</html>