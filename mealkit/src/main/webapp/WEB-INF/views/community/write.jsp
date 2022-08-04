<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ include file="../include/header.jspf"%>

<body id="body">

	<section class="signin-page account">
		<div class="container">
			<div class="row">
						<h2 class="text-center">REGISTER BOARD</h2>
						<form class="text-left clearfix" method="post">
							<div class="form-group">
								<input type="text" name='mId' class="form-control" placeholder="작성자">
							</div>
							<div class="form-group">
								<input type="text" name='title' class="form-control" placeholder="제목">
							</div>
							<div class="form-group">
								<textarea class="form-control" name="content" rows="3"
									placeholder="content"></textarea>
							</div>
							<div class="text-center">
								<button type="submit" class="btn btn-main text-center">Register</button>
							</div>
						</form>
						<!-- <p class="mt-20">
							Already hava an account ?<a href="login.html"> Login</a>
						</p>
						<p>
							<a href="forget-password.html"> Forgot your password?</a>
						</p> -->
			</div>
		</div>
	</section>
</body>

<%@ include file="../include/footer.jspf"%>