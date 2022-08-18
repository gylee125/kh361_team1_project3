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
</style>
</head>
<body id="body">



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
					<li><a href="adminPage.do">Member</a></li>
					<li><a class="active" href="adminProduct.do">Product</a></li>
					<li><a href="adminOrder.do">Order</a></li>
					<li><a href="adminBoard.do">Board</a></li>
				</ul>
				<div class="dashboard-wrapper user-dashboard">
					
					<div class="total-order mt-20">
						<h4>Total !@##!@</h4>
						<div class="table-responsive">
							<table class="table">
								<thead>
									<tr>
										<th>No</th>
										<th>ID</th>
										<th>Name</th>	
										<th>Email</th>										
										<th>Since</th>
										<th>Point</th>
									</tr>
								</thead>
								<tbody>								
									<!-- 예시 -->		
									<tr>
										<td>1</td>
										<td>pikachu</td>
										<td>피카츄</td>
										<td>pika@poke.mon</td>
										<td>2022-08-04</td>													
										<td>3000</td>	
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

<%@ include file="../include/footer.jspf"%>

</body>
</html>