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
										<c:forEach var="list" items="${memberlist}">
											<tr>
												<td>${list.mNo}</td>
												<td>${list.mId}</td>
												<td>${list.mName}</td>
												<td>${list.email}</td>
												<td>${list.regDate}</td>
												<td>${list.currentPoint}</td>
											</tr>
										</c:forEach>
									</tbody>
							</table>
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
	showMemberDetail.style.display = 'none';
	
	alert("js 작동 테스트 28");
		
	function searchMember(){		
		
		fetch("/showMemberDetail.do?mId=" + inputId.value)
			.then((response) => response.json())			
			.then((data) => {
				console.log(data);
				alert("회원 비밀번호가 노출됩니다. 보안에 주의하시기 바랍니다.");				
				memberNo.innerHTML = data.mno;
				memberId.innerHTML = data.mid;
				memberName.innerHTML = data.mname;
				memberPw.innerHTML = data.pw;
				memberPhone.innerHTML = data.phone;
				memberEmail.innerHTML = data.email;
				memberAddress.innerHTML = data.address;
				memberRegDate.innerHTML = data.regDate;				
				memberCurrentPoint.innerHTML = data.pointDTO.currentPoint;				
				memberUpdateDate.innerHTML = data.pointDTO.updateDate;				
				if(data.mlevel == 2)
					memberMlevel.innerHTML = '관리자';
				else
					memberMlevel.innerHTML = '일반회원';									
				showMemberDetail.style.display = 'block';
			})
			.catch(function(){
				alert("ID 확인바랍니다...");
				showMemberDetail.style.display = 'none';
			});
	}
	
	function modifyMemberByAdmin(){
		location.href='/modifyMemberByAdmin.do?mId=' + memberId.innerHTML;
	}
	
	function closeMemberDetail(){
		showMemberDetail.style.display = 'none';
	}
	
</script>

<%@ include file="../include/footer.jspf"%>

</body>
</html>