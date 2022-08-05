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
											<li> <span>Address:</span> <span id="memberAddress"></span> </li>
											<li> <span>Since:</span> <span id="memberRegDate"></span> </li>
											<li> <span>Level:</span> <span id="memberMlevel"></span> </li>
										</ul>										
									</div>									
								</div>
								<br>
								<button type="button" class="btn btn-main text-center">수정</button>
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
	let memberNo = document.getElementById("memberNo");
	let inputId = document.getElementById("inputId");
	showMemberDetail.style.display = 'none';
	
	alert("js 작동 테스트 1")
		
	function searchMember(){		
		
		fetch("/showMemberDetail.do", {
			method: "POST", 			
			body: JSON.stringify("mId" : inputId.value)
		})
		.then(function(response){
			return response.json());
		})
		.then(function(json){
			console.loa(json);
		});
		/*
		let xmlReq = new XMLHttpRequest();		
		xmlReq.open('POST', '/showMemberDetail.do', true);
		xmlReq.setRequestHeader('Content-type', 'application/x-www-form-urlencoded');
		xmlReq.send("mId=" + inputId.value);
		
		xmlReq.onload = function(){
			if(xmlReq.status == 200){
				if(xmlReq.response != ""){	
					alert("회원 비밀번호가 노출됩니다. 보안에 주의하시기 바랍니다.");
					let showMember = JSON.parse(xmlReq.response);		
										
					memberNo.innerHTML = showMember.mno;
					memberId.innerHTML = showMember.mid;
					memberName.innerHTML = showMember.mname;
					memberPw.innerHTML = showMember.pw;
					memberPhone.innerHTML = showMember.phone;
					memberEmail.innerHTML = showMember.email;
					memberAddress.innerHTML = showMember.address;
					memberRegDate.innerHTML = showMember.regdate;
					
					if(showMember.mlevel == 2)
						memberMlevel.innerHTML = '관리자';
					else
						memberMlevel.innerHTML = '일반회원';
										
					showMemberDetail.style.display = 'block';
				}else{
					showMemberDetail.style.display = 'none';
					alert("ID 입력 오류! 확인바랍니다~!");
				}				
			}else{
				alert("showIdMember 처리 실패");
			}				
		} */	
			
	}
	
	function closeMemberDetail(){
		showMemberDetail.style.display = 'none';
	}
	
</script>

<%@ include file="../include/footer.jspf"%>

</body>
</html>