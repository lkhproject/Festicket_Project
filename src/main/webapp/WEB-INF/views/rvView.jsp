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
	
	<div class="container" style="margin-top: 30px">
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
	                    	var start_date = "${event.eventDate }";
	                    	var year_start = parseInt(start_date.substring(0, 4), 10);
	                        var month_start = parseInt(start_date.substring(5, 7), 10) - 1;
	                        var day_start = parseInt(start_date.substring(8, 10), 10); 
	                    	var minDate = new Date(year_start, month_start, day_start);
	                    	
	                    	var end_date = "${event.end_date }";
	                    	var year_end = parseInt(end_date.substring(0, 4), 10);
	                        var month_end = parseInt(end_date.substring(5, 7), 10) - 1;
	                        var day_end = parseInt(end_date.substring(8, 10), 10); 
	                    	var maxDate = new Date(year_end, month_end, day_end);
	                        
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
	                            minDate: minDate,
	                            maxDate: maxDate
	                        }); 
	                        $("#datepicker_from").focus(); 
	                    }); 
	                </script> 
	                <div style="width:110px;" id="datepicker_from"></div>
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
				<input type="submit" value="예매하기" onclick="">
			</div>
		</form>
	<!-- 예매 영역 끝 -->
		
		<div class="container" id="reviewContainer">
		<!-- 리뷰 시작 -->
			<table class="table table-hover">
			  <thead>
			    <tr>
			      <th scope="col" style="font-size: 16px">평점</th>
			      <th scope="col" colspan="4" style="font-size: 16px">리뷰</th>
			    </tr>
			  </thead>
			  <tbody class="table-group-divider">
				  <c:forEach items="${reviewList }" var="reviewList"  begin="0" end="5">
				    <tr>
				      <td id="tb_num1">${reviewList.rw_rating }</td>
				      <th style="text-align: left; width: 30%">${reviewList.rw_content }</th>
				      <td id="tb_right3">${reviewList.rw_userId }</td>
				      <td id="tb_right3">${reviewList.rw_date }</td>
				      <td id="tb_right3">
				      	<button type="button" class="btn btn-sm btn-light rounded-pill" id="btn_like">
				  			<span class="badge text-bg-danger">♥</span>&nbsp;&nbsp;좋아요
						</button>
					  </td>
				      <!-- 본인이면 수정버튼 추가 -->
				    </tr>
				  </c:forEach>
			  </tbody>
			</table>
		
		<!-- 리뷰 끝 -->
		
		<!-- Q&A 시작 -->
			<table class="table table-hover">
			  <thead>
			    <tr>
			      <th scope="col" colspan="4" style="font-size: 16px">Q&A</th>
			    </tr>
			  </thead>
			  <tbody class="table-group-divider">
				  <c:forEach items="${QA_List }" var="QA_List"  begin="0" end="5">
				    <tr>
				      <td id="tb_num1">${QA_List.q_idx }</td>
				      <th style="text-align: left; width: 40%">${QA_List.q_title }</th>
				      <td id="tb_qaMiddle2">${QA_List.q_userId }</td>
				      <td id="tb_qaMiddle2">${QA_List.q_writeDate }</td>
				      <td style="text-align: center;  width: 10%">${QA_List.q_hit }</td>
				    </tr>
				  </c:forEach>
			  </tbody>
			</table>
			</div>
		<!-- Q&A 끝 -->
	</div>
	</div>
	
	
	<!-- 푸터 -->
	<%@ include file="include/footer.jsp" %>
	<!-- 푸터 끝 -->
</body>
</html>