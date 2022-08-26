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

#searchBox {
	margin: 30px 0;
	text-align: right;
}

#productBtn {
	margin: 10px;
	text-align: right;
}

#keywordInput {
	width: 200px;
	height: 30px;
	letter-spacing: 2px;
	text-transform: uppercase;
	color: #000;
	font-size: 12px;
	border: 1px solid #e5e5e5;
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
						<div class="list-inline mt-10" id="searchBox">
							<form role="form">

								<select name="searchType">
									<option value="null"
										<c:out value="${cri.searchType == null?'selected':''}"/>>
										---</option>
									<option value="n"
										<c:out value="${cri.searchType eq 'n'?'selected':''}"/>>
										상품명</option>
									<option value="b"
										<c:out value="${cri.searchType eq 'b'?'selected':''}"/>>
										브랜드</option>
									<option value="d"
										<c:out value="${cri.searchType eq 'd'?'selected':''}"/>>
										상품설명</option>
									<option value="nb"
										<c:out value="${cri.searchType eq 'nb'?'selected':''}"/>>
										상품명 OR 브랜드</option>
									<option value="nd"
										<c:out value="${cri.searchType eq 'nd'?'selected':''}"/>>
										상품명 OR 상품설명</option>
									<option value="nbd"
										<c:out value="${cri.searchType eq 'nbd'?'selected':''}"/>>
										상품명 OR 브랜드 OR 상품설명</option>
								</select> <input type="text" name='keyword' id="keywordInput"
									value='${cri.keyword }'>
								<button class="btn btn-main btn-small btn-round" id='searchBtn'>Search</button>


							</form>
						</div>


						<div class="table-responsive">
							<table class="table">
								<thead>
									<tr>
										<th>상품번호</th>
										<th>분류코드</th>
										<th>상품명</th>
										<th>가격</th>
										<th>브랜드</th>
										<th>상품설명</th>
										<th>상세페이지[고객용]</th>
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
												<td>${product.description}</td>
												<td><a
													href="<%=request.getContextPath()%>/product/detail?pId=${product.PId}"
													class="btn btn-main btn-small btn-round">VIEW</a></td>
											</tr>
										</c:forEach>
									</c:if>
									<c:if test="${empty productList}">
										<td colspan="7" align="center">상품이 존재하지 않습니다.</td>
									</c:if>
								</tbody>
							</table>
						</div>
					</div>
				</div>
			</div>
			<div>

				<ul class="list-inline mt-10" id="productBtn">
					<li><a href="<%=request.getContextPath()%>/product/register"
						class="btn btn-main btn-medium btn-round">Register</a></li>
					<li><a href="<%=request.getContextPath()%>/product/listAdmin"
						class="btn btn-main btn-medium btn-round">update / delete</a></li>
				</ul>
	
			</div>
		</div>


		<div class="text-center">
			<ul class="pagination post-pagination">
				<c:if test="${pageMaker.prev}">
					<li class="paginate_button previous"><a
						href="adminProduct${pageMaker.makeSearch(pageMaker.startPage - 1)}">
							prev </a></li>
				</c:if>

				<c:forEach var="num" begin="${pageMaker.startPage}"
					end="${pageMaker.endPage}">
					<li
						class="paginate_button ${pageMaker.cri.page == num ? 'active' :''}">
						<a href="adminProduct${pageMaker.makeSearch(num)}">${num}</a>
					</li>
				</c:forEach>

				<c:if test="${pageMaker.next && pageMaker.endPage > 0}">
					<li class="paginate_button next"><a
						href="adminProduct${pageMaker.makeSearch(pageMaker.endPage +1) }">
							next </a></li>
				</c:if>
			</ul>
			<div>
				<form id='actionForm' action="/product/adminProduct" method='get'>
					<input type='hidden' name='pageNum' value='${pageMaker.cri.page}'>
					<input type='hidden' name='amount'
						value='${pageMaker.cri.perPageNum}'>
				</form>
			</div>

		</div>
	</section>

	<script>
		$(document).ready(
				function() {

					$('#searchBtn').on(
							"click",
							function(event) {
								self.location = "list"
										+ '${pageMaker.makeQuery(1)}'
										+ "&searchType="
										+ $("select option:selected").val()
										+ "&keyword="
										+ $('#keywordInput').val();
							});

				});
	</script>



	<%@ include file="../include/footer.jspf"%>