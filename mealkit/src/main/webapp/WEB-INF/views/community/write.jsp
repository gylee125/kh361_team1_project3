<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ include file="../include/header.jspf"%>

<script src="https://code.jquery.com/jquery-3.6.0.slim.min.js"
	integrity="sha256-u7e5khyithlIdTpu22PHhENmPcRdFiHRjhAuHcs05RI="
	crossorigin="anonymous"></script>

<script type="text/javascript">
var fileIndex = 1
function fn_addFile(){
    $("#d_file").append("<input type='file' name='file" + fileIndex + "' />");
    fileIndex++;
}
</script>


<body id="body">

	<section class="signin-page account">
		<div class="container">
			<div class="row">
				<div class="content">
					<h1 class="page-name">Register</h1>
				</div>
				<form class="text-left clearfix" method="post"
					enctype="multipart/form-data">
					<div class="form-group">
						<input type="text" name='mId' class="form-control"
							placeholder="작성자" value="${member.MId}" readonly="readonly">
					</div>
					<div class="form-group">
						<input type="text" name='title' class="form-control"
							placeholder="제목">
					</div>
					<div class="form-group">
						<textarea class="form-control" name="content" rows="15"
							placeholder="content"></textarea>
					</div>
					
					<div class="form-group">
					<input type="button" value="파일 추가" onClick="fn_addFile()">
					</div>
					
					<div id="d_file">
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