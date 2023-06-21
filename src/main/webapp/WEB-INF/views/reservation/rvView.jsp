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
	<!-- 헤더 -->
	<%@ include file="../include/header.jsp" %>
	<!-- 헤더 끝-->
	
	<div class="container" style="margin-top: 30px">
	<div class="container" id="rvView_page_form">
			<div class="container" id="rev_detail_container_1">
					<c:choose>
	  					<c:when test="${event.main_img.startsWith('http')}">
				      		<img src="${event.main_img }" class="img-thumbnail" alt="포스터"><br>
				    </c:when>
					  <c:otherwise>
							<img src="/resources/upload_main_img/${event.main_img.substring(event.main_img.indexOf('upload_main_img/') + 'upload_main_img/'.length())}"
								 class="img-thumbnail" alt="포스터"><br>
					  </c:otherwise>
					</c:choose>
				<button type="button" class="btn rounded-pill btn-light" id="event_like" onclick="eventLikeClicked(${event.eventNum})">
				  <span class="badge text-bg-danger">♥</span>&nbsp;&nbsp;좋아요
				</button>
			</div>
		<div class="container" id="rev_detail_container_2">
		<!-- method 설정 필요 -->
			<form action="confirmRev" name="confirm">
				<div class="eventTitle">${event.title }</div>
					<div style="margin-top: 10px;">
						<div id="details_1">장소: </div><div id="eventDetails">${event.place }</div>
					</div>
					<div id="details">공연기간: </div><div id="eventDetails">${event.eventDate }</div>
					<div id="details">관람연령: </div><div id="eventDetails">${event.use_trgt }</div>
					<div id="details_1">가격: </div><div id="eventDetails">
					<c:set var="eventPrice" value="${event.eventPrice}" />
						<c:if test="${empty eventPrice}">
						    <c:set var="eventPrice" value="무료" />
						</c:if>
						${eventPrice}
					</div>
				<div class="cal">
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
                               minDate: new Date(),
                               maxDate: maxDate,
                               autoclose: false,
                               defaultDate: new Date(),
                               onSelect: function(dateText, inst) {
                                   var date = $.datepicker.formatDate("yy-mm-dd", $("#datepicker").datepicker("getDate"));
                                   alert(date);
                                   $("#selectedDate").val(date);
                                 }
                           }); 
                       }); 
                   </script> 
	                <div style="width:110px;" id="datepicker"></div>
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
				<c:choose>
				      <c:when test="${sessionId eq 'admin'}">
				      	<input type="button" value="수정하기" id="adminBtn" onclick="script:window.location.href='adminModify?selectedEvent=${event.eventNum }'">
				      </c:when>
				      <c:otherwise>
				      	<input type="submit" value="예매하기" onclick="confirmRev(event)">
				      </c:otherwise>
			      </c:choose>
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
	              <div style="cursor:pointer;" onclick="script:window.location.href='reviewView?rw_idx=${review.rw_idx}'">
	                <c:choose>
	                  <c:when test="${fn:length(review.rw_content) gt 25}">
	                    ${fn:substring(review.rw_content, 0, 24)}...
	                  </c:when>
	                  <c:otherwise>
	                    ${review.rw_content}
	                  </c:otherwise>
	                </c:choose>
	              </div>
              </th>
              <td id="tb_num3">${review.rw_userId}</td>
              <td id="tb_num3">${review.rw_date}</td>
              <td id="tb_num3">
                <button type="button" class="btn btn-sm btn-light rounded-pill review_like" id="likeButton_${review.rw_idx}" onclick="reviewLikeClicked(${event.eventNum}, ${review.rw_idx})">
                  <span class="badge text-bg-danger">♥</span>&nbsp;&nbsp;좋아요
                </button>
              </td>
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
					      <c:if test="${QA.q_replyCount != 0 }">
			            	<span class="badge">${QA.q_replyCount }</span>
			            </c:if>
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
	<input type="button" value="Q&A 목록" id="moreQAbtn" onclick="script:window.location.href='qaBoardList?eventNum=${event.eventNum}'">
	<c:if test="${sessionId != null && sessionId ne 'admin'}">
		<input type="button" value="문의하기" id="inquiry" onclick="script:window.location.href='qaBoardWrite?eventNum=${event.eventNum}'">
	</c:if>
</div>
<!-- Q&A 끝 -->
	</div>
</div>
	
	<!-- 푸터 -->
	<%@ include file="../include/footer.jsp" %>
	<!-- 푸터 끝 -->

<script type="text/javascript">

	// 세션 아이디 가져오기
	var sessionId = '<%=(String)session.getAttribute("sessionId") %>';
	
// 로그인 확인
function confirmRev() {
	event.preventDefault();
	
	if (sessionId === "null") {
		window.location.href="login";
    } else {
		var selectedDate = $("#selectedDate").val();
	  
	  	if (selectedDate === "") {
		  alert("날짜를 선택해주세요.");
		  return false;
		}
		
		var confirmed = confirm("예약을 진행하시겠습니까?");
	
	    if (!confirmed) {
	    	return false;
		}
	    document.confirm.submit();
    }
}

//********** 이벤트 좋아요 *************
// 이벤트 좋아요 확인은 리뷰 좋아요의 checkInitialLikeStatus에서 같이 확인
var isEventLiked;

// 이벤트 좋아요 버튼을 클릭하는 함수
function eventLikeClicked(eventNum) {
    var eventLikeButton = document.getElementById("event_like");
    console.log(isEventLiked)
    if (sessionId != "null") {
        if (isEventLiked) {
            // 이벤트 좋아요 취소
            sendEventUnlikeRequest(eventNum, isEventLiked);
            setUnlikedEventButtonStyle();
            isEventLiked = false;
        } else {
            // 이벤트 좋아요 요청
            sendEventLikeRequest(eventNum, isEventLiked);
            setLikedEventButtonStyle();
            isEventLiked = true;
        }
    } else {
        alert("로그인이 필요합니다.");
        return false;
    }
}

// 이벤트 좋아요 요청을 보내는 함수
function sendEventLikeRequest(eventNum, isEventLiked) {
    $.ajax({
        url: "eventLike", // 이벤트 좋아요 요청을 처리하는 URL을 입력하세요.
        type: "POST",
        data: { selectedEvent: eventNum, isEventLiked: isEventLiked },
        success: function(response) {
            // 요청 성공 시의 동작 처리
            console.log("이벤트 좋아요 요청이 성공하였습니다.");
            // 추가적인 동작 처리
        },
        error: function(xhr, status, error) {
            // 요청 실패 시의 동작 처리
            console.log("이벤트 좋아요 요청이 실패하였습니다. 오류: " + error);
        }
    });
}

// 이벤트 좋아요 취소 요청을 보내는 함수
function sendEventUnlikeRequest(eventNum, isEventLiked) {
    $.ajax({
        url: "eventUnlike", // 이벤트 좋아요 취소 요청을 처리하는 URL을 입력하세요.
        type: "POST",
        data: { selectedEvent: eventNum, isEventLiked: isEventLiked },
        success: function(response) {
            // 취소 요청 성공 시의 동작 처리
            console.log("이벤트 좋아요가 취소되었습니다.");
            // 추가적인 동작 처리
        },
        error: function(xhr, status, error) {
            // 취소 요청 실패 시의 동작 처리
            console.log("이벤트 좋아요 취소 요청이 실패하였습니다. 오류: " + error);
        }
    });
}

// 이벤트 좋아요 상태에 따라 버튼 스타일을 변경하는 함수
function setLikedEventButtonStyle() {
    var eventLikeButton = document.getElementById("event_like");
    eventLikeButton.classList.add("bg-dark");
    eventLikeButton.classList.remove("btn-light");
    eventLikeButton.classList.add("text-white");
    eventLikeButton.classList.remove("text-bg-danger");
}

function setUnlikedEventButtonStyle() {
    var eventLikeButton = document.getElementById("event_like");
    eventLikeButton.classList.remove("bg-dark");
    eventLikeButton.classList.add("btn-light");
    eventLikeButton.classList.remove("text-white");
    eventLikeButton.classList.remove("text-bg-danger");
}

// ********** 이벤트 좋아요 끝 *************

// ********** 리뷰 좋아요 *************
var eventNum; // 전역 변수로 선언

$(document).ready(function() {
	var eventNum = '<%=(int)session.getAttribute("eventNum") %>'; // 서버에서 전달된 eventNum 값을 가져옴
	
	// 페이지 로드 시 초기 좋아요 상태를 확인
	if (sessionId != null && sessionId !== "null") {
	    // 로그인 상태인 경우에만 초기 좋아요 상태를 확인
	    checkInitialLikeStatus(eventNum);
	}
});

	var isLiked = false; // 좋아요 상태를 나타내는 변수
	var reviewIdxList = []; // 좋아요 배열
	var reviewLikes = {}; // reviewNum과 isLiked 값을 저장할 객체 (전역 변수)

// 페이지 로드 시 초기 좋아요 상태를 확인하고 버튼 색상을 설정하는 함수
function checkInitialLikeStatus(eventNum) {
    // 서버에 AJAX 요청을 보내서 좋아요 상태를 확인하는 코드
    
    // 행사 좋아요 상태 확인
    $.ajax({
        url: "eventLikeStatus", // 좋아요 상태를 확인하는 URL을 입력하세요.
        type: "POST",
        data: { sessionId: sessionId, selectedEvent: eventNum },
        success: function(response) {
            isEventLiked = response;
            console.log("isEventLiked: " + isEventLiked);
            
            if (isEventLiked) {
                console.log("liked");
                setLikedEventButtonStyle(eventNum);
            } else {
                console.log("unliked");
                setUnlikedEventButtonStyle(eventNum);
            }
        },
        error: function(xhr, status, error) {
        	console.log(isEventLiked);
            console.log("좋아요 상태 확인 요청이 실패하였습니다. 오류: " + error);
        }
    });
    
	// 리뷰 좋아요 상태 확인
	$.ajax({
	    url: "reviewLikeStatus",
	    type: "POST",
	    data: { sessionId: sessionId, selectedEvent: eventNum },
	    success: function(response) {
	        var likedReviewList = JSON.parse(response);
	        
	        // likedReviewList 타입 확인 후 null값 확인
	        console.log(likedReviewList);
	        
	        if (Object.keys(likedReviewList).length == 0) {
                console.log("likedReviewList 값이 null입니다. 함수를 종료합니다.");
                return ;
            }
	        
	        <c:forEach items="${reviewList}" var="review">
		    	reviewIdxList.push(${review.rw_idx});
	        </c:forEach>
	        
	        likedReviewList.forEach(function(review) {
	            if (reviewIdxList.includes(review.reviewIdx)) {
	                setLikedButtonStyle(review.reviewIdx);
	                reviewLikes[review.reviewIdx] = true; // 해당 reviewIdx를 true로 설정
	            } else {
	                setUnlikedButtonStyle(review.reviewIdx);
	                reviewLikes[review.reviewIdx] = false; // 해당 reviewIdx를 false로 설정
	            }
	        }); // forEach 블록 종료
	    },
	    error: function(xhr, status, error) {
	        console.log("좋아요 상태 확인 요청이 실패하였습니다. 오류: " + error);
	    }
	});
}

// 좋아요 버튼을 클릭하는 함수
function reviewLikeClicked(eventNum, reviewNum) {
    var likeButton = document.getElementById("likeButton_" + reviewNum);
    console.log(likeButton);
    var isLiked = false;
    
    if(sessionId != "null") {
    	if (reviewLikes[reviewNum] === true) {
            // 좋아요 취소
            sendUnlikeRequest(eventNum, reviewNum, false);
            setUnlikedButtonStyle(reviewNum);
            reviewLikes[reviewNum] = false; // 해당 reviewNum을 false로 설정
        } else {
            // 좋아요 요청
            sendLikeRequest(eventNum, reviewNum, true);
            setLikedButtonStyle(reviewNum);
            reviewLikes[reviewNum] = true; // 해당 reviewNum을 true로 설정
        }
    } else {
    	alert("로그인이 필요합니다.");
    	return false;
    }
}

// 좋아요 요청을 보내는 함수
function sendLikeRequest(eventNum, reviewNum, isLiked) {
    $.ajax({
        url: "reviewLike", // 좋아요 요청을 처리하는 URL을 입력하세요.
        type: "POST",
        data: {selectedEvent: eventNum, reviewNum: reviewNum, isLiked: isLiked },
        success: function(response) {
            // 요청 성공 시의 동작 처리
            console.log("좋아요 요청이 성공하였습니다.");
            // 추가적인 동작 처리
        },
        error: function(xhr, status, error) {
        	console.log(eventNum);
            // 요청 실패 시의 동작 처리
            console.log("좋아요 요청이 실패하였습니다. 오류: " + error);
        }
    });
}

//좋아요 취소 요청을 보내는 함수
function sendUnlikeRequest(eventNum, reviewNum, isLiked) {
    $.ajax({
        url: "reviewUnlike", // 취소 요청을 처리하는 URL을 입력하세요.
        type: "POST",
        data: {selectedEvent: eventNum, reviewNum: reviewNum, isLiked: isLiked },
        success: function(response) {
            // 취소 요청 성공 시의 동작 처리
            console.log("좋아요가 취소되었습니다.");
            // 추가적인 동작 처리
        },
        error: function(xhr, status, error) {
            // 취소 요청 실패 시의 동작 처리
            console.log("좋아요 취소 요청이 실패하였습니다. 오류: " + error);
        }
    });
}

// 좋아요 상태에 따라 버튼 스타일을 변경하는 함수
function setLikedButtonStyle(reviewIdx) {
    var likeButton = document.getElementById("likeButton_" + reviewIdx);
    likeButton.classList.add("bg-dark");
    likeButton.classList.remove("btn-light");
    likeButton.classList.add("text-white");
    likeButton.classList.remove("text-bg-danger");
}

function setUnlikedButtonStyle(reviewIdx) {
    var likeButton = document.getElementById("likeButton_" + reviewIdx);
    likeButton.classList.remove("bg-dark");
    likeButton.classList.add("btn-light");
    likeButton.classList.remove("text-white");
    likeButton.classList.remove("text-bg-danger");
}

//********** 리뷰 좋아요 끝 *************

</script>

</body>
</html>