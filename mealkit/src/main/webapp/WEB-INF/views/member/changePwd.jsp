<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ include file="../include/header.jspf"%>

<style>
span {
	font-size: 11px;
	float: left;
	padding-top: 5px;
	padding-bottom: 5px;
}
</style>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script>
	$(document).ready(function() {
	
		$('#key2').on("blur", function(event) {
			if($(this).val() == $('#key1').val()){
				$('#codeCkMsg').text('인증코드가 일치합니다.').css('color', 'green');
			}else{
				$('#codeCkMsg').text('인증코드가 일치하지 않습니다.').css('color', 'red');
				$('#checkedCode').val('N');
			}
		});
		
		$('#pw2').on("keyup", function(event) {
			if ($(this).val() != $('#pw1').val()) {
				$('#pwCkMsg').text('비밀번호가 일치하지 않습니다.').css('color', 'red');
				$('#checkedPw').val('N');
			}else{
				$('#pwCkMsg').text('비밀번호가 일치합니다.').css('color', 'green');
			}
		});
		
		$("#changePwdForm").submit(function() {
			if ($('#checkedCode').val() == 'N') {
				return false;
			}
			if ($('#checkedPw').val() == 'N') {
				return false;
			}
		});
	});
</script>

<section class="forget-password-page account">
	<div class="container">
		<div class="row">
			<div class="col-md-6 col-md-offset-3">
				<div class="block text-center">
					<h2 class="text-center">비밀번호 변경</h2>
					<form class="text-center" action="changePwd.do" method="post" id="changPwdForm">
						<p>
							이메일로 인증코드가 전송되었습니다. <br> 
							인증코드 확인 후 새로운 비밀번호를 설정하세요.
						</p>
						<div class="form-group">
							<input type="hidden" name="mId" value="${mId}"> 
							<input type="hidden" id="key1" value="${VerificationCode}">
						</div>
						<div class="form-group">
							<input type="text" class="form-control" id="key2"
								placeholder="이메일 인증 코드" required>
							<span id="codeCkMsg"></span>
						</div>
						<div class="form-group">
							<input type="password" class="form-control" name="pw" id="pw1"
								placeholder="새 비밀번호" required>
						</div>
						<div class="form-group">
							<input type="password" class="form-control" id="pw2"
								placeholder="새 비밀번호 확인" required>
							<span id="pwCkMsg"></span>
						</div><br>
						<div class="text-center">
							<input type="hidden" id="checkedCode" value="Y"> 
							<input type="hidden" id="checkedPw" value="Y">
							<input type="submit" class="btn btn-main text-center" value="변경 요청">
						</div>
					</form>
				</div>
			</div>
		</div>
	</div>
</section>

<%@ include file="../include/footer.jspf"%>