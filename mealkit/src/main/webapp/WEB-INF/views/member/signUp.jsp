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
          <form class="text-left clearfix" id="submitSignUp" name="submitSignUp" action="submitSignUp.do" method="post">
            <div class="form-group">
              <input type="text" name="mId" id="mId" class="form-control"  placeholder="ID" onInput="resetWhenChangeId();">
              <button type="button" class="gradient-btn" onclick="checkUniqueId();">중복 확인</button>
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
			<input type="email" name="email" id="email" class="form-control"  placeholder="이메일" onInput="resetWhenChangeEmail();">                <button type="button" class="gradient-btn" onclick="checkUniqueEmail();">중복 확인</button>
              <span id="emailCheckText">이메일 중복확인이 필요합니다.</span>   
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
          <p class="mt-20">이미 계정이 있으신가요☞<a href="login.do"> 로그인</a></p>    
        </div>
      </div>
    </div>
  </div>
</section>

<script type="text/javascript">

	let submitSignUpForm = document.getElementById("submitSignUp");	
	let idCheckText = document.getElementById("idCheckText");
	let emailCheckText = document.getElementById("emailCheckText");

	
	function checkUniqueId() {		// 다음 프로젝트 때 제이쿼리+ajax로 수정예정, 나중에 정규표현식도 넣기			
		var mId = document.getElementById("mId");
		if (mId.value == "") {
			alert("ID를 입력하세요!!");
			mId.focus();
			return false;
		}
		window.open('checkUniqueId.do?mId=' + mId.value, '중복확인', 'width=300, height=120');
	}
	
	
	function checkUniqueEmail() {		// 다음 프로젝트 때 제이쿼리+ajax로 수정예정. 나중에 정규표현식도 넣기		
		var email = document.getElementById("email");
		if (email.value == "") {
			alert("이메일을 입력하세요!!");
			email.focus();
			return false;
		}
		window.open('checkUniqueEmail.do?email=' + email.value, '중벅확인', 'width=300, height=120');
	}
	
	function checkSignupForm() {
			
		if (submitSignUpForm.mId.value == "") {
			alert("ID를 입력하세요!!");
			submitSignUpForm.mId.focus();
			return false;
		}
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
		if (submitSignUpForm.mName.value == "") {
			alert("이름을 입력하세요!!");
			submitSignUpForm.mName.focus();
			return false;
		}
		if (submitSignUpForm.email.value == "") {
			alert("이메일을 입력하세요!!");
			submitSignUpForm.email.focus();
			return false;
		}
		if (submitSignUpForm.isUniqueId.value != 'true') { 			
			alert("아이디 중복 확인해야 합니다.");
			submitSignUpForm.mId.focus();
			return false;
		}		
		if (submitSignUpForm.isUniqueEmail.value != 'true') { 			
			alert("이메일 중복 확인해야 합니다.");
			submitSignUpForm.email.focus();
			return false;
		}
		submitSignUpForm.submit();
	}
	
	function resetWhenChangeId(){
		submitSignUpForm.isUniqueId.value = false;
		emailCheckText.innerHTML = "아이디 중복확인이 필요합니다.";
	}
	
	function resetWhenChangeEmail(){
		submitSignUpForm.isUniqueEmail.value = false;
		emailCheckText.innerHTML = "이메일 중복확인이 필요합니다.";
	}
	
	
</script>

<%@ include file="../include/footer.jspf"%>