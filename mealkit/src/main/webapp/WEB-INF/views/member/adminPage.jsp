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
							(테스트용)ID <input type="text" id="inputId" onfocusout="searchMember();" >
														
							<div class="dashboard-wrapper dashboard-user-profile" id="showMemberDetail">
								<div class="media">								
									<div class="media-body">
										<ul class="user-profile-list">
											<li> <span>No:</span> <span id="memberNo"></span> </li>
											<li> <span>ID:</span> <span id="memberId"></span> </li>
											<li> <span>Name:</span><span id="memberName"></span></li>
											<li> <span>Password:</span><span id="memberPw"></span></li>
											<li> <span>Phone:</span> <span id="memberPhone"></span> </li>
											<li> <span>Email:</span> <span id="memberEmail"></span> </li>
											<li> <span>Address:</span> <span id="memberAddress" style="width:50%;"></span> </li>
											<li> <span>Since:</span> <span id="memberRegDate"></span> </li>
											<li> <span>Level:</span> <span id="memberMlevel"></span> </li>
											<li> <span>Point:</span> <span id="memberCurrentPoint"></span> </li>
											<li> <span>Point Update:</span> <span id="memberUpdateDate"></span> </li>
										</ul>										
									</div>									
								</div>
								<br>
								<button type="button" class="btn btn-main text-center" onclick="modifyMemberByAdmin();">수정</button>
								<button type="button" class="btn btn-main text-center">탈퇴</button>
								<button type="button" class="btn btn-main text-center" onclick="closeMemberDetail();">닫기</button>
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