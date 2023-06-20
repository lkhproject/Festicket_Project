<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" type="text/css" href="/resources/css/bootstrap.min.css">
<link rel="stylesheet" type="text/css" href="/resources/css/confirmRev.css">
<script src="/resources/js/bootstrap.min.js"></script>

<title>페스티켓</title>
</head>
<body>
	<!-- 헤더 -->
	<%@ include file="../include/header.jsp" %>
	<!-- 헤더 끝-->
	
<div class="container" style="margin-top: 30px">
	<div id="wrapper">
	<div id="child">
		<div class="confirmed"><h4><b>예매 상세</b></h4></div>
		<div class="card mb-3" id="ticket">
		  <div class="row g-0">
		    <div class="col-md-4">
		      	<c:choose>
  					<c:when test="${details.main_img.startsWith('http')}">
			      		<img src="${details.main_img }" class="img-fluid rounded-start" alt="${details.title }">
			    </c:when>
				  <c:otherwise>
						<img src="/resources/upload_main_img/${details.main_img.substring(details.main_img.indexOf('upload_main_img/') + 'upload_main_img/'.length())}"
							  class="img-fluid rounded-start" alt="${details.title }">
				  </c:otherwise>
				</c:choose>
		    </div>
		    <div class="col-md-8">
		      <div class="card-body" style="text-align: left;">
		        <h5 class="card-title">${details.title }</h5>
		        <p class="card-text">${details.gunName } / ${details.place }</p>
		        <p class="card-text" id="ticketDetails"><small class="text-muted">티켓번호 : ${details.re_idx }</small></p>
		        <p class="card-text" id="ticketDetails"><small class="text-muted">발권일자 : ${details.re_date }</small></p>
		        <p class="card-text" id="ticketDetails"><small class="text-muted">예약일자 : ${details.re_ticketDate }</small></p>
		        <p class="card-text" id="ticketDetails"><small class="text-muted">${details.re_userId } 님,</small></p>
		        <p class="card-text" id="ticketDetails"><small class="text-muted">티켓수 : ${details.re_ticketCount }</small></p>
		        <p class="card-text" id="ticketDetails"><small class="text-muted">가격 : ${details.re_price }</small></p>
		      </div>
		    </div>
		  </div>
		</div>
	</div>
	<div class="notes2">
       <h6 style="text-decoration: underline;">
           티켓취소 안내
       </h6>
       <div style="text-align: left;">
	       <ol>
	           <li>예매한 티켓 전체 취소, 혹은 신용카드 결제 시 부분 취소가 가능합니다.<br>단, 일부 상품의 경우도 부분취소가 불가합니다.</li>
	           <li>티켓이 배송된 이후에는 인터넷이나 고객센터를 통한 취소가 불가하며, 받으신 티켓을 취소일 전까지 Fasticket 본사로 반송을 해주셔야 취소 가능합니다. (등기우편을 이용해주세요!)</li>
	           <li>예매 당일 자정까지 취소하실 경우는 예매수수료도 환불되며, 취소수수료가 부과되지 않습니다. 그 이후에 취소하실 경우는 예매수수료가 환불되지 않으며, 취소수수료는 정책에 따라 부과됩니다.</li>
	           <li>일부 행사의 경우 상황에 따라 일괄 취소 건이 발생할 수있으며, 일괄 취소 시에는 취소 수수료가 부과되지 않습니다.</li>
	           <li>티켓의 날짜/시간/좌석 등급/좌석 위치 변경은 불가합니다. 자세한 안내가 필요할 경우 고객센터를 이용해주세요.</li>
	           <li>Fasticket 홈페이지에서 예매한 내역은 Fasticket 홈페이지에서만 확인이 가능합니다.</li>
	       </ol>
       </div>
   </div>
		<!-- 마이페이지에 예약목록으로 보내기 -->
		<input type="button" value="예매목록" onclick="script:window.location.href='myPage'" style="margin-left: 3px;">
		<!-- 예약일이 지났을 경우 예매취소 불가 -->
		<c:if test="${details.re_ticketDate >= today}">
			<input type="button" value="예매취소" onclick="return cancelReserve(${details.re_idx}, ${details.re_eventNum })">
		</c:if>
	</div>
	
</div>
	
	
	<!-- 푸터 -->
	<%@ include file="../include/footer.jsp" %>
	<!-- 푸터 끝 -->
	
<script>
	function cancelReserve(re_idx, re_eventNum) {
		var confirmCancel = confirm("정말 취소하시겠습니까?");
		if (confirmCancel) {
			window.location.href = "cancelRev?re_idx=" + re_idx + "&re_eventNum=" + re_eventNum;
		} else {
		  return false;
		}
	}
</script>

</body>
</html>