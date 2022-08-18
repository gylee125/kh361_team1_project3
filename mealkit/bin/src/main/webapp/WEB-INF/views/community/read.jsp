<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ include file="../include/header.jspf"%>
<script src="https://code.jquery.com/jquery-3.6.0.slim.min.js"
	integrity="sha256-u7e5khyithlIdTpu22PHhENmPcRdFiHRjhAuHcs05RI="
	crossorigin="anonymous"></script>
<script type="text/javascript">
	$(document).ready(function() {
		var formObj = $("form[name='readForm']");

		// 수정 
		$("#update").on("click", function() {
			formObj.attr("action", "/community/update");
			formObj.attr("method", "get");
			formObj.submit();
		})

		// 삭제
		$("#delete").on("click", function() {
			formObj.attr("action", "/community/delete");
			formObj.attr("method", "post");
			formObj.submit();
		})

		// 취소
		$("#list").on("click", function() {

			location.href = "/community/list";
		})
	})
</script>

<body id="body">

	<section class="signin-page account">
		<div class="container">
			<div class="row">
				<div class="box-header">
					<h3 class="box-title">READ BOARD</h3>
				</div>

				<form name="readForm" role="form" method="post">

					<input type='hidden' id="cNo" name="cNo" value="${CommunityVO.cNo}">

				</form>

				<div class="form-group">
					<label for="mId">Writer</label> <input type="text" name='mId'
						class="form-control" value="${CommunityVO.mId}"
						readonly="readonly">
				</div>

				<div class="form-group">
					<label for="title">Title</label> <input type="text" name='title'
						class="form-control" value="${CommunityVO.title}"
						readonly="readonly">
				</div>

				<div class="form-group">
					<label for="content">Content</label>
					<textarea class="form-control" name="content" rows="7"
						readonly="readonly">${CommunityVO.content}</textarea>
				</div>

				<div class="box-footer">
					<button type="submit" class="btn btn-main" id="update">Modify</button>
					<button type="submit" class="btn btn-main" id="delete">REMOVE</button>
					<button type="submit" class="btn btn-main" id="list">LIST ALL</button>
				</div>

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