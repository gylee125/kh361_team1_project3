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

.search-wrap {
	margin-top: 35px;
	margin-left: 375px;
}

.search-wrap #keywordInput {
	height: 25px;
	width: 290px;
}

.search-wrap button {
	height: 25px;
	width: 25px;
}
</style>

</head>
<body id="body">
	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
	<script>
		$(document).ready(
				function() {
					$('#searchBtn').on(
							"click",
							function(event) {
								location.href = "adminOrder.do"
										+ '${pageMaker.makeQuery(1)}'
										+ "&searchType="
										+ $("select option:selected").val()
										+ "&keyword="
										+ $('#keywordInput').val();
							});
				});
	</script>


	<!-- 취합할 때 협의해서 해당 업무 폴더로 옮기기 -->




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
						<li><a
							href="<%=request.getContextPath()%>/product/adminProduct">Product</a></li>
						<li><a class="active"
							href="<%=request.getContextPath()%>/adminOrder.do">Order</a></li>
						<li><a
							href="<%=request.getContextPath()%>/community/adminBoard.do">Board</a></li>
					</ul>

					<!--  시간이 된다면 검색 기능 넣기 -->
					<div class="search-wrap">
						<select name="searchType">

							<option value="i"
								<c:out value="${cri.searchType eq 'i'?'selected':''}"/>>아이디</option>
							<option value="n"
								<c:out value="${cri.searchType eq 'n'?'selected':''}"/>>주문번호</option>
						</select> <input type="text" name='keyword' id="keywordInput"
							value='${cri.keyword }'>
						<button id='searchBtn'>
							<i class="tf-ion-ios-search-strong"></i>
						</button>
					</div>

					<div class="dashboard-wrapper user-dashboard">
						<div class="table-responsive">
							<table class="table">
								<thead>
									<tr>
										<th>주문번호</th>
										<th>주문일자</th>
										<th>아이디</th>
										<th>상품명</th>
										<th>상품수량</th>
										<th>결제금액</th>
										<th>주문현황</th>
										<th>선택</th>
									</tr>
								</thead>
								<c:if test="${orderList.size() != 0}">
									<tbody>
										<c:forEach var="order" items="${orderList}">
											<tr>
												<td>${order.oId}</td>
												<td><fmt:formatDate value="${order.oDate}"
														pattern="yyyy-MM-dd" /></td>
												<td>${order.mId}</td>
												<td>${order.pName}</td>
												<td>${order.quantity}</td>
												<td><fmt:formatNumber value="${order.price}"
														pattern="###,####,###" />원</td>
												<td><span class="label label-primary">${order.statusName}</span></td>
												<td><a class="product-remove"
													href="detailAdmin.do?oId=${order.oId}">수정</a></td>
											</tr>
										</c:forEach>
									</tbody>
								</c:if>
								<c:if test="${orderList.size() == 0}">
									<tr>
										<td colspan="6" align="center">
											<h4>조회된 결과가 없습니다.</h4>
										</td>
									</tr>
								</c:if>
							</table>
						</div>
					</div>
				</div>
			</div>
		</div>
		<div class="text-center">
			<ul class="pagination post-pagination">
				<c:if test="${pageMaker.prev}">
					<li><a
						href="adminOrder.do${pageMaker.makeSearch(pageMaker.startPage - 1)}">Prev</a></li>
				</c:if>
				
				<c:forEach begin="${pageMaker.startPage}" end="${pageMaker.endPage}"
					var="idx">
					<li
						<c:out value="${pageMaker.cri.page == idx?'class=active':''}"/>>
						<a href="adminOrder.do${pageMaker.makeSearch(idx)}">${idx}</a>
					</li>
				</c:forEach>
				
				<c:if test="${pageMaker.next && pageMaker.endPage > 0}">
					<li><a
						href="adminOrder.do${pageMaker.makeSearch(pageMaker.endPage +1) }">Next</a></li>
				</c:if>
			</ul>

			<form id='actionForm' action="/order/adminOrder" method='get'>
				<input type='hidden' name='pageNum' value='${pageMaker.cri.page}'>
				<input type='hidden' name='amount'
					value='${pageMaker.cri.perPageNum}'>
			</form>

		</div>
	</section>


	<%@ include file="../include/footer.jspf"%>

</body>
</html>