<%@page import="com.festicket.dto.EventDto"%>
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
	<script type="text/javascript" src="/resources/js/addEvent.js"></script>
	
<!-- jquery -->
<link rel="stylesheet" href="http://code.jquery.com/ui/1.8.18/themes/base/jquery-ui.css" type="text/css" />  
<script type="text/javascript" src="https://code.jquery.com/jquery-3.2.0.min.js" ></script>
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>  
<script src="http://code.jquery.com/ui/1.8.18/jquery-ui.min.js"></script>

</head>
<body style="background-color: #eeeeee;">

<%
	int adminCheck = Integer.parseInt((request.getAttribute("adminCheck")).toString());
	EventDto event = (EventDto)request.getAttribute("event");

	if(adminCheck == 0) {
%>
	<script>
		alert("권한이 없는 페이지 입니다.");
		history.back();
	</script>
<%
	}
%>

<!-- 헤더 -->
	<%@ include file="../include/header.jsp" %>
<!-- 헤더 끝 -->

<div class="container">
	<div class="container_1" >
	<div class="container_2" >
		<h2 class="adminTitle">관리자 페이지</h2>
			<form action="adminEventUpdate" method="post" id="detail_frm" name="detail_frm">
			<input type="hidden" name="selectedEvent" value="${event.eventNum }">
		<!-- 행사 디테일 폼 입력 -->
				<div id="event_type_error" class="error"></div>
				<div class="input-group mb-3">
				  <label class="input-group-text" for="inputGroupSelect01">행사분류*</label>
				  <select class="form-select" id="inputGroupSelect01" name="inputGroupSelect01">
				    <option>Choose...</option>
				    <option value="1"
				    	<%
				    		if(event.getType().equals("페스티벌")) {
				    	%>
				    		selected
				    	<%
				    		}
				    	%>
				    	>페스티벌</option>
				    <option value="2"
				    	<%
				    		if(event.getType().equals("전시")) {
				    	%>
				    		selected
				    	<%
				    		}
				    	%>
				    	>전시</option>
				  </select>
				</div>
				
				<div id="title_error" class="error"></div>
				<div class="input-group">
					<span class="input-group-text" id="basic-addon1">행사명*</span>
	  				<input type="text" name="title" id="title" value="${event.title}" class="form-control" aria-describedby="basic-addon1">
				</div>
				
				<div id="start_date_error" class="error"></div>
				<div id="end_date_error" class="error"></div>
				<div id="rgstDate_error" class="error"></div>
				
				<div class="input-group mb-3" id="dateInput">
					<span class="input-group-text" id="basic-addon1">시작일*</span>
	  				<input type="date" id="datepicker_1" name="start_date" value="${event.start_date}" class="form-control" aria-describedby="basic-addon1">
				</div>
				
				<div class="input-group mb-3" id="dateInput">
					<span class="input-group-text" id="basic-addon1">종료일*</span>
	  				<input type="date" id="datepicker_2" name="end_date" value="${event.end_date}" class="form-control" aria-describedby="basic-addon1">
				</div>
				
				<div class="input-group mb-3" id="dateInput">
					<span class="input-group-text" id="basic-addon1">신청일*</span>
	  				<input type="date" id="datepicker_3" name="rgstDate" value="${event.rgstDate}" class="form-control" aria-describedby="basic-addon1">
				</div>
					
				<div id="gunName_error" class="error"></div>
				<div class="input-group mb-3">
					<span class="input-group-text" id="basic-addon1">자치구*</span>
	  				<textarea class="form-control" name="gunName" aria-label="With textarea">${event.gunName}</textarea>
				</div>
					
				<div id="place_error" class="error"></div>
				<div class="input-group mb-3">
					<span class="input-group-text" id="basic-addon1">장소*</span>
	  				<textarea class="form-control" name="place" aria-label="With textarea">${event.place}</textarea>
				</div>
			
				<div class="input-group mb-3">
				  <span class="input-group-text" id="basic-addon1">기관명</span>
				  <input type="text" class="form-control" name="org_name" value="${event.org_name}" aria-describedby="basic-addon1">
				</div>
				
				<div class="input-group mb-3">
				  <span class="input-group-text" id="basic-addon1">이용대상</span>
				  <input type="text" class="form-control" name="use_trgt" value="${event.use_trgt}" aria-describedby="basic-addon1">
				</div>
				
				<div class="input-group mb-3">
				  <span class="input-group-text" id="basic-addon1">출연자정보</span>
				  <input type="text" class="form-control" name="player" value="${event.player}" aria-describedby="basic-addon1">
				</div>
				
				<div id="org_link_error" class="error"></div>
				<div class="input-group mb-3">
					<span class="input-group-text" id="basic-addon1">홈페이지 주소*</span>
	  				<textarea class="form-control" name="org_link" placeholder="URL" aria-label="With textarea">${event.org_link}</textarea>
				</div>
				
				<div class="input-group mb-3">
				  <span class="input-group-text" id="basic-addon1">이용요금</span>
				  <input type="text" class="form-control" name="eventPrice" value="${event.eventPrice}" aria-describedby="basic-addon1">
				</div>
				
				<div id="ticketCount_error" class="error"></div>
				<div class="input-group mb-3">
				  <span class="input-group-text" id="basic-addon1">총 티켓 매수*</span>
				  <input type="text" class="form-control" name="ticketCount" value="${event.ticketCount}" aria-describedby="basic-addon1">
				</div>
				
				<div id="main_img_error" class="error"></div>
				<div class="input-group mb-3">
				  <span class="input-group-text" id="basic-addon1">대표 이미지*</span>
				  <input type="file" class="form-control" name="main_img" value="${event.main_img}" aria-describedby="button-addon2">
				</div>
				
				<div class="form-floating">
				  <textarea class="form-control" name="program" id="floatingTextarea2" style="height: 300px">${event.program}</textarea>
				  <label for="floatingTextarea2">프로그램 소개</label>
				</div>
				
				<div style="float: right">
					<input type="submit" class="btn" value="수정"  onclick="return checkVal();">
					<input type="button" class="btn" onclick="script:window.location.href='adminList'" value="취소">
				</div>
				
		<!-- 행사 디테일 폼 입력 끝 -->
			</form>
			
		</div>
	</div>
</div>

<!-- 푸터 -->
	<%@ include file="../include/footer.jsp" %>
<!-- 푸터 끝 -->


</body>
</html>