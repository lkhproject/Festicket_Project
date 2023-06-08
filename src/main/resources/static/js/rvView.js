/**
 * 
 */

function confirmRev() {
	
	var confirmed = confirm("예약을 진행하시겠습니까?");

    if (!confirmed) {
	  event.preventDefault(); // 폼 제출 기본 동작 막기
	}

}

