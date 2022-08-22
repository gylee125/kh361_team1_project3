<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<%@ include file="../include/header.jspf"%>

<style>
.h {
	font-family: "Poppins", sans-serif;
	color: #888783;
	font-size: 14px;
	letter-spacing: 2px;
}

.gradient-btn {
	display: inline-block;
	padding: 0.5em 0.7em;
	border-radius: 50px;
	color: #5a574c;
	margin-top: 0.7rem;
	font-weight: bold;
	font-size: 0.678rem;
	letter-spacing: 0px;
	border: 0;
	outline: 0;
	background-color: #e1e1e1;
}

span {
	font-size: 11px;
}
</style>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script>
$(document).ready(function() {
	
	$('#email').change(function(){
		$('#checkedEmail').val(N);
		$('#checkedCode').val(N);
	});
	
	$('#emailCkBtn').on("click",function(event) {
			
		const email = $('#email').val();  
		const regExp = /\w+([-+.]\w+)*@\w+([-.]\w+)*\.[a-zA-Z]{2,4}$/;
		console.log('회원 이메일 : ' + email);
			
		if(!regExp.test(email)){
			$('#emailCkMsg').text('이메일 형식이 아닙니다.').css('color', 'red');
		 } else {
			$.ajax({            
				url: '/checkEmail',        
				type : 'post', 
				data: email,    
				dataType: 'json',       
				success: function(result) { 
					if(result == 0) {   
						console.log('결과:'+result);
						$('#emailCkMsg').text('사용 가능한 이메일입니다. 하단의 본인 확인 버튼을 클릭해주세요.').css('color', 'green');
						$('#email').attr('readonly',true);
						$('#checkedEmail').val(Y);
					} else { 
						$('emailCkMsg').text('이미 사용 중인 이메일입니다.').css('color', 'red');
					}                            
				}
			});   
		}
	});
			
	$('#emailSendBtn').on("click",function(event) {
		
		const email = $('#email').val();  

		$.ajax({
			url : '/sendEmail?email='+email,
			type : 'get',			
			success : function(data) {
				console.log("data : " + data);
				code = data;
				alert('이메일로 인증코드가 전송되었습니다.');
				$('#VerificationCode').attr('disabled',false);
			}
		});
	});
		
	$('#VerificationCode').on("keyup", function(event) {
		
		const inputCode = $(this).val();
		
		if(inputCode === code){
			$('#codeCkMsg').text('인증코드가 일치합니다.').css('color', 'green');
			$('#checkedCode').val(Y);
		}else{
			$('#codeCkMsg').text('인증코드가 일치하지 않습니다.').css('color', 'red');
		}
	});
	
	$("infoSumit").on("click",function(event){
		if($('#checkedEmail').val()=='N'){
	    alert('이메일 중복확인을 해주세요.');
	    }
		if($('#codeEmail').val()=='N'){
	    alert('이메일 인증을 완료해주세요.');
	    }
		$('#updateInfo').submit();
	});
		
	$('#pw2').on("input", function(event) {
		if ($('#pw').val() != $(this).val()) {
			$('#pwCkMsg').text('비밀번호가 일치하지 않습니다.').css('color', 'red');
			$('#checkedPw').val(N);
		} else{
			$('#pwCkMsg').text('비밀번호가 일치합니다.').css('color', 'green');
			$('#checkedPw').val(Y);
		}
	});
	
	$("pwSumit").on("click",function(event){
		if($('#checkedEmail').val()=='N'){
		    alert('이메일 중복확인을 해주세요.');
	    }
		$('#updateInfo').submit();
	});
	
});
</script>

	<section class="page-header">
		<div class="container">
			<div class="row">
				<div class="col-md-12">
					<div class="content">
						<h1 class="page-name">마이페이지</h1>
						<ol class="breadcrumb">
							<li><a href="index.do">Home</a></li>
							<li class="active">MyPage</li>
						</ol>
					</div>
				</div>
			</div>
		</div>
	</section>

	<div class="page-wrapper">
		<div class="checkout shopping">
			<div class="container">
				<div class="row">
					<div class="col-md-8">
						<!-- 개인정보 -->
						<div class="dashboard-wrapper dashboard-user-profile">
							<div class="media">
								<div class="media-body">
									<ul class="user-profile-list">
										<li><span>${member.MId}'s profile</span></li>
										<li><span></span></li>
										<li><span>Name:</span>${member.MName}</li>
										<li><span>Email:</span>${member.email}</li>
										<li><span>Phone:</span>${member.phone}</li>
										<li><span>Address:</span>${member.address}</li>
									</ul>
								</div>
							</div>
						</div>
						<div class="block billing-details">
							<h4 class="widget-title">개인정보 수정</h4>
							<form class="checkout-form" action="updateMyInfo.do" 
								method="post" id="updateInfo">
								<div class="form-group">
									<label>ID</label> <input type="text" class="form-control"
										name="mId" value="${member.MId}" readonly>
								</div>
								<div class="form-group">
									<label>이름</label> <input type="text" class="form-control"
										name="mName" value="${member.MName}" required>
								</div>
								<div class="form-group">
									<label>이메일</label> <input type="email" class="form-control"
										id="email" name="email" value="${member.email}">
									<button type="button" class="gradient-btn" id="emailCkBtn">중복 확인</button>
									<span id="emailCkMsg"></span>
								</div>
								<div class="mail-check-box">
								<div class="form-group">
									<label>인증코드</label> <input type="text" class="form-control"
										id="VerificationCode" disabled="disabled" required>
									<button type="button" class="gradient-btn" id="emailSendBtn">본인 확인</button>
									<span id="codeCkMsg"></span>
								</div>
								</div>
								<div class="form-group">
									<label>연락처</label> <input type="text" class="form-control"
										name="phone" value="${member.phone}">
								</div>
								<div class="form-group">
									<label>주소</label> <input type="text" class="form-control"
										name="address" value="${member.address}">
								</div>
								<div>
								<input type="hidden" id="checkedEmail" value="Y">
								<input type="hidden" id="checkedCode" value="Y">
								</div>
								<button type="submit" class="btn btn-main btn-small btn-round"
								id="infoSubmit">수정</button>
							</form>
						</div>
						<!-- 비밀번호 -->
						<div class="block">
							<h4 class="widget-title">비밀번호 변경</h4>
							<form class="checkout-form" action="updatePwd.do" method="post"
								id="updatePwd">
								<div class="form-group">
									<label>새 비밀번호</label> <input type="password" name="pw" id="pw"
										class="form-control"required">
								</div>
								<div class="form-group">
									<label>비밀번호 확인</label> <input type="password" id="pw2"
										class="form-control" required><br> 
									<span id="pwCkMsg"></span>
								</div>
								<input type="hidden" id="checkedPw" value="N">
								<button type="submit" class="btn btn-main btn-small btn-round"
									id="pwSubmit">변경</button>
							</form>
						</div>
						<!-- 탈퇴 -->
						<div class="block">
							<h4 class="widget-title"></h4>
							<a href="confirmDelete.do" class="h"> > 회원탈퇴</a>
						</div>
					</div>
					<!-- 포인트 -->
					<div class="col-md-4">
						<div class="product-checkout-details">
							<div class="block">
								<h4 class="widget-title">POINT</h4>
								<div class="media product-card">
									<div class="summary-total">
										<span>Total</span> <span> ${point.currentPoint}P </span>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>

<%@ include file="../include/footer.jspf"%>