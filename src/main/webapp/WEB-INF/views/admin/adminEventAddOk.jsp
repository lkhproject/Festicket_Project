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
		int adminCheck = Integer.parseInt((request.getAttribute("adminCheck")).toString());
		int eventAddFlag = Integer.parseInt((request.getAttribute("eventAddFlag")).toString());
	
		if(adminCheck == 0) {
	%>
		<script>
			alert("권한이 없는 페이지 입니다.");
			history.back();
		</script>
	<%
		}

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
			window.location.href='adminList';
		</script>
	<%
		}
	%>
</body>
</html>