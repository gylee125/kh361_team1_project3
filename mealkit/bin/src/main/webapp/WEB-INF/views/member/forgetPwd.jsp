<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>밀슐랭 | 비밀번호 변경</title>
</head>

<body id="body">

	<%@ include file="../include/header.jspf"%>

	<%-- Forget password form --%>
	<section class="forget-password-page account">
		<div class="container">
			<div class="row">
				<div class="col-md-6 col-md-offset-3">
					<div class="block text-center">
						<h2 class="text-center">회원정보 확인</h2>
						<form class="text-center" action="checkEmail.do" method="post"
							>
							<p>
								가입한 계정의 아이디와 이메일를 입력하세요.<br> 
								이메일 주소로 인증 코드가 전송됩니다.
							</p>
							<br>
							<div class="form-group">
								<input type="text" class="form-control" name="mId" 
									placeholder="아이디" required>
							</div>
							<div class="form-group">
								<input type="email" class="form-control" name="email" 
									placeholder="이메일" required>
							</div>
							<br>
							<div class="text-center">
								<button type="submit" class="btn btn-main text-center">인증 코드 전송</button>
							</div>
						</form>
						<p class="mt-20">
						<span >
							<a href="login.do" class="underline">로그인</a> </span>
						&nbsp; / &nbsp;
						<span>	
							<a href="signUp.do">회원가입</a> </span>
						</p>
					</div>
				</div>
			</div>
		</div>
	</section>


	<%@ include file="../include/footer.jspf"%>

</body>
</html>