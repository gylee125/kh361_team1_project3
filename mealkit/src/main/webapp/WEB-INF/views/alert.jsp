<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<script>

// 컨트롤러 지시로 뷰(자바스크립트) 경고메세지 출력
	var message = "${msg}";
	var url = "${url}";
	alert(message);
	document.location.href = url;
</script>
</head>
<body>
</body>
</html>