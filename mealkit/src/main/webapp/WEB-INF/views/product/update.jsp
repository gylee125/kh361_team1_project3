<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.sql.DriverManager"%>
<%@ page import="java.sql.Connection"%>
<%@ page import="java.sql.PreparedStatement"%>
<%@ page import="java.sql.ResultSet"%>
<%@ page import="java.sql.SQLException"%>
<%@page import="java.text.DecimalFormat"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html>
<head>
<title>밀슐랭 | 관리자 페이지</title>
<style>
#updateProductForm {
	margin-top: -90px;
	margin-left: -30px;
	padding: 0px;
}
</style>
</head>
<body id="body">
<%@ include file="../include/header.jspf"%>

<c:if test="${not empty productOne}">
	<section class="single-product">
		<div class="container">
			<div class="row">
				<div class="col-md-6">
					<ol class="breadcrumb">
						<li><a href="<%=request.getContextPath()%>/index.do">Home</a></li>
						<li><a href="<%=request.getContextPath()%>/product/listAll">Shop</a></li>
						<li><a
							href="<%=request.getContextPath()%>/product/listType?typeCode=${productOne.typeCode}">${productOne.TNameEng}</a></li>
					</ol>
				</div>
			</div>
			<div class="row mt-20">
				<div class="col-md-5">
					<div class="single-product-slider">
						<div id='carousel-custom' class='carousel slide'
							data-ride='carousel'>
							<div class='carousel-outer'>
								<!-- me art lab slider -->
								<div class='carousel-inner '>
									<div class='item active'>
										<img
											src='<%=request.getContextPath()%>/product/display?fileName=${productOne.thumbnail}'
											alt='' />
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>

				<div class="col-md-7">
					<div class="single-product-details">
						<form id="updateProductForm" role="form" method="post">
							<h2>상품 정보 수정</h2>
							<div class="product-category">
								<span>상품번호</span> 
							<input type="text" class="form-control" name="pId" id="pId" value="${productOne.PId}" readonly/>
							</div>
							<div class="product-category">
								<span>상품분류코드* </span>  1:한식 &nbsp; 2:양식 &nbsp; 3:중식 &nbsp; 4:일식 &nbsp; 5:기타 &nbsp; 
								<input type="text" class="form-control" name="typeCode" id="typeCode" value="${productOne.typeCode}">
							</div>
							<div class="product-category">
								<span>상품명*</span> 
								<input type="text" class="form-control" name="PName" id="PName" value="${productOne.PName}">
							</div>
							<div class="product-category">
								<span>가격*</span>
								<input type="text" class="form-control" name="price" id="price" value="${productOne.price}">
							</div>
							<div class="product-category">
								<span>브랜드*</span>
								<input type="text" class="form-control" name="brand" id="brand" value="${productOne.brand}">
							</div>
							<div class="product-category">
								<span>상세설명</span>
								<input type="text" class="form-control" name="description" id="description" value="${productOne.description}">
							</div>

							<button type="submit" class="btn btn-main mt-20" id="updateBtn">UPDATE</button>
							


						</form>



					</div>
				</div>
			</div>


		</div>
	</section>

</c:if>

<%@ include file="../include/footer.jspf"%>