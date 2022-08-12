<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>밀슐랭 | 로그인</title>
</head>
<body id="body">

	<%@ include file="../include/header.jspf"%>

	<!-- Login box -->
	<section class="signin-page account">
		<div class="container">
			<div class="row">
				<div class="col-md-6 col-md-offset-3">
					<div class="block text-center">
						<h2 class="text-center">환영합니다</h2>
						<form class="text-left clearfix" action="submitLogin.do" method="post">
							<div class="form-group">
								<input type="text" name="mId" class="form-control" placeholder="아이디" value="${saveIdCookie}">
							</div>
							<div class="form-group">
								<input type="password" name="pw" class="form-control" placeholder="비밀번호">
							</div>
							<input type="checkbox" name="saveId" <c:if test="${saveIdCookie != null}">checked</c:if> >
							<span style="font-size: 11px; position: relative; top: -2px;">아이디 저장</span>
							<div class="text-center">
								<button type="submit" class="btn btn-main text-center">로그인</button>
							</div>
						</form>
						<p class="mt-20">밀슐랭이 처음이세요☞<a href="signUp.do">회원가입</a></p>
						<p class="mt-20">비밀번호를 잊으셨나요☞<a href="forgetPwd.do">비밀번호 찾기</a></p>
					</div>
				</div>
			</div>
		</div>
	</section>

	<%@ include file="../include/footer.jspf"%>

</body>
</html>