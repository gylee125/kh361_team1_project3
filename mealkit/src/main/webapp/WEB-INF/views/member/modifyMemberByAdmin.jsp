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

<%@ include file="../include/header.jspf"%>
	
<section class="page-header">
	<div class="container">
		<div class="row">
			<div class="col-md-12">
				<div class="content">
					<h1 class="page-name">관리자 페이지</h1>
					<ol class="breadcrumb">
						<li><a href="/">Home</a></li>
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
					<li><a class="active" href="adminPage.do" >Member</a></li>
					<li><a href="adminProduct.do">Product</a></li>
					<li><a href="adminOrder.do">Order</a></li>
					<li><a href="adminBoard.do">Board</a></li>
				</ul>
				<div class="dashboard-wrapper user-dashboard">
					
					<div class="total-order mt-20">
						<h4>Modify Member Information</h4>
						<div class="table-responsive">	
																				
							<div class="dashboard-wrapper dashboard-user-profile" id="showMemberDetail">
								<form action="/submitModifyMemberByAdmin" method="post">
								<div class="media">								
									<div class="media-body">
										<ul class="user-profile-list">										
											<li> <span>ID:</span> <input type="text" name="MId" value="${selectMember.MId}" disabled> </li>										
											<li> <span>Name:</span> <input type="text" name="MName" value="${selectMember.MName}"> </li>
											<li> <span>Password:</span> <input type="password" name="pw" value="${selectMember.pw}"> </li>											
											<li> <span>Phone:</span> <input type="text" name="phone" value="${selectMember.phone}"> </li>
											<li> <span>Email:</span> <input type="email" name="email" value="${selectMember.email}"> </li>
											<li> <span>Address:</span> <input type="text" name="address" size="100" value="${selectMember.address}"> </li>	
										</ul>										
									</div>									
								</div>
								<br>
								<button class="btn btn-main text-center">수정 완료</button>								
								<button type="button" class="btn btn-main text-center" onclick="location.href='/adminPage.do'">취소</button>
								</form>
							</div>
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