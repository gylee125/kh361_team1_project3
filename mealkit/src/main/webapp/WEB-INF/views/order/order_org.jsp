<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="../include/header.jspf" %>

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
									<th>상세확인</th>
								</tr>
							</thead>
							<tbody>
								<c:forEach var="order" items="${orderList}">
								<tr>
									<td> ${order.oId} </td>
									<td>${order.oDate}</td>
									<td>${order.pName}</td>
									<td>${order.quantity}</td>
									<td>${order.price}</td>
									<td><span class="label label-primary">${order.statusName}</span></td>
									<td><a href="<%=request.getContextPath()%>/order-detail.do?oId=${order.oId}">상세 확인</a></td>
									<!-- <td><a href="<%=request.getContextPath()%>/orderDetail.do?mId=${member.mId}&oId=${order.oId}" class="btn btn-default">View</a></td>  -->
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

<%@ include file="../include/footer.jspf" %>  