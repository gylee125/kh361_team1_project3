<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ include file="./include/header.jspf"%>

<div class="hero-slider">

	<div class="slider-item th-fullpage hero-area"
		style="background-image: url(<%=request.getContextPath()%>/aviato/images/slider/korean.jpg);">
		<div class="container">
			<div class="row">
				<div class="col-lg-8 text-center">
					<p data-duration-in=".3" data-animation-in="fadeInUp"
						data-delay-in=".1">한식 KOREAN FOOD</p>
					<h1 data-duration-in=".3" data-animation-in="fadeInUp"
						data-delay-in=".5">
						Tangy, salty, sweet and spicy.<br> Korean food is all of
						that.
					</h1>
					<a data-duration-in=".3" data-animation-in="fadeInUp"
						data-delay-in=".8" class="btn"
						href="<%=request.getContextPath()%>/shop/type.do?typeCode=1">Shop
						Now</a>
				</div>
			</div>
		</div>
	</div>
	<div class="slider-item th-fullpage hero-area"
		style="background-image: url(<%=request.getContextPath()%>/aviato/images/slider/western.jpg);">
		<div class="container">
			<div class="row">
				<div class="col-lg-8 text-left">
					<p data-duration-in=".3" data-animation-in="fadeInUp"
						data-delay-in=".1">양식 WESTERN FOOD</p>
					<h1 data-duration-in=".3" data-animation-in="fadeInUp"
						data-delay-in=".5">
						Western foods are an expression <br> of the people and their
						experiences.
					</h1>
					<a data-duration-in=".3" data-animation-in="fadeInUp"
						data-delay-in=".8" class="btn"
						href="<%=request.getContextPath()%>/shop/type.do?typeCode=2">Shop
						Now</a>
				</div>
			</div>
		</div>
	</div>
	<div class="slider-item th-fullpage hero-area"
		style="background-image: url(<%=request.getContextPath()%>/aviato/images/slider/chinese.jpg);">
		<div class="container">
			<div class="row">
				<div class="col-lg-8 text-right">
					<p data-duration-in=".3" data-animation-in="fadeInUp"
						data-delay-in=".1">중식 CHINESE FOOD</p>
					<h1 data-duration-in=".3" data-animation-in="fadeInUp"
						data-delay-in=".5">
						Chinese cuisine is based on <br> years of study and wisdom.
					</h1>
					<a data-duration-in=".3" data-animation-in="fadeInUp"
						data-delay-in=".8" class="btn"
						href="<%=request.getContextPath()%>/shop/type.do?typeCode=3">Shop
						Now</a>
				</div>
			</div>
		</div>
	</div>
</div>

<%-- <section class="product-category section">
	<div class="container">
		<div class="row">
			<div class="col-md-12">
				<div class="title text-center">
					<h2>Product Category</h2>
				</div>
			</div>
			<div class="col-md-6">
				<div class="category-box">
					<a href="#!">
						<img src="<%=request.getContextPath()%>/aviato/images/shop/category/category-1.jpg" alt="" />
						<div class="content">
							<h3>Clothes Sales</h3>
							<p>Shop New Season Clothing</p>
						</div>
					</a>	
				</div>
				<div class="category-box">
					<a href="#!">
						<img src="<%=request.getContextPath()%>/aviato/images/shop/category/category-2.jpg" alt="" />
						<div class="content">
							<h3>Smart Casuals</h3>
							<p>Get Wide Range Selection</p>
						</div>
					</a>	
				</div>
			</div>
			<div class="col-md-6">
				<div class="category-box category-box-2">
					<a href="#!">
						<img src="<%=request.getContextPath()%>/aviato/images/shop/category/category-3.jpg" alt="" />
						<div class="content">
							<h3>Jewellery</h3>
							<p>Special Design Comes First</p>
						</div>
					</a>	
				</div>
			</div>
		</div>
	</div>
</section> --%>

<section class="products section bg-gray">
	<div class="container">
		<div class="row">
			<div class="title text-center">
				<h2>New Arrivals</h2>
			</div>
		</div>
		<div class="row">

			<c:forEach var="productList" items="${productList}">
				<div class="col-md-4">
					<div class="product-item">
						<div class="product-thumb">
							<img class="img-responsive"
								src="<%=request.getContextPath()%>${productList.thumbnail}"
								alt="product-img" />
							<div class="preview-meta">
								<ul>
									<li><a
										href="<%=request.getContextPath()%>/shop/detail.do?pId=${productList.pId}"><i
											class="tf-ion-ios-search-strong"></i></a></li>
											
											
									<c:if test="${member == null}">
										<!-- 로그인 정보가 없을 때 -->
										<li><a
											href="<%=request.getContextPath()%>/notLoginCart.do"
											class="dropdown-toggle"><i class="tf-ion-android-cart"></i></a>
										</li>
									</c:if>
									<c:if test="${member != null}">
										<!-- 로그인 정보가 있을 때 -->
										<input type="hidden" name=mId value="${member.mId}">
                  						<input type="hidden" name="pId" value="${productOne.pId}">		
										<li><a
											href="<%=request.getContextPath()%>/addCart.do?mId=${member.mId}&pId=${productList.pId}&cquantity=1"><i
												class="tf-ion-android-cart"></i></a></li>
									</c:if>
									
									
								</ul>
							</div>
						</div>
						<div class="product-content">
							<h4>
								<a
									href="<%=request.getContextPath()%>/shop/detail.do?pId=${productList.pId}">${productList.pName}</a>
							</h4>
							<p class="price">${productList.price}원
							</p>
						</div>
					</div>
				</div>

			</c:forEach>

		</div>
	</div>
</section>


<%@ include file="./include/footer.jspf"%>