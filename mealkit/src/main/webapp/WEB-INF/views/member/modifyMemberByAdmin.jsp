<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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
								<form action="submitModifyMemberByAdmin.do" id="submitModifyMemberByAdmin" method="post">
								<div class="media">								
									<div class="media-body">
										<ul class="user-profile-list">										
											<li> <span>ID:</span> <input type="text" name="mId" id="mId" value="${selectMember.MId}" disabled> 	
											<input type="hidden" name="mId" value="${selectMember.MId}"></li>	
											<li> <span>Name:</span> <input type="text" name="mName" value="${selectMember.MName}"> </li>
											<li> <span>Password:</span> <input type="password" name="pw" value="${selectMember.pw}"> </li>											
											<li> <span>Phone:</span> <input type="text" name="phone" value="${selectMember.phone}"> </li>
											<li> <span>Email:</span> <input type="email" name="email" id="email" value="${selectMember.email}"> </li>
											<li> <span>Address:</span> 
											<input type="text" name="address" size="100" value="${selectMember.address}"> </li>																							
										</ul>										
									</div>									
								</div>
								<br>
								<button type="button" class="btn btn-main text-center" onclick="checkModifyForm();">수정 완료</button>								
								<button type="button" class="btn btn-main text-center" onclick="location.href='<%=request.getContextPath()%>/adminPage.do'">취소</button>
								</form>
							</div>
							<div class="dashboard-wrapper dashboard-user-profile" id="showMemberDetail">
								<form action="submitModifyPointByAdmin.do" id="submitPointForm" method="post">
								<div class="media">								
									<div class="media-body">
										<ul class="user-profile-list">	
											<li>해당 계정의 포인트를 정정 지급합니다. 상황 확인 및 고객 안내 후 진행바랍니다.</li>
											<li> <span>Point:</span> 
											<input type="text" name="currentPoint" id="currentPoint" value="${selectMember.pointDTO.currentPoint}"> 
											<input type="hidden" name="mId" value="${selectMember.MId}"></li>	
											<li> <span>Last Update:</span>
											<fmt:formatDate value="${selectMember.pointDTO.updateDate}" pattern="yyyy-MM-dd"/>
											</li>
										</ul>										
									</div>									
								</div>
								<br>
								<button type="button" class="btn btn-main text-center" onclick="checkPointForm();">포인트 정정 지급</button>								
								<button type="button" class="btn btn-main text-center" onclick="location.href='<%=request.getContextPath()%>/adminPage.do'">취소</button>
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

<script type="text/javascript">

	let submitModifyForm = document.getElementById("submitModifyMemberByAdmin");
	let submitPointForm = document.getElementById("submitPointForm");
	let checkUniqueEmail = true;

	//alert("js테스트 17");
	$('#email').focusout(function(){
		let email = $('#email').val();
		let isEmail = /^[a-zA-Z0-9+-\_.]+@[a-zA-Z0-9-]+\.[a-zA-Z0-9-.]+$/;
		
		if(email == ""){
			alert('이메일을 입력해주세요.');
			checkUniqueEmail= false;
			return false;		
		}	
		if(!isEmail.test(submitModifyForm.email.value)){
			alert('이메일 양식을 확인해주세요.');
			checkUniqueEmail= false;
			return false;
		}	
		$.ajax({
			url : "<%=request.getContextPath()%>/checkUniqueEmailForModify.do",
			type : "get",
			data : 'email=' + $('#email').val() + '&mId=' + $('#mId').val(),
			datatype : 'json',
			success : function(result){
				if(result == 0){
					alert('사용할 수 있는 이메일입니다.');
					checkUniqueEmail = true;
				}else{
					alert('사용할 수 없는 이메일입니다.');
					checkUniqueEmail = false;
				}
			},
			error : function(a, b, c){
				alert("(이멜 중복검사)서버 요청 실패...", a, b, c);
			}
		})
	});
	
	function checkModifyForm() {
		
		let isPassword = /\S{4,}/;
		if (submitModifyForm.pw.value == "") {
			alert("비밀번호를 입력하세요!!");
			submitModifyForm.pw.focus();
			return false;
		}

		if(!isPassword.test(submitModifyForm.pw.value)){
			alert("비밀번호는 4자리 이상이어야 합니다;");
			submitModifyForm.pw.focus();
			return false;
		}
		if (submitModifyForm.mName.value == "") {
			alert("이름을 입력하세요!!");
			submitModifyForm.mName.focus();
			return false;
		}	
		if (checkUniqueEmail != true) { 			
			alert("이메일 입력 다시 확인해주세요~");
			submitModifyForm.email.focus();
			return false;
		}
		alert("회원 정보를 수정합니다~!");
		submitModifyForm.submit();
	}
	
	function checkPointForm(){
		
		if (submitPointForm.currentPoint.value == "") {
			alert("포인트 입력 확인해주세요!!");
			submitPointForm.currentPoint.focus();
			return false;
		}
		if (submitPointForm.currentPoint.value < 0) {
			alert("포인트는 0이상의 숫자만 입력 가능합니다...");
			submitPointForm.currentPoint.focus();
			return false;
		}
		alert("포인트를 정정 지급합니다.");
		submitPointForm.submit();
	}

</script>

</body>
</html>