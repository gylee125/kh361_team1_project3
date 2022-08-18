<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!-- 
THEME: Aviato | E-commerce template
VERSION: 1.0.0
AUTHOR: Themefisher

HOMEPAGE: https://themefisher.com/products/resources-e-commerce-template/
DEMO: https://demo.themefisher.com/resources/
GITHUB: https://github.com/themefisher/resources-E-Commerce-Template/

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
<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/plugins/animate/animate.css">
<!-- Slick Carousel -->
<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/plugins/slick/slick.css">
<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/plugins/slick/slick-theme.css">

<!-- Main Stylesheet -->
<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/style.css">

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

	<!-- Start Top Header Bar -->
	<section class="top-header">
		<div class="container">
			<div class="row">
				<div class="col-md-4 col-xs-12 col-sm-4">
<!-- 					<div class="contact-number">
						<i class="tf-ion-ios-telephone"></i> <span>0129-
							12323-12312</span>
					</div> -->
				</div>
				<div class="col-md-4 col-xs-12 col-sm-4">
					<!-- Site Logo -->
					<div class="logo text-center">
						<a href="<%=request.getContextPath()%>/"> <!-- replace logo here -->
							<svg width="135px" height="37px" viewBox="0 0 155 29"
								version="1.1" xmlns="http://www.w3.org/2000/svg"
								xmlns:xlink="http://www.w3.org/1999/xlink">
							<g id="Page-1" stroke="none" stroke-width="1" fill="none"
									fill-rule="evenodd" font-size="40"
									font-family="AustinBold, Austin" font-weight="bold">
								<g id="Group" transform="translate(-108.000000, -297.000000)"
									fill="#000000">

									<text id="AVIATO">
										<tspan x="108.94" y="325">밀슐랭</tspan>
									</text>
								</g>
							</g>
						</svg>
						</a>
					</div>
				</div>
				<div class="col-md-4 col-xs-12 col-sm-4">
					<!-- Cart -->
					<ul class="top-menu text-right list-inline">
					
					
						<c:if test="${member == null}">
							<!-- 로그인 정보가 없을 때 -->
							<li class="dropdown cart-nav dropdown-slide"><a
								href="<%=request.getContextPath()%>/notLoginCart.do"
								class="dropdown-toggle"><i class="tf-ion-android-cart"></i>Cart</a>
							</li>
						</c:if>
						<c:if test="${member != null}">
							<!-- 로그인 정보가 있을 때 -->
							<li class="dropdown cart-nav dropdown-slide"><a
								href="<%=request.getContextPath()%>/cart.do?MId=${ member.MId }"
								class="dropdown-toggle"><i class="tf-ion-android-cart"></i>Cart</a>
							</li>
						</c:if>
						
						
							<!--
							<div class="dropdown-menu cart-dropdown">
								<!-- Cart Item -->
								<!--<div class="media">
									<a class="pull-left" href="#!"> <img class="media-object"
										src="<%=request.getContextPath()%>/resources/images/shop/cart/cart-1.jpg"
										alt="image" />
									</a>
									<div class="media-body">
										<h4 class="media-heading">
											<a href="#!">Ladies Bag</a>
										</h4>
										<div class="cart-price">
											<span>1 x</span> <span>1250.00</span>
										</div>
										<h5>
											<strong>$1200</strong>
										</h5>
									</div>
									<a href="#!" class="remove"><i class="tf-ion-close"></i></a>
								</div>
								<!-- / Cart Item -->
								<!-- Cart Item -->
								<!--<div class="media">
									<a class="pull-left" href="#!"> <img class="media-object"
										src="<%=request.getContextPath()%>/resources/images/shop/cart/cart-2.jpg"
										alt="image" />
									</a>
									<div class="media-body">
										<h4 class="media-heading">
											<a href="#!">Ladies Bag</a>
										</h4>
										<div class="cart-price">
											<span>1 x</span> <span>1250.00</span>
										</div>
										<h5>
											<strong>$1200</strong>
										</h5>
									</div>
									<a href="#!" class="remove"><i class="tf-ion-close"></i></a>
								</div>
								<!-- / Cart Item -->

								<!--<div class="cart-summary">
									<span>Total</span> <span class="total-price">$1799.00</span>
								</div>
								<ul class="text-center cart-buttons">
									<li><a href="<%=request.getContextPath()%>/cart.do" class="btn btn-small">View
											Cart</a></li>
									<li><a href="<%=request.getContextPath()%>/checkout.do"
										class="btn btn-small btn-solid-border">Checkout</a></li>
								</ul>
							</div></li>
						<!-- / Cart -->
						
						
						<!-- Order -->
						
						<c:if test="${member == null}">
							<!-- 로그인 정보가 없을 때 -->
							<li class="dropdown cart-nav dropdown-slide"><a
								href="<%=request.getContextPath()%>/notLoginCart.do"
								class="dropdown-toggle">Order</a>
							</li>
						</c:if>
						<c:if test="${member != null}">
							<!-- 로그인 정보가 있을 때 -->
							<li class="dropdown cart-nav dropdown-slide"><a
								href="<%=request.getContextPath()%>/order.do?MId=${member.MId}"
								class="dropdown-toggle">Order</a>
							</li>
						</c:if>
						<!-- /Order -->
						
						
						
						
						
						<!-- Search -->
						<li class="dropdown search dropdown-slide"><a href="#!"
							class="dropdown-toggle" data-toggle="dropdown"
							data-hover="dropdown"><i class="tf-ion-ios-search-strong"></i>
								Search</a>
							<ul class="dropdown-menu search-dropdown">
								<li>
									<form action="<%=request.getContextPath()%>/product/search" role="form">
										<input type="text" name="keyword" id="keyword" class="form-control" placeholder="상품 검색">
									</form>
								</li>
							</ul></li>
						<!-- / Search -->
						
						
						<!-- logIn -->
						<li class="dropdown dropdown-slide"><a href="#!"
							class="dropdown-toggle" data-toggle="dropdown"
							data-hover="dropdown" data-delay="350" role="button"
							aria-haspopup="true" aria-expanded="false"> LogIn <span
								class="tf-ion-ios-arrow-down"></span></a>
							<ul class="dropdown-menu">
								<c:if test="${member == null}">
									<li><a href="<%=request.getContextPath()%>/login.do">logIn</a></li>
									<li><a href="<%=request.getContextPath()%>/signUp.do">signUp</a></li>
								</c:if>
								<c:if test="${member != null and member.MLevel == 1}">
									<li>${member.MName} 님께서 로그인 중입니다.</li>
									<li><a href="<%=request.getContextPath()%>/myPage.do?MId=${member.MId}">My Page</a></li>
									<li><a href="logout.do">Logout</a></li>
								</c:if>
								<c:if test="${member != null and member.MLevel == 2}">
									<li>[관리자 모드]<br> ${member.MName} 님께서 로그인 중입니다.</li>
									<li><a href="<%=request.getContextPath()%>/adminPage.do">Admin Page</a></li>
									<li><a href="logout.do">Logout</a></li>
								</c:if>
							</ul></li>

					</ul>
					<!-- / .nav .navbar-nav .navbar-right -->

				</div>
			</div>
		</div>
	</section>
	<!-- End Top Header Bar -->


	<!-- Main Menu Section -->
	<section class="menu">
		<nav class="navbar navigation">
			<div class="container">
				<div class="navbar-header">
					<h2 class="menu-title">Main Menu</h2>
					<button type="button" class="navbar-toggle collapsed"
						data-toggle="collapse" data-target="#navbar" aria-expanded="false"
						aria-controls="navbar">
						<span class="sr-only">Toggle navigation</span> <span
							class="icon-bar"></span> <span class="icon-bar"></span> <span
							class="icon-bar"></span>
					</button>

				</div>
				<!-- / .navbar-header -->


							<!-- Navbar Links -->
							<div id="navbar" class="navbar-collapse collapse text-center">
								<ul class="nav navbar-nav">

									<!-- Home -->
									<li class="dropdown "><a
										href="<%=request.getContextPath()%>">Home</a>
									</li>
									<!-- / Home -->


									<!-- shop -->
									<li class="dropdown dropdown-slide"><a href="#!"
										class="dropdown-toggle" data-toggle="dropdown"
										data-hover="dropdown" data-delay="350" role="button"
										aria-haspopup="true" aria-expanded="false">Shop <span
											class="tf-ion-ios-arrow-down"></span></a>
										<ul class="dropdown-menu">
											<li><a href="<%=request.getContextPath()%>/product/listAll?page=1">all</a></li>
											<li><a
												href="<%=request.getContextPath()%>/product/listType?typeCode=1">korean</a></li>
											<li><a
												href="<%=request.getContextPath()%>/product/listType?typeCode=2">western</a></li>
											<li><a
												href="<%=request.getContextPath()%>/product/listType?typeCode=3">chinese</a></li>
											<li><a
												href="<%=request.getContextPath()%>/product/listType?typeCode=4">japanese</a></li>
											<li><a
												href="<%=request.getContextPath()%>/product/listType?typeCode=5">etc</a></li>

										</ul></li>
									<!-- / shop -->



									<!-- Board -->
									<li class="dropdown dropdown-slide"><a href="#!"
										class="dropdown-toggle" data-toggle="dropdown"
										data-hover="dropdown" data-delay="350" role="button"
										aria-haspopup="true" aria-expanded="false"> Board <span
											class="tf-ion-ios-arrow-down"></span></a>

										<ul class="dropdown-menu">
											<li><a
												href="<%=request.getContextPath()%>/index.do">Q&A</a></li>
											<li><a
												href="<%=request.getContextPath()%>/index.do">Community</a></li>
											<li><a
												href="<%=request.getContextPath()%>/index.do">Review</a></li>
										</ul></li>
									<!-- / Board -->
									
									
									
									<!-- Notice -->
									<li class="dropdown "><a
										href="<%=request.getContextPath()%>/index.do">Notice</a>
									</li>
									<!-- / Notice -->
									
									
									
									<!-- About Us -->
									<li class="dropdown "><a
										href="<%=request.getContextPath()%>/about">About Us</a>
									</li>
									<!-- / About Us -->

									<!-- Admin 관리자 메뉴 -->
									<c:if test="${member.MLevel eq 2}">관리자만 아래 메뉴보이게?? 아니면 아예 관리자페이지를 따로 만들까? 팀원들과 의논필요</c:if>
									<li class="dropdown dropdown-slide">
										<a href="#!" class="dropdown-toggle" data-toggle="dropdown" data-hover="dropdown" data-delay="350"
											role="button" aria-haspopup="true" aria-expanded="false">Admin <span
												class="tf-ion-ios-arrow-down"></span></a>
										<div class="dropdown-menu">
											<div class="row">
				
												<!-- Basic -->
												<div class="col-lg-6 col-md-6 mb-sm-3">
													<ul>
														<li class="dropdown-header">Product</li>
														<li role="separator" class="divider"></li>
														<li><a href="<%=request.getContextPath()%>/product/register">Register</a></li>
														<li><a href="<%=request.getContextPath()%>/product/listAdmin">update / delete</a></li>
													</ul>
												</div>
				
												<!-- Layout -->
												<div class="col-lg-6 col-md-6 mb-sm-3">
													<ul>
														<li class="dropdown-header">관리자메뉴 필요시 사용</li>
														<li role="separator" class="divider"></li>
														<li><a href="<%=request.getContextPath()%>/index">Product Details</a></li>
														<li><a href="<%=request.getContextPath()%>/index">Shop With Sidebar</a></li>
				
													</ul>
												</div>
				
											</div><!-- / .row -->
										</div><!-- / .dropdown-menu -->
									</li><!-- / Elements -->
									
									<!-- / Admin -->
									

								</ul>
								<!-- / .nav .navbar-nav -->

							</div>
							<!--/.navbar-collapse -->
						</div>
						<!-- / .container -->
					</nav>
				</section>
			</div>
		</nav>
	</section>

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
								<span style="font-size: 8px;">썸네일이미지 (이미지파일만 첨부가능)</span>
								<input type="file" class="form-control"
									placeholder="썸네일(나중에 첨부로 바꾸기)" name="thumbnailFile" id="thumbnailFile">
								<div id="thumbnailUploadResult">
								</div>
							</div>
							<div class="form-group">
								<span style="font-size: 8px;">상세이미지 (이미지파일만 첨부가능)</span>
								<input type="file" class="form-control"
									placeholder="이미지(나중에 첨부로 바꾸기)" name="imageFile" id="imageFile">
								<div id="imageUploadResult">
								</div>
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