<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!-- 
THEME: Aviato | E-commerce template
VERSION: 1.0.0
AUTHOR: Themefisher

HOMEPAGE: https://themefisher.com/products/aviato-e-commerce-template/
DEMO: https://demo.themefisher.com/aviato/
GITHUB: https://github.com/themefisher/Aviato-E-Commerce-Template/

WEBSITE: https://themefisher.com
TWITTER: https://twitter.com/themefisher
FACEBOOK: https://www.facebook.com/themefisher
-->


<!DOCTYPE html>
<html lang="en">
<head>

<!-- Basic Page Needs
  ================================================== -->
<meta charset="utf-8">
<title>밀슐랭 | 밀키트 쇼핑몰</title>

<!-- Mobile Specific Metas
  ================================================== -->
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="description" content="Construction Html5 Template">
<meta name="viewport"
	content="width=device-width, initial-scale=1.0, maximum-scale=5.0">
<meta name="author" content="Themefisher">
<meta name="generator" content="Themefisher Constra HTML Template v1.0">

<!-- Favicon -->
<link rel="shortcut icon" type="image/x-icon"
	href="<%=request.getContextPath()%>/resources/images/favicon.png" />

<!-- Themefisher Icon font -->
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/resources/plugins/themefisher-font/style.css">
<!-- bootstrap.min css -->
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/resources/plugins/bootstrap/css/bootstrap.min.css">

<!-- Animate css -->
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/resources/plugins/animate/animate.css">
<!-- Slick Carousel -->
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/resources/plugins/slick/slick.css">
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/resources/plugins/slick/slick-theme.css">

<!-- Main Stylesheet -->
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/resources/css/style.css">

<style>
	#result_card img{
		max-width: 100%;
	    height: auto;
	    display: block;
	    padding: 5px;
	    margin-top: 10px;
	    margin: auto;	
	}
	#result_card {
		position: relative;
	}
	.imgDeleteBtn{
	    position: absolute;
	    top: 5%;
	    right: 5%;
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

	<section class="signin-page account">
		<div class="container">
			<div class="row">
				<div class="col-md-6 col-md-offset-3">
					<div class="block text-center">
						<h2 class="text-center">상품 등록</h2>
						<form class="text-left clearfix" id="insertProduct"
							name="insertProduct" role="form" method="post">
							<div class="form-group">
								<span style="font-size: 8px;">*은 필수 입력사항</span> <input
									type="text" class="form-control" placeholder=" *상품분류코드"
									name="typeCode" id="typeCode"> <span
									style="font-size: 8px">&nbsp; 1:한식 &nbsp; 2:양식 &nbsp;
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
								<span style="font-size: 8px;">썸네일이미지 (jpg/png 첨부)</span>
								<input type="file" class="form-control"
									placeholder="썸네일(나중에 첨부로 바꾸기)" name="thumbnailFile" id="thumbnailFile">
								<div id="thumbnailUploadResult">
								</div>
							</div>
							<div class="form-group">
								<span style="font-size: 8px;">상세이미지 (jpg/png 첨부)</span>

								<input type="file" class="form-control"
									placeholder="이미지(나중에 첨부로 바꾸기)" name="image" id="image">
							</div>
							<div class="text-center">
								<button type="submit" class="btn btn-main text-center"
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



</body>

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
		if($(".imgDeleteBtn").length > 0){
			deleteFile();
		}
		
		let formData = new FormData();
		let fileInput = $('input[name="thumbnailFile"]');
		let fileList = fileInput[0].files;
		let fileObj = fileList[0];
		
		console.log("fileObj : " + fileObj);

		console.log("fileName : " + fileObj.name);
		console.log("fileSize : " + fileObj.size);
		console.log("fileType(MimeType) : " + fileObj.type);
		
		/* if(!fileCheck(fileObj.name, fileObj.size)){
			return false;
		} */
		
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

		
	/* var, method related with attachFile */
	let regex = new RegExp("(.*?)\.(jpg|png)$");
	let maxSize = 1048576; //1MB	
	
	function fileCheck(fileName, fileSize){

		if(fileSize >= maxSize){
			alert("파일 사이즈 초과");
			return false;
		}
			  
		if(!regex.test(fileName)){
			alert("해당 종류의 파일은 업로드할 수 없습니다.");
			return false;
		}
		
		return true;		
		
	}
	
	
	/* 이미지 출력 */
	function showUploadImage(uploadResultArr){
		
		/* 전달받은 데이터 검증 */
		if(!uploadResultArr || uploadResultArr.length == 0){return}
		
		let uploadResult = $("#thumbnailUploadResult");
		
		let obj = uploadResultArr[0];
		
		let str = "";
		
		let fileCallPath = encodeURIComponent(obj.uploadPath.replace(/\\/g, '/') + "/" + obj.uuid + "_" + obj.fileName);
		
		str += "<div id='result_card'>";
		str += "<img src='/mealkit/product/display?fileName=" + fileCallPath +"'>";
		str += "<div class='imgDeleteBtn' data-file='" + fileCallPath + "'>x</div>";
		str += "<input type='hidden' name='thumbnail' value='" + obj.uploadPath.replace(/\\/g, '/') + "/" + obj.uuid + "_" + obj.fileName +"'>";
		str += "</div>";		
		
   		uploadResult.append(str);
	}
	
	
	/* 이미지 삭제 버튼 동작 */
	$("#thumbnailUploadResult").on("click", ".imgDeleteBtn", function(e){
		
		deleteFile();
		
	});
	
	
	/* 파일 삭제 메서드 */
	function deleteFile(){
		
		let targetFile = $(".imgDeleteBtn").data("file");
		
		let targetDiv = $("#result_card");
		
		$.ajax({
			url: '/mealkit/product/deleteFile',
			data : {fileName : targetFile},
			dataType : 'text',
			type : 'POST',
			success : function(result){
				console.log(result);
				
				targetDiv.remove();
				$("input[type='file']").val("");
				
			},
			error : function(result){
				console.log(result);
				
				alert("파일을 삭제하지 못하였습니다.")
			}
		});
	}
	
</script>
</html>