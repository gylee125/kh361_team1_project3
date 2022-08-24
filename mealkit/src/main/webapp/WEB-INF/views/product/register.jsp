<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<title>밀슐랭 | 관리자 페이지</title>
<style>
	.result_card img{
		max-width: 100%;
	    height: auto;
	    display: block;
	    padding: 5px;
	    margin-top: 10px;
	    margin: auto;	
	}
	.result_card {
		position: relative;
	}
	.imgDeleteBtn, .thumbDeleteBtn{
	    position: absolute;
	    top: 10px;
	    right: 10px;
	    background-color: #ef7d7d;
	    color: wheat;
	    font-weight: 900;
	    width: 30px;
	    height: 30px;
	    border-radius: 50%;
	    line-height: 26px;
	    text-align: center;
	    border: none;
	    display: block;
	    cursor: pointer;	
	}
	
</style>
</head>
<body id="body">




	<%@ include file="../include/header.jspf"%>




<body id="body">

	<section class="signin-page account">
		<div class="container">
			<div class="row">
				<div class="col-md-6 col-md-offset-3">
					<div class="block text-center">
						
						<div style="margin: 0 0 0 30px; font-size: 0.8em; text-align: right; text-decoration: underline;">
							<a href="<%=request.getContextPath()%>/product/adminProduct">관리자 메뉴로 돌아가기</a>
						</div>
						
						<h2 class="text-center">상품 등록</h2>
						<form class="text-left clearfix" id="insertProduct"
							name="insertProduct" role="form" method="post">
							<h6 style="text-align:right;">*은 필수 입력사항</h6> 
							<div class="form-group">
								<input
									type="text" class="form-control" placeholder=" *상품분류코드"
									name="typeCode" id="typeCode"> <span
									style="font-size: 0.8em;">&nbsp; 1:한식 &nbsp; 2:양식 &nbsp;
									3:중식 &nbsp; 4:일식 &nbsp; 5:기타 &nbsp; </span>
							</div>
							<div class="form-group">
								<input type="text" class="form-control" placeholder="*상품명"
									name="pName" id="pName">
							</div>
							<div class="form-group">
								<input type="text" class="form-control" placeholder="*가격"
									name="price" id="price">
							</div>
							<div class="form-group">
								<input type="text" class="form-control" placeholder="*브랜드"
									name="brand" id="brand">
							</div>
							<div class="form-group">
								<input type="text" class="form-control" placeholder="상세설명"
									name="description" id="description">
							</div>
							<div class="form-group">
								<span style="font-size: 0.8em;">썸네일이미지 [이미지파일만 첨부가능]</span>
								<input type="file" class="form-control"
									placeholder="썸네일(나중에 첨부로 바꾸기)" name="thumbnailFile" id="thumbnailFile">
								<div id="thumbnailUploadResult">
								</div>
							</div>
							<div class="form-group">
								<span style="font-size: 0.8em;">상세이미지 [이미지파일만 첨부가능]</span>
								<input type="file" class="form-control"
									placeholder="이미지(나중에 첨부로 바꾸기)" name="imageFile" id="imageFile">
								<div id="imageUploadResult">
								</div>
							</div>
							<div class="text-center">
								<button type="submit" class="btn btn-main btn-medium text-center"
									onclick="checkForm();">등록하기</button>
							</div>

						</form>
						
					</div>
				</div>
			</div>
		</div>
	</section>



	<!-- 
    Essential Scripts
    =====================================-->

	<!-- Main jQuery -->
	<script
		src="<%=request.getContextPath()%>/resources/plugins/jquery/dist/jquery.min.js"></script>
	<!-- Bootstrap 3.1 -->
	<script
		src="<%=request.getContextPath()%>/resources/plugins/bootstrap/js/bootstrap.min.js"></script>
	<!-- Bootstrap Touchpin -->
	<script
		src="<%=request.getContextPath()%>/resources/plugins/bootstrap-touchspin/dist/jquery.bootstrap-touchspin.min.js"></script>
	<!-- Instagram Feed Js -->
	<script
		src="<%=request.getContextPath()%>/resources/plugins/instafeed/instafeed.min.js"></script>
	<!-- Video Lightbox Plugin -->
	<script
		src="<%=request.getContextPath()%>/resources/plugins/ekko-lightbox/dist/ekko-lightbox.min.js"></script>
	<!-- Count Down Js -->
	<script
		src="<%=request.getContextPath()%>/resources/plugins/syo-timer/build/jquery.syotimer.min.js"></script>

	<!-- slick Carousel -->
	<script
		src="<%=request.getContextPath()%>/resources/plugins/slick/slick.min.js"></script>
	<script
		src="<%=request.getContextPath()%>/resources/plugins/slick/slick-animation.min.js"></script>

	<!-- Google Mapl -->
	<script
		src="https://maps.googleapis.com/maps/api/js?key=AIzaSyCC72vZw-6tGqFyRhhg5CkF2fqfILn2Tsw"></script>
	<script type="text/javascript"
		src="<%=request.getContextPath()%>/resources/plugins/google-map/gmap.js"></script>

	<!-- Main Js File -->
	<script src="<%=request.getContextPath()%>/resources/js/script.js"></script>



<script type=text/javascript>
	let insertProductForm = document.getElementById("insertProduct");

	function checkForm() {

		if (insertProductForm.typeCode.value == ""
				|| insertProductForm.pName.value == ""
				|| insertProductForm.price.value == ""
				|| insertProductForm.brand.value == "") {
			alert("분류코드,상품명,단가,브랜드는 필수입력!!");
			insertProductForm.typeCode.focus();
			return false;
		}

		insertProductForm.submit();

	}

	/* 이미지 업로드 */
	$('input[name="thumbnailFile"]').on("change", function(e) {
		
		/* 이미지 존재시 삭제 */
		if($(".thumbDeleteBtn").length > 0){
			deleteThumbnailFile();
		}
		
		let formData = new FormData();
		let fileInput = $('input[name="thumbnailFile"]');
		let fileList = fileInput[0].files;
		let fileObj = fileList[0];
		
		console.log("fileObj : " + fileObj);

		console.log("fileName : " + fileObj.name);
		console.log("fileSize : " + fileObj.size);
		console.log("fileType(MimeType) : " + fileObj.type);
		
		
		formData.append("file", fileObj);
		
		
		for (let key of formData.keys()) {
			console.log(key, ":", formData.get(key));
		}
		
		$.ajax({
			url: '/mealkit/product/uploadAjaxAction',
			enctype: 'multipart/form-data',
	    	processData : false,
	    	contentType : false,
	    	data : formData,
	    	type : 'POST',
	    	dataType : 'json',
	    	success : function(result){
	    		console.log(result);
	    		showUploadThumbnail(result);
	    	},
	    	error : function(result){
	    		alert("이미지 파일이 아닙니다.");
	    	}
		});
	});
	$('input[name="imageFile"]').on("change", function(e) {
		
		/* 이미지 존재시 삭제 */
		if($(".imgDeleteBtn").length > 0){
			deleteImageFile();
		}
		
		let formData = new FormData();
		let fileInput = $('input[name="imageFile"]');
		let fileList = fileInput[0].files;
		let fileObj = fileList[0];
		
		console.log("fileObj : " + fileObj);

		console.log("fileName : " + fileObj.name);
		console.log("fileSize : " + fileObj.size);
		console.log("fileType(MimeType) : " + fileObj.type);
		
		
		formData.append("file", fileObj);
		
		
		for (let key of formData.keys()) {
			console.log(key, ":", formData.get(key));
		}
		
		$.ajax({
			url: '/mealkit/product/uploadAjaxAction',
			enctype: 'multipart/form-data',
	    	processData : false,
	    	contentType : false,
	    	data : formData,
	    	type : 'POST',
	    	dataType : 'json',
	    	success : function(result){
	    		console.log(result);
	    		showUploadImage(result);
	    	},
	    	error : function(result){
	    		alert("이미지 파일이 아닙니다.");
	    	}
		});
	});

	
	
	/* 이미지 출력 */
	function showUploadThumbnail(uploadResultArr){
		
		/* 전달받은 데이터 검증 */
		if(!uploadResultArr || uploadResultArr.length == 0){return}
		
		let uploadResult = $("#thumbnailUploadResult");
		
		let obj = uploadResultArr[0];
		
		let str = "";
		
		let fileCallPath = encodeURIComponent(obj.uploadPath.replace(/\\/g, '/') + "/" + obj.uuid + "_" + obj.fileName);
		
		str += "<div id='result_card_thumbnail' class='result_card'>";
		str += "<img class='img-responsive' src='/mealkit/product/display?fileName=" + fileCallPath +"'>";
		str += "<div class='thumbDeleteBtn' data-file='" + fileCallPath + "'>x</div>";
		str += "<input type='hidden' name='thumbnail' value='" + obj.uploadPath.replace(/\\/g, '/') + "/" + obj.uuid + "_" + obj.fileName +"'>";
		str += "</div>";		
		
   		uploadResult.append(str);
	}
	function showUploadImage(uploadResultArr){
		
		/* 전달받은 데이터 검증 */
		if(!uploadResultArr || uploadResultArr.length == 0){return}
		
		let uploadResult = $("#imageUploadResult");
		
		let obj = uploadResultArr[0];
		
		let str = "";
		
		let fileCallPath = encodeURIComponent(obj.uploadPath.replace(/\\/g, '/') + "/" + obj.uuid + "_" + obj.fileName);
		
		str += "<div id='result_card_image' class='result_card'>";
		str += "<img class='img-responsive' src='/mealkit/product/display?fileName=" + fileCallPath +"'>";
		str += "<div class='imgDeleteBtn' data-file='" + fileCallPath + "'>x</div>";
		str += "<input type='hidden' name='image' value='" + obj.uploadPath.replace(/\\/g, '/') + "/" + obj.uuid + "_" + obj.fileName +"'>";
		str += "</div>";		
		
   		uploadResult.append(str);
	}
	
	
	/* 이미지 삭제 버튼 동작 */
	$("#thumbnailUploadResult").on("click", ".thumbDeleteBtn", function(e){
		deleteThumbnailFile();
	});
	$("#imageUploadResult").on("click", ".imgDeleteBtn", function(e){
		deleteImageFile();
	});
	
	
	/* 이미지 삭제 메서드 */
	function deleteThumbnailFile(){
		let targetFile = $(".thumbDeleteBtn").data("file");
		
		let targetDiv = $("#result_card_thumbnail");
		
		$.ajax({
			url: '/mealkit/product/deleteFile',
			data : {fileName : targetFile},
			dataType : 'text',
			type : 'POST',
			success : function(result){
				console.log(result);
				
				targetDiv.remove();
				$("input[name='thumbnailFile']").val("");
				
			},
			error : function(result){
				console.log(result);
				
				alert("파일을 삭제하지 못하였습니다.")
			}
		});
	}
	function deleteImageFile(){
		let targetFile = $(".imgDeleteBtn").data("file");
		
		let targetDiv = $("#result_card_image");
		
		$.ajax({
			url: '/mealkit/product/deleteFile',
			data : {fileName : targetFile},
			dataType : 'text',
			type : 'POST',
			success : function(result){
				console.log(result);
				
				targetDiv.remove();
				$("input[name='imageFile']").val("");
				
			},
			error : function(result){
				console.log(result);
				
				alert("파일을 삭제하지 못하였습니다.")
			}
		});
	}
	
</script>
<%@ include file="../include/footer.jspf"%>