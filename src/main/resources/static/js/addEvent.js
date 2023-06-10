/**
 * 
 */

function checkValidity() {
	  // 행사분류 선택 확인
	  var type = document.getElementById("inputGroupSelect01").value;
	  if (type === "") {
	    alert("행사분류를 선택해주세요.");
	    return false;
	  }
	
	  // 행사명 입력 확인
	  var title = document.getElementsByName("title")[0].value;
	  if (title === "") {
	    alert("행사명을 입력해주세요.");
	    return false;
	  }
	
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
	
	  // 유효성 검사 통과 시 폼 제출
	  document.getElementById("detail_frm").submit();
}