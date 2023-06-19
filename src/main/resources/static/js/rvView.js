/**
 * 
 */
  
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
  
  

  
