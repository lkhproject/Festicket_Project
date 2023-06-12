/**
 * 
 */

  var isLiked = false; // 좋아요 상태를 나타내는 변수

  // 버튼 클릭 이벤트 핸들러 함수
function likeButtonClicked() {
    var likeButton = document.getElementById("like_btn");
    
    if (isLiked) {
      // 원래 색으로 돌아올 때
      likeButton.classList.remove("bg-dark");
      likeButton.classList.add("btn-light");
      likeButton.classList.remove("text-white");
      likeButton.classList.remove("text-bg-danger");
      isLiked = false;
    } else {
      // 색 변경
      likeButton.classList.add("bg-dark");
      likeButton.classList.remove("btn-light");
      likeButton.classList.add("text-white");
      likeButton.classList.remove("text-bg-danger");
      isLiked = true;
    }
  }

function confirmRev() {
	
	var selectedDate = $("#selectedDate").val();
  
  	if (selectedDate === "") {
	  alert("날짜를 선택해주세요.");
	  return false;
	}
	
	var confirmed = confirm("예약을 진행하시겠습니까?");

    if (!confirmed) {
	  event.preventDefault(); // 폼 제출 기본 동작 막기
	}
	
}

function reviewLikeClicked(button) {
    button.classList.toggle("bg-dark");
    button.classList.toggle("btn-light");
    button.classList.toggle("text-white");
    button.classList.toggle("text-bg-danger");
  }

