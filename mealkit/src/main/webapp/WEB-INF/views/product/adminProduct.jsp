<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<title>밀슐랭 | 관리자 페이지</title>
<style>
.h {
	font-family: "Poppins", sans-serif;
	color: #888783;
	font-size: 14px;
	letter-spacing: 2px;
}

.table {
	table-layout: auto;
}

#productBtn {
	margin: 10px;
	text-align: right;
}
</style>
</head>
<body id="body">




	<%@ include file="../include/header.jspf"%>

	<section class="page-header">
		<div class="container">
			<div class="row">
				<div class="col-md-12">
					<div class="content">
						<h1 class="page-name">관리자 페이지</h1>
						<ol class="breadcrumb">
							<li><a href="index.html">Home</a></li>
							<li class="active">Admin Page</li>
						</ol>
					</div>
				</div>
			</div>
		</div>
	</section>


	<section class="user-dashboard page-wrapper">
		<div class="container">
			<div class="row">
				<div class="col-md-12">
					<ul class="list-inline dashboard-menu text-center">
						<li><a href="<%=request.getContextPath()%>/adminPage.do">Member</a></li>
						<li><a class="active"
							href="<%=request.getContextPath()%>/product/adminProduct">Product</a></li>
						<li><a href="<%=request.getContextPath()%>/adminOrder.do">Order</a></li>
						<li><a
							href="<%=request.getContextPath()%>/community/adminBoard.do">Board</a></li>
					</ul>
					<div class="dashboard-wrapper user-dashboard">

						<div class="total-order mt-20">
							<div class="table-responsive">
								<table class="table">
									<thead>
										<tr>
											<th>상품번호</th>
											<th>분류코드</th>
											<th>상품명</th>
											<th>가격</th>
											<th>브랜드</th>
										</tr>
									</thead>
									<tbody>
										<c:if test="${!empty productList}">
											<c:forEach var="product" items="${productList}">
												<tr>
													<td>${product.PId}</td>
													<td>${product.typeCode}</td>
													<td>${product.PName}</td>
													<td>${product.price}</td>
													<td>${product.brand}</td>
												</tr>
											</c:forEach>
										</c:if>
										<c:if test="${empty productList}"> 상품이 존재하지 않습니다.</c:if>
									</tbody>
								</table>
							</div>
						</div>

						<div class="row" id="paginationProduct">
							<ul class="post-pagination">

								<!-- href값을 페이지 번호로 대체하여 이를 자바스크립트에서 href값을 통해 form 태그 내 input hidden에 값을 대체하여 form으로 submit -->
								<c:if test="${pageMaker.prev}">
									<li class="paginate_button previous"><a
										href="<%=request.getContextPath()%>/product/adminProduct?page=${pageMaker.startPage-1}">
											prev </a></li>
								</c:if>

								<c:forEach var="num" begin="${pageMaker.startPage}"
									end="${pageMaker.endPage}">
									<li
										class="paginate_button ${pageMaker.cri.page == num ? 'active' :''}">
										<a
										href="<%=request.getContextPath()%>/product/adminProduct?page=${num}">${num}</a>
									</li>
								</c:forEach>

								<c:if test="${pageMaker.next}">
									<li class="paginate_button next"><a
										href="<%=request.getContextPath()%>/product/adminProduct?page=${pageMaker.endPage+1}">
											next </a></li>
								</c:if>

							</ul>


							<form id='actionForm' action="/board/list" method='get'>
								<input type='hidden' name='pageNum'
									value='${pageMaker.cri.page}'> <input type='hidden'
									name='amount' value='${pageMaker.cri.perPageNum}'>
							</form>

							<ul class="list-inline mt-10" id="productBtn">
								<li><a
									href="<%=request.getContextPath()%>/product/register"
									class="btn btn-main btn-small btn-round">Register</a></li>
								<li><a
									href="<%=request.getContextPath()%>/product/listAdmin"
									class="btn btn-main btn-small btn-round">update / delete</a></li>
							</ul>

						</div>

					</div>
				</div>
			</div>
		</div>
	</section>

	<script>
		var actionForm = $("#acionForm");

		$(".pagination_button a").on("click", function(e) {

			e.preventDefault();
			actionForm.find("input[name='page']").val($(this).attr("href"));
			actionForm.submit();
		});
	</script>

	<%@ include file="../include/footer.jspf"%>