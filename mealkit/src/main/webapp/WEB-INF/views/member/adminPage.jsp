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
					<li><a class="active" href="adminPage.do">Member</a></li>
					<li><a href="adminProduct.do">Product</a></li>
					<li><a href="adminOrder.do">Order</a></li>
					<li><a href="adminBoard.do">Board</a></li>
				</ul>
				<div class="dashboard-wrapper user-dashboard">
					
					<div class="total-order mt-20">
						<h4>Total Members</h4>
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
									<tr>												
										<c:forEach var="list" items="${memberList}">					
											<td>${list.MNo}</td>
											<td>${list.MId}</td>
											<td>${list.MName}</td>
											<td>${list.email}</td>
											<td>${list.regDate}</td>													
											<td>${list.point}</td>													
										</c:forEach>										
									</tr>
									<!-- 피카츄는 예시 -->		
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
							<!-- 작업용 가라 입력태그 -->
							(테스트용)ID <input type="text" id="inputId" onfocusout="searchMember();">
							
							<div class="dashboard-wrapper dashboard-user-profile" id="showMemberDetail">
								<div class="media">								
									<div class="media-body">
										<ul class="user-profile-list">
											<li><span>No:</span>Johanna Doe</li>
											<li><span>ID:</span>USA</li>
											<li><span>Name:</span>USA</li>
											<li><span>Password:</span>USA</li>
											<li><span>Phone:</span>USA</li>
											<li><span>Email:</span>USA</li>
											<li><span>Address:</span>mail@gmail.com</li>
											<li><span>Since:</span>+880123123</li>
											<li><span>Level:</span>Dec , 22 ,1991</li>
										</ul>										
									</div>									
								</div>
								<br>
								<button type="button" class="btn btn-main text-center">수정</button>
								<button type="button" class="btn btn-main text-center">탈퇴</button>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</section>

<script>
	let showMemberDetail = document.getElementById("showMemberDetail");
	let inputId = document.getElementById("inputId");
	
	showMemberDetail.style.display = "none";
	
	alert("js테스트 : " + inputId.value);
	
	function searchMember(){
		let xmlReq = new XMLHttpRequest();
		
		xmlReq.open('POST', '/showMemberDetail.do', true);
		xmlReq.setRequestHeader('Content-type', 'application/x-www-form-urlencoded');
		xmlReq.send("mId=" + inputId.value);
		xmlReq.onload = function(){
			if(xmlReq.status == 200){
				alert("작동하나? ajax?" + inputId.value);
				showMemberDetail.style.display = "block";
				console.log(xmlReq.response);
			}else
				console.log("showIdMember 처리 실패");
			}
		}
	
</script>

<%@ include file="../include/footer.jspf"%>


</body>
</html>