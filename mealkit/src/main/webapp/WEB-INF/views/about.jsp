<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ include file="./include/header.jspf"%>


<section class="page-header">
	<div class="container">
		<div class="row">
			<div class="col-md-12">
				<div class="content">
					<h1 class="page-name">About Us</h1>
					<ol class="breadcrumb">
						<li class="active">project description </li>
					</ol>
				</div>
			</div>
		</div>
	</div>
</section>

<section class="about section">
	<div class="container">
		<div class="row">
			<div class="col-md-6">
				<h2 class="mt-40">
					kh강남361 오후반 - Team1 PROJECT<br>
					<br> 밀키트 쇼핑몰 "밀슐랭"
				</h2>
				<br>
				<p>이가영 강상훈 김우석 김한얼 박진선 양지혜 정예슬 최성원</p>
			</div>
		</div>
	</div>
</section>
<section>
	<div
		class="section video-testimonial bg-1 overly-white text-center mt-50">
		<div class="container">
			<div class="row">
				<div class="col-md-12">
					<h2>Video presentation</h2>
					<a class="play-icon" href="https://youtu.be/eXMZk88Fi98"
						data-toggle="lightbox"> <i class="tf-ion-ios-play"></i>
					</a>
				</div>
			</div>
		</div>
	</div>
</section>
<section class="team-members section">
	<div class="container">
		<div class="row">
			<div class="title">
				<h2>Reference</h2>
			</div>
		</div>
		<div class="row">
			<div class="col-md-3">
				<div class="team-member text-center"></div>
			</div>
			<div class="col-md-3">
				<div class="team-member text-center">
					<a href="https://www.kurly.com/shop/main/index.php"> <img
						class="img-responsive"
						src="<%=request.getContextPath()%>/resources/images/about/marketKurly.png"></a>
					<h4>Market Kurly</h4>
					<p>mealkit product sample</p>
				</div>
			</div>
			<div class="col-md-3">
				<div class="team-member text-center">
					<a href="https://themefisher.com/"> <img class="img-responsive"
						src="<%=request.getContextPath()%>/resources/images/about/Themefisher.png"></a>
					<h4>Themefisher</h4>
					<p>Template Design</p>
				</div>
			</div>
			<div class="col-md-3">
				<div class="team-member text-center"></div>
			</div>

		</div>
	</div>
</section>





<%@ include file="./include/footer.jspf"%>