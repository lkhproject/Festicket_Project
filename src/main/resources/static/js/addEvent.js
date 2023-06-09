/**
 * 
 */

 function checkValidity() {
	 if($("#inputGroupSelect01 option:selected").val()) {
		 alert("행사분류는 필수 선택사항입니다. 다시 확인해 주세요.");
		 return ;
	 }
	 if(document.detail_frm.title.value.length == 0) {
		 alert("행사명은 필수 입력사항입니다. 다시 확인해 주세요.");
		 return ;
	 }
	 if(document.detail_frm.start_date.value.length == 0) {
		 alert("시작일은 필수 선택사항입니다. 다시 확인해 주세요.");
		 return ;
	 }
	 if(document.detail_frm.end_date.value.length == 0) {
		 alert("종료일은 필수 선택사항입니다. 다시 확인해 주세요.");
		 return ;
	 }
	 if(document.detail_frm.gunName.value.length == 0) {
		 alert("자치구은 필수 입력사항입니다. 다시 확인해 주세요.");
		 return ;
	 }
	 if(document.detail_frm.place.value.length == 0) {
		 alert("장소는 필수 입력사항입니다. 다시 확인해 주세요.");
		 return ;
	 }
	 if(document.detail_frm.org_link.value.length == 0) {
		 alert("홈페이지 주소는 필수 입력사항입니다. 다시 확인해 주세요.");
		 return ;
	 }
	 if(document.detail_frm.ticketCount.value.length == 0) {
		 alert("총 티켓 매수는 필수 입력사항입니다. 다시 확인해 주세요.");
		 return ;
	 }
	 if(document.detail_frm.main_img.value.length == 0) {
		 alert("대표 이미지는 필수 입력사항입니다. 다시 확인해 주세요.");
		 return ;
	 }
	 
	 document.detail_frm.submit();
	 
 }