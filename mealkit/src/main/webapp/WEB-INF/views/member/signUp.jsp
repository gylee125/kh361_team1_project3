<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../include/header.jspf"%>
<!DOCTYPE html>
<html>
<head>
  <!-- Basic Page Needs
  ================================================== -->
  <meta charset="utf-8">
  <title>밀슐랭 | 회원가입</title>
  
<style>
.gradient-btn{
	display: inline-block;
  	padding: 0.5em 0.7em;
  	border-radius: 50px;
	color: #5a574c;
  	margin-top:0.7rem;
  	font-weight: bold;
  	font-size: 0.678rem;
  	letter-spacing: 0px;
	border: 0;
	outline: 0;
	background-color: #e1e1e1;
}

span{
	font-size: 11px;
}
</style>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>

</head>

<body id="body">

<section class="signin-page account">
  <div class="container">
    <div class="row">
      <div class="col-md-6 col-md-offset-3">
        <div class="block text-center">
          <h2 class="text-center">계정을 만드세요</h2>
          <form action="submitSignUp.do" method="post" class="text-left clearfix" id="submitSignUp" name="submitSignUp" >
            <div class="form-group">
              <input type="text" name="mId" id="mId" class="form-control"  placeholder="ID">
              <button type="button" class="gradient-btn">확인 내용</button>
              <span id="idCheckText">ID 중복확인이 필요합니다.</span> 
            </div>
            <div class="form-group">
              <input type="password" name="pw" id="pw" class="form-control"  placeholder="비밀번호">
            </div>
            <div class="form-group">
              <input type="password" id="pw2" class="form-control"  placeholder="비밀번호 확인">
            </div>
            <div class="form-group">
              <input type="text" name="mName" class="form-control"  placeholder="이름">
            </div>
            <div class="form-group">
			<input type="email" name="email" id="email" class="form-control"  placeholder="이메일" >                
			<button type="button" class="gradient-btn">확인 내용</button>
              <span id="emailCheckText">이메일 중복확인이 필요합니다.</span>   
            </div>
            <div class="form-group">
			<input type="text" id="VerificationCode" class="form-control"  placeholder="인증코드" disabled="disabled">                
			<button type="button" id="emailSendBtn" class="gradient-btn" disabled="disabled">본인 확인</button>
              <span id="codeCheckText">이메일 본인 인증이 필요합니다. 본인 확인 버튼을 클릭하세요.</span>   
            </div>
            <div class="form-group">
              <input type="tel" name="phone" class="form-control"  placeholder="연락처">
            </div>
            <div class="form-group">
              <input type="text" name="address" class="form-control"  placeholder="주소">
            </div>
            <input type="hidden" name="isUniqueId" value="false">
            <input type="hidden" name="isUniqueEmail" value="false">
            <br>
            <div class="text-center">
              <button type="button" class="btn btn-main text-center" onclick="checkSignupForm();">회원가입</button>
            </div>
          </form>
          <p class="mt-20">이미 계정이 있으신가요☞<a href="login.do">로그인</a></p>    
        </div>
      </div>
    </div>
  </div>
</section>

<script type="text/javascript">

	let submitSignUpForm = document.getElementById("submitSignUp");	
	let checkUniqueId = false;
	let checkUniqueEmail = false;
	let checkEmail = false;
	
	//alert("js 테스트 08");
	
	$('#mId').focusout(function(){
		let mId = $('#mId').val();
		let isId = /^[a-z]+[a-z0-9]{3,19}$/g;
		
		if(mId == ""){
			$("#idCheckText").html('ID를 입력해주세요.');
			checkUniqueId= false;
			return false;		
		}	
		if(!isId.test(submitSignUpForm.mId.value)){			
			$("#idCheckText").html('ID는 영문자로 시작하는, 4~20자 영어 혹은 숫자이어야 합니다;');
			checkUniqueId= false;
			return false;
		}
		$.ajax({
			url : "<%=request.getContextPath()%>/checkUniqueId.do",
			type : "get",
			data : 'mId=' + $('#mId').val(),
			dataType : "json",
			success : function(result){
				//console.log(result);
				if(result == 0){
					$("#idCheckText").html('해당 ID 사용가능합니다.');
					checkUniqueId = true;
				}else{
					$("#idCheckText").html('사용할 수 없는 ID입니다.');	
					checkUniqueId = false;
				}
			},
			error : function(a, b, c){
				alert("(아이디중복검사)서버 요청 실패...", a, b, c);
			}
		})
	});
	
	$('#email').focusout(function(){
		let email = $('#email').val();
		let isEmail = /^[a-zA-Z0-9+-\_.]+@[a-zA-Z0-9-]+\.[a-zA-Z0-9-.]+$/;
		
		if(email == ""){
			$("#emailCheckText").html('이메일을 입력해주세요.');
			checkUniqueEmail= false;
			return false;		
		}	
		if(!isEmail.test(submitSignUpForm.email.value)){
			$("#emailCheckText").html('이메일 양식을 확인해주세요.');
			checkUniqueEmail= false;
			return false;
		}	
		$.ajax({
			url : "<%=request.getContextPath()%>/checkUniqueEmail.do",
			type : "get",
			data : 'email=' + $('#email').val(),
			dataType : 'json',
			success : function(result){
				if(result == 0){
					$("#emailCheckText").html('해당 이메일 사용가능합니다.');
					$('#email').attr('readonly',true);
					$('#emailSendBtn').attr('disabled',false);
					$('#VerificationCode').attr('disabled',false);
					checkUniqueEmail = true;
				}else{
					$("#emailCheckText").html('사용할 수 없는 이메일입니다.');	
					checkUniqueEmail = false;
				}
			},
			error : function(a, b, c){
				alert("(이멜 중복검사)서버 요청 실패...", a, b, c);
			}
		})
	});
	
	$('#emailSendBtn').click(function(){
		let email = $('#email').val();

		$.ajax({
			url : '<%=request.getContextPath()%>/sendEmail.do?email='+email,
			type : 'get',			
			success : function(data) {
				console.log("data : " + data);
				code = data;
				alert('이메일로 인증코드가 전송되었습니다.');
			}
		});
	});
	
	$('#VerificationCode').keyup(function() {
		let inputCode =  $(this).val();
		let $resultMsg = $('#codeCkMsg');
			
		if(inputCode === code){
			$("#codeCheckText").html('인증코드가 일치합니다.');
			checkEmail= true;
		}else{
			$("#codeCheckText").html('인증코드가 일치하지 않습니다.');
			checkEmail= false;
		}
	});
	
	
	function checkSignupForm() {
		
		let isPassword = /\S{4,}/;
			
		if (submitSignUpForm.pw.value == "") {
			alert("비밀번호를 입력하세요!!");
			submitSignUpForm.pw.focus();
			return false;
		}
		if (submitSignUpForm.pw2.value == "") {
			alert("비밀번호 확인도 입력하세요!!");
			submitSignUpForm.pw2.focus();
			return false;
		}
		if (submitSignUpForm.pw.value != pw2.value) {
			alert("비밀번호 재입력까지 일치해야합니다.");
			submitSignUpForm.pw.focus();
			return false;
		}
		if(!isPassword.test(submitSignUpForm.pw.value)){
			alert("비밀번호는 4자리 이상이어야 합니다;");
			submitSignUpForm.pw.focus();
			return false;
		}
		if (submitSignUpForm.mName.value == "") {
			alert("이름을 입력하세요!!");
			submitSignUpForm.mName.focus();
			return false;
		}
		if (checkUniqueId != true) { 			
			alert("ID 입력 다시 확인해주세요~");
			submitSignUpForm.mId.focus();
			return false;
		}		
		if (checkUniqueEmail != true) { 			
			alert("이메일 입력 다시 확인해주세요~");
			submitSignUpForm.email.focus();
			return false;
		}
		if (checkEmail != true) {
			alert("이메일 본인 인증을 완료해주세요~");
			submitSignUpForm.VerificationCode.focus();
			return false;
		}
		submitSignUpForm.submit();
	}

</script>

<%@ include file="../include/footer.jspf"%>