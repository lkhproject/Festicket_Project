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

function reviewLikeClicked(button) {
    button.classList.toggle("bg-dark");
    button.classList.toggle("btn-light");
    button.classList.toggle("text-white");
    button.classList.toggle("text-bg-danger");
  }
  
function confirmRev() {
	event.preventDefault();
	
	var loginOkElement = document.getElementById('login-ok');
	var loginOk = loginOkElement.value;
	
	if (loginOk === '0') {
		alert("로그인이 필요합니다.");
        window.location.href = "login";
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
    }
	
}

  var startIndex = 0;
  var endIndex = 5;

  function showMoreReviews() {
    var reviewRows = document.getElementsByClassName("reviewRow");
    for (var i = startIndex; i < endIndex; i++) {
      if (reviewRows[i]) {
        reviewRows[i].style.display = "table-row";
      }
    }
    startIndex += 6;
    endIndex += 6;
    if (endIndex >= reviewRows.length) {
      document.getElementById("showMoreRow").style.display = "none";
    }
  }

  window.addEventListener("DOMContentLoaded", function() {
    showMoreReviews();
  });
  
