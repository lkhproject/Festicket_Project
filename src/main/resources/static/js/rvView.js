/**
 * 
 */
  
var startIndex = 0;
var endIndex = 5;

function showMoreReviews() {
  var reviewRows = document.getElementsByClassName("reviewRow");
  var remainingReviews = reviewRows.length - startIndex;

  var numToShow = Math.min(5, remainingReviews); // 최대 5개까지 표시하거나 남은 글 수만큼 표시합니다.

  for (var i = startIndex; i < startIndex + numToShow; i++) {
    if (reviewRows[i]) {
      reviewRows[i].style.display = "table-row";
    }
  }

  startIndex += numToShow;

  if (startIndex >= reviewRows.length) {
    document.getElementById("showMoreRow").style.display = "none";
  }
}

window.addEventListener("DOMContentLoaded", function() {
  showMoreReviews();

  var showMoreButton = document.getElementById("showMoreButton");
  showMoreButton.addEventListener("click", function() {
    showMoreReviews();

    // 모든 리뷰 글이 표시되었으면 "더보기" 버튼 숨기기
    var reviewRows = document.getElementsByClassName("reviewRow");
    if (startIndex >= reviewRows.length) {
      showMoreButton.style.display = "none";
    }
  });
});

 