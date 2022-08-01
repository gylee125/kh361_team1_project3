<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>밀슐랭 | 회원탈퇴</title>
<style>
.text1 {
	margin-top: 15px;
	font-family: "Poppins", sans-serif;
	letter-spacing: 1px;
}

.text2 {
	margin-top: 40px;
	margin-bottom: 20px;
	letter-spacing: 1px;
}
</style>
</head>
<body>

<%@ include file="../include/header.jspf"%>

	<section class="page-wrapper success-msg">
		<div class="container">
			<div class="row">
				<div class="col-md-6 col-md-offset-3">
					<div class="block text-center">
					  <i class="tf-ion-android-checkmark-circle"></i>
						<div class="text1">
					 	 <h4>요청하신 회원 탈퇴가 정상적으로 처리되었습니다.</h4>
						</div>
						<div class="text2">
						  <p>그동안 저희와 함께해 주셔서 감사합니다. <br>
						 	 맛있고 즐거운 순간들, 밀슐랭이 필요하실 때 언제든지 다시 찾아주세요!</p>
						</div>
						<a href="index.do" class="btn btn-main mt-20">계속 쇼핑하기</a>
					</div>
				</div>
			</div>
		</div>
	</section>

<%@ include file="../include/footer.jspf"%>

</body>
</html>