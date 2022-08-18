<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="../include/header.jspf"%>

<section class="page-header">
	<div class="container">
		<div class="row">
			<div class="col-md-12">
				<div class="content">
					<h1 class="page-name">My account</h1>
					<ol class="breadcrumb">
						<li><a href="<%=request.getContextPath()%>/index.do">Home</a></li>
						<li class="active">my account</li>
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
					<li><a href="#!">My account</a></li>
					<!-- <li><a class="active" href="order.html">Orders</a></li>
					<li><a href="<%=request.getContextPath()%>/aviato/address.html">Address</a></li>
					<li><a href="<%=request.getContextPath()%>/aviato/profile-details.html">Profile</a></li> -->
				</ul>
				<ul class="dropdown-menu search-dropdown">
					<li>
						<form action="<%=request.getContextPath()%>/product/search"
							role="form">
							<input type="text" name="keyword" id="keyword"
								class="form-control" placeholder="상품 검색">
						</form>
					</li>
				</ul>
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
							<tbody>
								<c:forEach var="order" items="${orderList}">
									<tr>
										<td>${order.oId}</td>
										<td><fmt:formatDate value="${order.oDate}" pattern="yyyy-MM-dd"/></td>
										<td>${order.mId}</td>
										<td>${order.pName}</td>
										<td>${order.quantity}</td>
										<td><fmt:formatNumber value="${order.price}" pattern="###,####,###"/>원</td>
										<td><span class="label label-primary">${order.statusName}</span></td>
										<td><a class="product-remove"
											href="detailAdmin.do?oId=${order.oId}">수정</a></td>
									</tr>
								</c:forEach>
							</tbody>
						</table>
					</div>
				</div>
			</div>
		</div>
	</div>
</section>

<%@ include file="../include/footer.jspf"%>
