<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ include file="../include/header.jspf"%>

<body id="body">

	<section class="signin-page account">
		<div class="container">
			<div class="row">
				<div class="content">
					<h1 class="page-name">Register</h1>
				</div>
				<form class="text-left clearfix" method="post" enctype="multipart/form-data">
					<div class="form-group">
						<input type="text" name='mId' class="form-control"
							placeholder="작성자" value="${member.MId}"
							readonly="readonly"> 
					</div>
					<div class="form-group">
						<input type="text" name='title' class="form-control"
							placeholder="제목">
					</div>
					<div class="form-group">
						<textarea class="form-control" name="content" rows="15"
							placeholder="content"></textarea>
					</div>
					
					<div>
						<input type="file" name="file">
					</div>
					
					<div class="text-center">
						<button type="submit" class="btn btn-main text-center">Register</button>
					</div>
				</form>
			</div>
		</div>
	</section>
</body>

<%@ include file="../include/footer.jspf"%>