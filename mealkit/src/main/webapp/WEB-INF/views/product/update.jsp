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

<%@ include file="../include/header.jspf"%>

<c:if test="${not empty productOne}">
	<section class="single-product">
		<div class="container">
			<div class="row">
				<div class="col-md-6">
					<ol class="breadcrumb">
						<li><a href="<%=request.getContextPath()%>/index.do">Home</a></li>
						<li><a href="<%=request.getContextPath()%>/shop/all.do">Shop</a></li>
						<li><a
							href="<%=request.getContextPath()%>/shop/type.do?typeCode=${productOne.typeCode}">${productOne.tNameEng}</a></li>
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
											src='<%=request.getContextPath()%>${productOne.thumbnail}'
											alt='' />
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>

				<div class="col-md-7">
					<div class="single-product-details">
						<form id="updateProductForm">
							<h2>상품 정보 수정</h2>
							<div class="product-category">
								<span>상품번호</span> 
							<input type="text" class="form-control" name="pId" id="pId" value="${productOne.pId}" readonly/>
							</div>
							<div class="product-category">
								<span>상품분류코드 </span>  1:한식   2:양식   3:중식   4:일식   5:기타 
								<input type="text" class="form-control" name="typeCode" id="typeCode" value="${productOne.typeCode} : ${productOne.tName}">
							</div>
							<div class="product-category">
								<span>상품명</span> 
								<input type="text" class="form-control" name="pName" id="pName" value="${productOne.pName}">
							</div>
							<div class="product-category">
								<span>가격</span>
								<input type="text" class="form-control" name="price" id="price" value="${productOne.price}">
							</div>
							<div class="product-category">
								<span>재고수량</span> 
								<input type="text" class="form-control" name="stock" id="stock" value="${productOne.stock}">
							</div>
							<div class="product-category">
								<span>브랜드</span>
								<input type="text" class="form-control" name="brand" id="brand" value="${productOne.brand}">
							</div>
							<div class="product-category">
								<span>상세설명</span>
								<input type="text" class="form-control" name="description" id="description" value="${productOne.description}">
							</div>

							<button type="button" class="btn btn-main mt-20" id="cartBtn"
								onclick="checkQuantity();">UPDATE</button>
							


						</form>



					</div>
				</div>
			</div>

			<script>
	function checkQuantity() {
		let addCartForm = document.getElementById("addCartForm");
		if (addCartForm.cquantity.value > 0)
			addCartForm.submit();
		else
			alert("수량을 하나 이상 골라주세요!!!!")
	}
</script>

		</div>
	</section>

</c:if>

<%@ include file="../include/footer.jspf"%>