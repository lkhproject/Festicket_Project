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
	<script src="/resources/js/bootstrap.min.js"></script>
	
<!-- jquery -->
<link rel="stylesheet" href="http://code.jquery.com/ui/1.8.18/themes/base/jquery-ui.css" type="text/css" />  
<script type="text/javascript" src="https://code.jquery.com/jquery-3.2.0.min.js" ></script>
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>  
<script src="http://code.jquery.com/ui/1.8.18/jquery-ui.min.js"></script>

</head>
<body style="background-color: #eeeeee;">
<!-- 헤더 -->
	<%@ include file="include/header.jsp" %>
<!-- 헤더 끝 -->

<!--  -->
<div class="container">
	<div class="container_1" >
	
	<div class="container_2" >
		<h2 class="adminTitle">관리자 페이지</h2>
			<form action="addEventOk" method="post" id="detail_frm" name="detail_frm">
		<!-- 행사 디테일 폼 입력 -->
				<div class="input-group mb-3">
				  <label class="input-group-text" for="inputGroupSelect01">행사분류*</label>
				  <select class="form-select" id="inputGroupSelect01" name="type">
				    <option selected>Choose...</option>
				    <option value="1">페스티벌</option>
				    <option value="2">전시</option>
				  </select>
				</div>
				<div id="event_type_error" class="error"></div>
				
				<div class="input-group mb-3">
					<span class="input-group-text" id="basic-addon1">행사명*</span>
	  				<input type="text" name="title" id="title" class="form-control" aria-describedby="basic-addon1">
				</div>
				<div id="title_error" class="error"></div>
				
				<div class="input-group mb-3" id="dateInput">
					<span class="input-group-text" id="basic-addon1">시작일*</span>
	  				<input type="date" id="datepicker" name="start_date" class="form-control" aria-describedby="basic-addon1">
				</div>
				
				<div class="input-group mb-3" id="dateInput">
					<span class="input-group-text" id="basic-addon1">종료일*</span>
	  				<input type="date" id="datepicker" name="end_date" class="form-control" aria-describedby="basic-addon1">
				</div>
					
				<div class="input-group mb-3">
					<span class="input-group-text" id="basic-addon1">자치구*</span>
	  				<textarea class="form-control" name="gunName" aria-label="With textarea"></textarea>
				</div>
					
				<div class="input-group mb-3">
					<span class="input-group-text" id="basic-addon1">장소*</span>
	  				<textarea class="form-control" name="place" aria-label="With textarea"></textarea>
				</div>
			
				<div class="input-group mb-3">
				  <span class="input-group-text" id="basic-addon1">기관명</span>
				  <input type="text" class="form-control" name="org_name" aria-describedby="basic-addon1">
				</div>
				
				<div class="input-group mb-3">
				  <span class="input-group-text" id="basic-addon1">이용대상</span>
				  <input type="text" class="form-control" name="use_trgt" aria-describedby="basic-addon1">
				</div>
				
				<div class="input-group mb-3">
				  <span class="input-group-text" id="basic-addon1">출연자정보</span>
				  <input type="text" class="form-control" name="player" aria-describedby="basic-addon1">
				</div>
				
				<div class="input-group mb-3">
					<span class="input-group-text" id="basic-addon1">홈페이지 주소*</span>
	  				<textarea class="form-control" name="org_link" placeholder="URL" aria-label="With textarea"></textarea>
				</div>
				
				<div class="input-group mb-3">
				  <span class="input-group-text" id="basic-addon1">이용요금</span>
				  <input type="text" class="form-control" name="eventPrice" aria-describedby="basic-addon1">
				</div>
				
				<div class="input-group mb-3">
				  <span class="input-group-text" id="basic-addon1">총 티켓 매수*</span>
				  <input type="text" class="form-control" name="ticketCount" aria-describedby="basic-addon1">
				</div>
				
				<div class="input-group mb-3">
				  <span class="input-group-text" id="basic-addon1">대표 이미지*</span>
				  <input type="file" class="form-control" name="main_img" aria-describedby="button-addon2">
				</div>
				
				<div class="form-floating">
				  <textarea class="form-control" name="program" id="floatingTextarea2" style="height: 300px"></textarea>
				  <label for="floatingTextarea2">프로그램 소개</label>
				</div>
		<!-- 행사 디테일 폼 입력 끝 -->
			</form>
		<!-- 등록, 취소 버튼 -->
				<div style="float: right">
					<input type="submit" class="btn" onclick="checkValidity()" form="detail_frm" value="등록">
					<input type="button" class="btn" onclick="script:window.location.href='adminList'" value="취소">
				</div>
		<!-- 등록, 취소 버튼 끝 -->
			
		</div>
	</div>
</div>

<!-- 푸터 -->
	<%@ include file="include/footer.jsp" %>
<!-- 푸터 끝 -->

<script>
function checkValidity() {
	
	var isValid = true;
	
	  // 행사분류 선택 확인
	  var type = document.getElementById("inputGroupSelect01").value;
      
	  var eventTypeError = document.getElementById("event_type_error");
      eventTypeError.innerHTML = "";
      
	  if (type === "") {
		eventTypeError.innerHTML = "※ 행사분류를 선택해주세요.";
		isValid = false;
	  }
	
	  // 행사명 입력 확인
	  var title = document.getElementById("title").value;
	  
	  var titleError = document.getElementById("title_error");
	  titleError.innerHTML = "";
	  
	  if (title.trim().length === 0) {
	      titleError.innerHTML = "※ 제목을 입력해주세요.";
	      isValid = false;
      }
	/*
	  // 시작일 확인
	  var startDate = document.getElementsByName("start_date")[0].value;
	  if (startDate === "") {
	    alert("시작일을 선택해주세요.");
	    return false;
	  }
	
	  // 종료일 확인
	  var endDate = document.getElementsByName("end_date")[0].value;
	  if (endDate === "") {
	    alert("종료일을 선택해주세요.");
	    return false;
	  }
	
	  // 자치구 입력 확인
	  var gunName = document.getElementsByName("gunName")[0].value;
	  if (gunName === "") {
	    alert("자치구를 입력해주세요.");
	    return false;
	  }
	
	  // 장소 입력 확인
	  var place = document.getElementsByName("place")[0].value;
	  if (place === "") {
	    alert("장소를 입력해주세요.");
	    return false;
	  }
	
	  // 홈페이지 주소 입력 확인
	  var orgLink = document.getElementsByName("org_link")[0].value;
	  if (orgLink === "") {
	    alert("홈페이지 주소를 입력해주세요.");
	    return false;
	  }
	
	  // 총 티켓 매수 입력 확인
	  var ticketCount = document.getElementsByName("ticketCount")[0].value;
	  if (ticketCount === "") {
	    alert("총 티켓 매수를 입력해주세요.");
	    return false;
	  }
	*/
	
	  // 유효성 검사 통과 시 폼 제출
	  return isValid;
}
</script>

</body>
</html>