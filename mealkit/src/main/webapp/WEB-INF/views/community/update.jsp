<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ include file="../include/header.jspf"%>

<body id="body">

	<section class="signin-page account">
		<div class="container">
			<div class="row">
				<div class="box-header">
					<h3 class="box-title">READ BOARD</h3>
				</div>

				<form role="form" method="post">

					<div class="form-group">
						<label for="cNo">No</label> <input type="text"
							name='cNo' class="form-control" value="${CommunityVO.cNo}"
							readonly="readonly">
					</div>

					<div class="form-group">
						<label for="mId">Writer</label> <input type="text" name='mId'
							class="form-control" value="${CommunityVO.mId}"
							readonly = "readonly">
					</div>

					<div class="form-group">
						<label for="title">Title</label> <input type="text" name='title'
							class="form-control" value="${CommunityVO.title}"
							>
					</div>

					<div class="form-group">
						<label for="content">Content</label>
						<textarea class="form-control" name="content" rows="7"
							>${CommunityVO.content}</textarea>
					</div>

					<div class="box-footer">
						<button type="submit" class="btn btn-main ">SAVE</button>
						<button type="submit" class="btn btn-main1 ">CANCEL</button>
					</div>

					<script>
						$(document).ready(function() {

							var formObj = $("form[role='form']");

							console.log(formObj);

							$(".btn-main").on("click", function() {
								self.location = "/board/list";
							});

							$(".btn-main1").on("click", function() {
								formObj.submit();
							});

						});
					</script>
					<!-- <div class="text-center">
								<button type="submit" class="btn btn-main text-center">Modify
									</button>
							</div> -->
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