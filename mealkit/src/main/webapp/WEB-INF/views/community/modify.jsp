<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ include file="../include/header.jspf"%>

<body id="body">

	<section class="signin-page account">
		<div class="container">
			<div class="row">
						<a class="logo" href="index.html"> <img src="images/logo.png"
							alt="">
						</a>
						<h2 class="text-center">글작성</h2>
						<form class="text-left clearfix" action="index.html">
							<div class="form-group">
								<input type="text" class="form-control" placeholder="mId">
							</div>
							<div class="form-group">
								<input type="text" class="form-control" placeholder="title">
							</div>
							<div class="form-group">
								<input type="text" class="form-control" placeholder="content">
							</div>
							<div class="text-center">
								<button type="submit" class="btn btn-main text-center">Register
									</button>
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