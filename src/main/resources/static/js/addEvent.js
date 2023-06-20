function checkVal() {
  
  // 행사 타입 유효성 검사
  var eventType = document.getElementById("inputGroupSelect01").value;
  var eventTypeError = document.getElementById("event_type_error");

  var title = document.getElementById("title").value;
  var titleError = document.getElementById("title_error");

  var startDate = document.getElementById("datepicker_1").value;
  var startDateError = document.getElementById("start_date_error");

  var endDate = document.getElementById("datepicker_2").value;
  var endDateError = document.getElementById("end_date_error");

  var gunName = document.getElementsByName("gunName")[0].value;
  var gunNameError = document.getElementById("gunName_error");

  var place = document.getElementsByName("place")[0].value;
  var placeError = document.getElementById("place_error");

  var orgLink = document.getElementsByName("org_link")[0].value;
  var orgLinkError = document.getElementById("org_link_error");

  var ticketCount = document.getElementsByName("ticketCount")[0].value;
  var ticketCountError = document.getElementById("ticketCount_error");

  var mainImg = document.getElementsByName("main_img")[0].value;
  var mainImgError = document.getElementById("main_img_error");
  
  eventTypeError.innerHTML = "";
  titleError.innerHTML = "";
  startDateError.innerHTML = "";
  endDateError.innerHTML = "";
  gunNameError.innerHTML = "";
  placeError.innerHTML = "";
  orgLinkError.innerHTML = "";
  ticketCountError.innerHTML = "";
  mainImgError.innerHTML = "";
  
  var isValid = true;
  
  // 행사 타입 유효성 검사
  if (eventType === "Choose...") {
    eventTypeError.innerHTML = "※ 행사분류를 선택해주세요.";
    isValid = false;
  }
  // 제목 유효성 검사
  if (title.trim().length === 0) {
    titleError.innerHTML = "※ 제목을 입력해주세요.";
    isValid = false;
  } else if (title.length > 100) {
	titleError.innerHTML = "※ 제목은 100자 이하로 입력해주세요.";
	isValid = false;
	}
  // 시작일 유효성 검사
  if (startDate.trim().length === 0) {
    startDateError.innerHTML = "※ 시작일을 입력해주세요.";
    isValid = false;
  }
  // 종료일 유효성 검사
  if (endDate.trim().length === 0) {
    endDateError.innerHTML = "※ 종료일을 입력해주세요.";
    isValid = false;
  }
  // 자치구 유효성 검사
  if (gunName.trim().length === 0) {
    gunNameError.innerHTML = "※ 자치구를 입력해주세요.";
    isValid = false;
  } else if (gunName.trim().length > 5) {
	  gunNameError.innerHTML = "※ 자치구는 5자 이하로 입력해주세요.";
	  isValid = false;
	}
  // 장소 유효성 검사
  if (place.trim().length === 0) {
    placeError.innerHTML = "※ 장소를 입력해주세요.";
    isValid = false;
  } else if (title.length > 100) {
	placeError.innerHTML = "※ 장소는 50자 이하로 입력해주세요.";
	isValid = false;
	}
  // 홈페이지 주소 유효성 검사
  if (orgLink.trim().length === 0) {
    orgLinkError.innerHTML = "※ 홈페이지 주소를 입력해주세요.";
    isValid = false;
  } else {
  // 정규식을 사용하여 형식을 검사
  const urlPattern = /^(http:\/\/www\.|https:\/\/www\.|http:\/\/|https:\/\/)?[a-zA-Z0-9]+([-.][a-zA-Z0-9]+)*\.[a-zA-Z]{2,}(:[0-9]{1,5})?(\/.*)?$/;
  if (!urlPattern.test(orgLink.trim())) {
	    orgLinkError.innerHTML = "※ 올바른 홈페이지 주소 형식이 아닙니다.";
	    isValid = false;
	  }
	}
  // 총 티켓 매수 유효성 검사
  if (ticketCount.trim().length === 0) {
    ticketCountError.innerHTML = "※ 총 티켓 매수를 입력해주세요.";
    isValid = false;
  } else if (isNaN(ticketCount)) {
	  ticketCountError.innerHTML = "※ 숫자만 입력해주세요.";
	  isValid = false;
	}
  // 대표 이미지 유효성 검사
  if (mainImg.trim().length === 0) {
    mainImgError.innerHTML = "※ 대표 이미지를 선택해주세요.";
    isValid = false;
  }
  
  if (!isValid) {
    alert("모든 필수 입력값을 입력해주세요.");
  }

  return isValid;
}

