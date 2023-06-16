<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
	<link rel="stylesheet" type="text/css" href="/resources/css/bootstrap.min.css">
	<link rel="stylesheet" type="text/css" href="/resources/css/style.css">
</head>
<body>

<script>
  var startIndex = 0;
  var endIndex = 5;

  function showMoreQAs() {
    var QARow = document.getElementsByClassName("QARow");
    for (var i = startIndex; i < endIndex; i++) {
      if (QARows[i]) {
    	  QARows[i].style.display = "table-row";
      }
    }
    startIndex += 6;
    endIndex += 6;
    if (endIndex >= QARows.length) {
      document.getElementById("showMoreRow2").style.display = "none";
    }
  }

  window.addEventListener("DOMContentLoaded", function() {
	  showMoreQAs();
  });
  

  
</script>


</body>
</html>