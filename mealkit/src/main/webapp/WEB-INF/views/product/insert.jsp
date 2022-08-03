<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

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
<link rel="shortcut icon" type="image/x-icon" href="<%=request.getContextPath()%>/aviato/images/favicon.png" />

<!-- Themefisher Icon font -->
<link rel="stylesheet" href="<%=request.getContextPath()%>/aviato/plugins/themefisher-font/style.css">
<!-- bootstrap.min css -->
<link rel="stylesheet" href="<%=request.getContextPath()%>/aviato/plugins/bootstrap/css/bootstrap.min.css">

<!-- Animate css -->
<link rel="stylesheet" href="<%=request.getContextPath()%>/aviato/plugins/animate/animate.css">
<!-- Slick Carousel -->
<link rel="stylesheet" href="<%=request.getContextPath()%>/aviato/plugins/slick/slick.css">
<link rel="stylesheet" href="<%=request.getContextPath()%>/aviato/plugins/slick/slick-theme.css">

<!-- Main Stylesheet -->
<link rel="stylesheet" href="<%=request.getContextPath()%>/aviato/css/style.css">

</head>

<body id="body">

	<section class="signin-page account">
		<div class="container">
			<div class="row">
				<div class="col-md-6 col-md-offset-3">
					<div class="block text-center">
						<h2 class="text-center">상품 등록</h2>
						<form class="text-left clearfix" id="insertProduct"
							name="insertProduct" action="<%=request.getContextPath()%>/submitInsert.do" method="post">
							<div class="form-group">
								<span style="font-size: 8px;">*은 필수 입력사항</span>
								<input type="text" class="form-control" placeholder=" *상품분류코드"
									name="typeCode" id="typeCode"> <span style="font-size: 8px">&nbsp;
									1:한식 &nbsp; 2:양식 &nbsp; 3:중식 &nbsp; 4:일식 &nbsp; 5:기타 &nbsp; </span>
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
								<input type="text" class="form-control" placeholder="*재고수량"
									name="stock" id="stock">
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
								<input type="text" class="form-control"
									placeholder="썸네일(나중에 첨부로 바꾸기)" name="thumbnail" id="thumbnail">
							</div>
							<div class="form-group">
								<input type="text" class="form-control"
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

	<script type="text/javascript">
		let insertProductForm = document.getElementById("insertProduct");

		function checkForm() {

			if (insertProductForm.typeCode.value == ""
					|| insertProductForm.pName.value == ""
					|| insertProductForm.price.value == ""
					|| insertProductForm.stock.value == ""
					|| insertProductForm.brand.value == "") {
				alert("분류코드,상품명,단가,재고수량,브랜드는 필수입력!!");
				insertProductForm.typeCode.focus();
				return false;
			}

			insertProductForm.submit();

		}
	</script>

	<!-- 
    Essential Scripts
    =====================================-->

	<!-- Main jQuery -->
	<script src="<%=request.getContextPath()%>/aviato/plugins/jquery/dist/jquery.min.js"></script>
	<!-- Bootstrap 3.1 -->
	<script src="<%=request.getContextPath()%>/aviato/plugins/bootstrap/js/bootstrap.min.js"></script>
	<!-- Bootstrap Touchpin -->
	<script
		src="<%=request.getContextPath()%>/aviato/plugins/bootstrap-touchspin/dist/jquery.bootstrap-touchspin.min.js"></script>
	<!-- Instagram Feed Js -->
	<script src="<%=request.getContextPath()%>/aviato/plugins/instafeed/instafeed.min.js"></script>
	<!-- Video Lightbox Plugin -->
	<script src="<%=request.getContextPath()%>/aviato/plugins/ekko-lightbox/dist/ekko-lightbox.min.js"></script>
	<!-- Count Down Js -->
	<script src="<%=request.getContextPath()%>/aviato/plugins/syo-timer/build/jquery.syotimer.min.js"></script>

	<!-- slick Carousel -->
	<script src="<%=request.getContextPath()%>/aviato/plugins/slick/slick.min.js"></script>
	<script src="<%=request.getContextPath()%>/aviato/plugins/slick/slick-animation.min.js"></script>

	<!-- Google Mapl -->
	<script
		src="https://maps.googleapis.com/maps/api/js?key=AIzaSyCC72vZw-6tGqFyRhhg5CkF2fqfILn2Tsw"></script>
	<script type="text/javascript" src="<%=request.getContextPath()%>/aviato/plugins/google-map/gmap.js"></script>

	<!-- Main Js File -->
	<script src="<%=request.getContextPath()%>/aviato/js/script.js"></script>



</body>
</html>