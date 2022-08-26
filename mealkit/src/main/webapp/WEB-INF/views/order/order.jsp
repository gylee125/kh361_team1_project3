<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

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
					<!-- <li><a href="#!">My account</a></li> -->
					<!-- <li><a class="active" href="order.html">Orders</a></li>
					<li><a href="<%=request.getContextPath()%>/aviato/address.html">Address</a></li>
					<li><a href="<%=request.getContextPath()%>/aviato/profile-details.html">Profile</a></li> -->
				</ul>

				<div class="dashboard-wrapper user-dashboard">
					<div class="table-responsive">
						<table class="table">
							<thead>
								<tr>
									<th>주문번호</th>
									<th>주문일자</th>
									<th>상품명</th>
									<th>상품수량</th>
									<th>결제금액</th>
									<th>주문현황</th>
									<th>상세보기</th>
									<th></th>
								</tr>
							</thead>
							<tbody>
								<c:forEach var="order" items="${orderList}">
									<tr>
										<td>${order.oId}</td>
										<td><fmt:formatDate value="${order.oDate}"
												pattern="yyyy-MM-dd" /></td>
										<td>${order.pName}</td>
										<td>${order.quantity}</td>
										<td><fmt:formatNumber value="${order.price}"
												pattern="###,####,###" />원</td>
										<td><span class="label label-primary">${order.statusName}</span></td>
										<td><a
											href="<%=request.getContextPath()%>/order-detail.do?oId=${order.oId}">상세보기</a></td>
										<!-- <td><a href="<%=request.getContextPath()%>/orderDetail.do?MId=${member.MId}&oId=${order.oId}" class="btn btn-default">View</a></td>  -->
									</tr>
								</c:forEach>
							</tbody>
						</table>
					</div>
				</div>
			</div>
		</div>
	</div>
	<%-- <div class="text-center">
		<ul class="pagination post-pagination">
			<c:if test="${pageMaker.prev}">
				<li><a
					href="order.do${pageMaker.makeQuery(pageMaker.startPage - 1)}">Prev</a></li>
			</c:if>

			<c:forEach begin="${pageMaker.startPage }"
				end="${pageMaker.endPage }" var="idx">
				<li 
					<c:out value="${pageMaker.cri.page == idx?'class =active':''}"/>>
					<a href="order.do${pageMaker.makeQuery(idx)}">${idx}</a>
				</li>
			</c:forEach>

			<c:if test="${pageMaker.next && pageMaker.endPage > 0}">
				<li><a
					href="order.do${pageMaker.makeQuery(pageMaker.endPage +1) }">Next</a></li>
			</c:if>
		</ul>

		<form id='actionForm' action="/order/order" method='get'>
			<input type='hidden' name='pageNum' value='${pageMaker.cri.page}'>
			<input type='hidden' name='amount'
				value='${pageMaker.cri.perPageNum}'>
		</form>
	</div> --%>
</section>


<%@ include file="../include/footer.jspf"%>
