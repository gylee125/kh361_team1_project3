<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ include file="../include/header.jspf" %>

<section class="page-header">
	<div class="container">
		<div class="row">
			<div class="col-md-12">
				<div class="content">
					<h1 class="page-name">My account</h1>
					<ol class="breadcrumb">
						<li><a href="<%=request.getContextPath()%>/aviato/index.html">Home</a></li>
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
					<li><a class="active" href="dashboard.html">My account</a></li>
					<li><a href="order.html">Orders</a></li>
					<li><a href="address.html">Address</a></li>
					<li><a href="profile-details.html">Profile</a></li>
				</ul>
				<div class="dashboard-wrapper user-dashboard">
					<div class="media">
						<div class="pull-left">
							<img class="media-object user-img" src="images/avater.jpg" alt="Image">
						</div>
						<div class="media-body">
							<h2 class="media-heading"><Strong>사용자(id1234)님, 반갑습니다.</Strong></h2>
							<!-- <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Unde, iure, est. Sit mollitia est maxime! Eos
								cupiditate tempore, tempora omnis. Lorem ipsum dolor sit amet, consectetur adipisicing elit. Enim, nihil. </p>-->
						</div>
					</div>
					<div class="total-order mt-20">
						<div class="table-responsive">
							<h4><strong>총 주문 내역</strong></h4>
							<table class="table">
								<thead>
									<tr>
										<th>주문번호</th>
										<th>주문일자</th>
										<th>상품명</th>
										<th>상품수량</th>
										<th>결제금액</th>
										<th></th>
									</tr>
								</thead>
								<tbody>
									<tr>
										<td><a href="#!">#252125</a></td>
										<td>2016-03-25</td>
										<td>비빔밥 밀키트(3EA)</td>
										<td>2</td>
										<td>40,000원</td>
									</tr>
									<tr>
										<td><a href="#!">#252125</a></td>
										<td>2016-03-25</td>
										<td>해물 비빔 쌀국수 밀키트(5EA)</td>
										<td>3</td>
										<td>69,000원</td>
									</tr>
									<tr>
										<td><a href="#!">#252125</a></td>
										<td>2016-03-25</td>
										<td>토마토 파스타 밀키트(2EA)</td>
										<td>3</td>
										<td>51,000원</td>
									</tr>
								</tbody>
							</table>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</section>

<%@ include file="../include/footer.jspf" %>