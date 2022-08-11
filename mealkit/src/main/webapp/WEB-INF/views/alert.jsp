<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<script>
// 컨트롤러 지시를 받아 뷰에서(자바스크립트) 안내 메세지 출력하고 페이지 이동
	var message = "${msg}";
	var url = "${url}";
	alert(message);
	document.location.href = url;
</script>
</head>
<body>
</body>
</html>