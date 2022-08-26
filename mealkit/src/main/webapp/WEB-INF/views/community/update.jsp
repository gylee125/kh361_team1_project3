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
	
	$(document).ready(function(){
		var formObj = $("form[name='updateForm']");
		
		$(document).on("click","#fileDel", function(){
			$(this).parent().remove();
		})
		
		fn_addFile();
		
	})
	
	
	
	

	/* $(document).ready(function() {
		fn_addFile();
	}) */

	$(document).ready(function() {

		$("#cancel").on("click", function() {
			event.preventDefault();
			location.href = getContextPath() + "/community/list";
		})
	})

	function fn_addFile() {
		var fileIndex = 1;
		//$("#fileIndex").append("<div><input type='file' style='float:left;' name='file_"+(fileIndex++)+"'>"+"<button type='button' style='float:right;' id='fileAddBtn'>"+"추가"+"</button></div>");
		$("#fileAdd_btn")
				.on(
						"click",
						function() {
							$("#fileIndex")
									.append(
											"<div><input type='file' style='float:left;' name='file_"
													+ (fileIndex++)
													+ "'>"
													+ "</button>"
													+ "<button type='button' style='float:right;' id='fileDelBtn'>"
													+ "삭제" + "</button></div>");
						});
		$(document).on("click", "#fileDelBtn", function() {
			$(this).parent().remove();

		});
	}
	
	var fileNoArry = new Array();
	var fileNameArry = new Array();
	
	function fn_del(value, name) {

		fileNoArry.push(value);
		fileNameArry.push(name);
		$("#fileNoDel").attr("value", fileNoArry);
		$("#fileNameDel").attr("value", fileNameArry);
	}
	
</script>

<body id="body">

	<section class="signin-page account">
		<div class="container">
			<div class="row">
				<div class="box-header">
					<h3 class="box-title">Update BOARD</h3>
				</div>
				<div class="table-responsive">
					<form name="updateForm" role="form" method="post"
						action="<%=request.getContextPath()%>/community/update"
						enctype="multipart/form-data">
						<input type="hidden" id="fileNoDel" name="fileNoDel[]" value="">
						<input type="hidden" id="fileNameDel" name="fileNameDel[]"
							value="">

						<table>
							<tbody>
								<tr>
									<div class="form-group">
										<label for="cNo">No</label> <input type="text" name='cNo'
											class="form-control" value="${CommunityVO.CNo}"
											readonly="readonly">
									</div>
								</tr>

								<tr>
									<div class="form-group">
										<label for="mId">Writer</label> <input type="text" name='mId'
											class="form-control" value="${CommunityVO.MId}"
											readonly="readonly">
									</div>
								</tr>

								<tr>
									<div class="form-group">
										<label for="title">Title</label> <input type="text"
											name='title' class="form-control"
											value="${CommunityVO.title}">
									</div>
								</tr>

								<tr>
									<div class="form-group">
										<label for="content">Content</label>
										<textarea class="form-control" name="content" rows="7">${CommunityVO.content}</textarea>
									</div>
								</tr>

								<tr>
									<td id="fileIndex"><c:forEach var="file" items="${file}"
											varStatus="var">
											<div>
												<input type="hidden" id="FILE_NO"
													name="FILE_NO_${var.index}" value="${file.FILE_NO }">
												<input type="hidden" id="FILE_NAME" name="FILE_NAME"
													value="FILE_NO_${var.index}"> <a href="#"
													id="fileName" onclick="return false;">${file.ORG_FILE_NAME}</a>(${file.FILE_SIZE}kb)
												<button id="fileDel"
													onclick="fn_del('${file.FILE_NO}','FILE_NO_${var.index}');"
													type="button">삭제</button>
												<br>
											</div>
										</c:forEach></td>
								</tr>
							</tbody>
						</table>
						<div>
							<button type="submit" class="btn btn-main">SAVE</button>
							<button type="submit" class="btn btn-main" id="Cancel">CANCEL</button>
							<button id="fileAdd_btn" class="btn btn-main text-center"
								type="button">Add file</button>
						</div>


					</form>
				</div>
			</div>
	</section>
</body>

<%@ include file="../include/footer.jspf"%>