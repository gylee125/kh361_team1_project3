<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../include/header.jspf"%>

<script src="https://code.jquery.com/jquery-3.6.0.slim.min.js"
	integrity="sha256-u7e5khyithlIdTpu22PHhENmPcRdFiHRjhAuHcs05RI="
	crossorigin="anonymous"></script>
<script type="text/javascript">
		$(document).ready(function(){
			
			$("#cancel").on("click", function(){
				event.preventDefault();
				location.href = "/community/list";
			})
		})
	
</script>

<body id="body">

	<section class="signin-page account">
		<div class="container">
			<div class="row">
				<div class="box-header">
					<h3 class="box-title">Update BOARD</h3>
				</div>

				<form role="form" method="post" action="/community/update">

					<div class="form-group">
						<label for="cNo">No</label> <input type="text" name='cNo'
							class="form-control" value="${CommunityVO.cNo}"
							readonly="readonly">
					</div>

					<div class="form-group">
						<label for="mId">Writer</label> <input type="text" name='mId'
							class="form-control" value="${CommunityVO.mId}"
							readonly="readonly">
					</div>

					<div class="form-group">
						<label for="title">Title</label> <input type="text" name='title'
							class="form-control" value="${CommunityVO.title}">
					</div>

					<div class="form-group">
						<label for="content">Content</label>
						<textarea class="form-control" name="content" rows="7">${CommunityVO.content}</textarea>
					</div>

					<div class="box-footer">
						<button type="submit" class="btn btn-main">SAVE</button>
						<button type="submit" class="btn btn-main" id="Cancel">CANCEL</button>
					</div>

				</form>
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