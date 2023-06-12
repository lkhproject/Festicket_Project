<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
		int eventAddFlag = Integer.parseInt((request.getAttribute("eventAddFlag")).toString());
	
		if(eventAddFlag == 0) {
	%>
		<script type="text/javascript">
			alert("오류가 발생했습니다.");
			history.go(-1);
		</script>
	<%
		} else {
	%>
		<script type="text/javascript">
			alert("등록이 완료되었습니다.");
		</script>
	<%
		}
	%>
</body>
</html>