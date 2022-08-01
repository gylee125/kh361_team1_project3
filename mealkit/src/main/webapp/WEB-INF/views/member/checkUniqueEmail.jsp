<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>이메일 중복확인</title>
<style>
body {
	line-height: 1.5;
	font-family: "Poppins", sans-serif;
	-webkit-font-smoothing: antialiased;
	text-align : center;
}
</style>

<!-- Basic Page Needs
  ================================================== -->
<meta charset="utf-8">
<title>밀슐랭 | 밀키트 쇼핑몰</title>

<!-- Mobile Specific Metas
  ================================================== -->
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="description" content="Construction Html5 Template">
<meta name="viewport"
	content="width=device-width, initial-scale=1.0, maximum-scale=5.0">
<meta name="author" content="Themefisher">
<meta name="generator" content="Themefisher Constra HTML Template v1.0">

<!-- Favicon -->
<link rel="shortcut icon" type="image/x-icon"
	href="resource/images/favicon.png" />

<!-- Themefisher Icon font -->
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/aviato/plugins/themefisher-font/style.css">
<!-- bootstrap.min css -->
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/aviato/plugins/bootstrap/css/bootstrap.min.css">

<!-- Animate css -->
<link rel="stylesheet" href="<%=request.getContextPath()%>/aviato/plugins/animate/animate.css">
<!-- Slick Carousel -->
<link rel="stylesheet" href="<%=request.getContextPath()%>/aviato/plugins/slick/slick.css">
<link rel="stylesheet" href="<%=request.getContextPath()%>/aviato/plugins/slick/slick-theme.css">

<!-- Main Stylesheet -->
<link rel="stylesheet" href="<%=request.getContextPath()%>/aviato/css/style.css">

</head>
<body>
	<br>

	<c:if test="${result == true}">
	사용가능한 이메일입니다.<br>
		 <a class="btn btn-main btn-medium" onclick="sendResultEmailAvailable();">이메일 사용</a>

	</c:if>

	<c:if test="${result == false}">
이미 사용 중인 이메일입니다.<br>
딴거 하세요~<br>
		<a class="btn btn-main btn-medium" onclick="window.close()">이메일 다시 작성</a>
		<!-- 닫았다 다시 아이디치고 열고해서 번잡한데 깔끔하게 수정해야함 -->
	</c:if>

	<script>
		function sendResultEmailAvailable() {
			var avalableEmail = "중복 확인 검사 완료했습니다. 해당 이메일 사용가능합니다.";
			opener.document.submitSignUp.isUniqueEmail.value = true;
			opener.emailCheckText.innerHTML = avalableEmail;
			self.close();
		}
	</script>

  <!-- 
    Essential Scripts
    =====================================-->

     <!-- 
    Essential Scripts
    =====================================-->

    <!-- Main jQuery -->
    <script src="<%=request.getContextPath()%>/aviato/plugins/jquery/dist/jquery.min.js"></script>
    <!-- Bootstrap 3.1 -->
    <script src="<%=request.getContextPath()%>/aviato/plugins/bootstrap/js/bootstrap.min.js"></script>
    <!-- Bootstrap Touchpin -->
    <script src="<%=request.getContextPath()%>/aviato/plugins/bootstrap-touchspin/dist/jquery.bootstrap-touchspin.min.js"></script>
    <!-- Instagram Feed Js -->
    <script src="<%=request.getContextPath()%>/aviato/plugins/instafeed/instafeed.min.js"></script>
    <!-- Video Lightbox Plugin -->
    <script src="<%=request.getContextPath()%>/aviato/plugins/ekko-lightbox/dist/ekko-lightbox.min.js"></script>
    <!-- Count Down Js -->
    <script src="<%=request.getContextPath()%>/aviato/plugins/syo-timer/build/jquery.syotimer.min.js"></script>

    <!-- slick Carousel -->
    <script src="<%=request.getContextPath()%>/aviato/plugins/slick/slick.min.js"></script>
    <script src="<%=request.getContextPath()%>/aviato/plugins/slick/slick-animation.min.js"></script>

    <!-- Google Mapl -->
    <script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyCC72vZw-6tGqFyRhhg5CkF2fqfILn2Tsw"></script>
    <script type="text/javascript" src="<%=request.getContextPath()%>/aviato/plugins/google-map/gmap.js"></script>
    <script src="<%=request.getContextPath()%>/aviato/js/script.js"></script>


</body>
</html>