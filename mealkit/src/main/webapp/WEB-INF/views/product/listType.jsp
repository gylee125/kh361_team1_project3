<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.sql.SQLException"%>
<%@ page import="java.sql.DriverManager"%>
<%@ page import="java.sql.Connection"%>
<%@ page import="java.sql.PreparedStatement"%>
<%@ page import="java.sql.ResultSet"%>
<%@page import="java.text.DecimalFormat"%>

<%@ include file="../include/header.jspf"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<section class="products section bg-gray">
	<div class="container">
		<div class="row">
			<div class="title text-center">
				<h2>Lists of foods</h2>
			</div>
		</div>
		<div class="row">





			<c:forEach var="product" items="${productList}">



				<div class="col-md-4">
					<div class="product-item">
						<div class="product-thumb">
							<img class="img-responsive"
								src="<%=request.getContextPath()%>${product.thumbnail}"
								alt="product-img" />
							<div class="preview-meta">
								<ul>
									<li><a
										href="<%=request.getContextPath()%>/shop/detail.do?pId=${product.pId}"><i
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
										<input type="hidden" name="pId" value="${product.pId}">
										<li><a
											href="<%=request.getContextPath()%>/addCart.do?mId=${member.mId}&pId=${product.pId}&cquantity=1"><i
												class="tf-ion-android-cart"></i></a></li>
									</c:if>
								</ul>
							</div>
						</div>
						<div class="product-content">
							<h4>
								<a
									href="<%=request.getContextPath()%>/shop/detail.do?pId=${product.pId}">${product.pName}</a>
							</h4>
							<p class="price">${product.price}원</p>
						</div>
					</div>
				</div>
			</c:forEach>


		</div>
	</div>
</section>


<%@ include file="../include/footer.jspf"%>