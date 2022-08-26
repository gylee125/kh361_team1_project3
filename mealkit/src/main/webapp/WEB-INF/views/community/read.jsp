<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ include file="../include/header.jspf"%>
<script src="https://code.jquery.com/jquery-3.6.0.slim.min.js"
	integrity="sha256-u7e5khyithlIdTpu22PHhENmPcRdFiHRjhAuHcs05RI="
	crossorigin="anonymous"></script>

<script type="text/javascript">
	function getContextPath() {
		var hostIndex = location.href.indexOf(location.host)
				+ location.host.length;
		return location.href.substring(hostIndex, location.href.indexOf('/',
				hostIndex + 1));
	};
	$(document).ready(function() {
		var formObj = $("form[name='readForm']");

		// 수정 
		$("#update").on("click", function() {
			formObj.attr("action", getContextPath() + "/community/update");
			formObj.attr("method", "get");
			formObj.submit();
		})

		// 삭제
		$("#delete").on("click", function() {
			formObj.attr("action", getContextPath() + "/community/delete");
			formObj.attr("method", "post");
			formObj.submit();
		})

		// 취소
		$("#list").on("click", function() {

			location.href = getContextPath() + "/community/list";
		})
	})
	
	function fn_fileDown(fileNo){
			var formObj = $("form[name='readForm']");
			$("#FILE_NO").attr("value", fileNo);
			formObj.attr("action", getContextPath()+ "/community/fileDown");
			formObj.submit();
		}
	
</script>

<body id="body">

	<section class="signin-page account">
		<div class="container">
			<div class="row">
				<div class="box-header">
					<h3 class="box-title">READ BOARD</h3>
				</div>

				<form name="readForm" role="form" method="post">
					<input type='hidden' id="cNo" name="cNo" value="${CommunityVO.CNo}">
					<input type="hidden" id="FILE_NO" name="FILE_NO" value=""> 						
				</form>

				<div class="form-group">
					<label for="mId">Writer</label> <input type="text" name='mId'
						class="form-control" value="${CommunityVO.MId}"
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
				
				<label>File</label>
				<div class="form-group" style="border: 1px solid #dbdbdb;">
					<c:forEach var="file" items="${file}">
						<a href="#" onclick="fn_fileDown('${file.FILE_NO}'); return false;">${file.ORG_FILE_NAME}</a>(${file.FILE_SIZE}kb)<br>
					</c:forEach>
				</div>
				
				<div class="box-footer">
				<c:if test = "${sessionScope.member.MId == CommunityVO.MId || sessionScope.member.MLevel == '2'}">
					<button type="submit" class="btn btn-main" id="update">Modify</button>
					<button type="submit" class="btn btn-main" id="delete">REMOVE</button>
				</c:if>	
					<button type="submit" class="btn btn-main" id="list">LIST
						ALL</button>
				</div>
				
			</div>
		</div>
	</section>
</body>

<%@ include file="../include/footer.jspf"%>