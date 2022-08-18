<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<title>밀슐랭 | 비밀번호 변경</title>
</head>

<script type="text/javascript">

function checkvalue(){
	
	var key1 = document.getElementById("key1").value;
	var key2 = document.getElementById("key2").value;
    var pw1 = document.getElementById("pw1").value;
    var pw2 = document.getElementById("pw2").value;
 
    if(key1 != key2){
    	alert("인증 코드가 일치하지 않습니다.");
		return false;
    }
    
	if(pw1 != pw2){
		alert("비밀번호 확인이 일치하지 않습니다.");
		return false;
	}
}
</script>

<body id="body">

	<%@ include file="../include/header.jspf"%>

	<%-- ChangePwd password form --%>
	<section class="forget-password-page account">
		<div class="container">
			<div class="row">
				<div class="col-md-6 col-md-offset-3">
					<div class="block text-center">
						<h2 class="text-center">비밀번호 변경</h2>
						<form class="text-center" action="changePwd.do" method="post" onsubmit="return checkvalue();">
							<p>
								이메일로 인증 코드가 발송되었습니다. <br>
								인증 코드 확인 후 새로운 비밀번호를 설정하세요. 
							</p>
							<div class="form-group">
								<% String mId = request.getParameter("mId"); %>
								<input type="hidden" name="mId" value="<%=mId%>">
								<% String AuthenticationKey = (String) request.getSession().getAttribute("AuthenticationKey"); %>
								<input type="hidden" id="key1" value="<%=AuthenticationKey%>">
							</div>
							<div class="form-group">
								<input type="text" class="form-control" id="key2" placeholder="이메일 인증 코드" required>
							</div>
							<div class="form-group">
								<input type="password" class="form-control" name="pw" id="pw1" 
								placeholder="새 비밀번호" required>
							</div>
							<div class="form-group">
								<input type="password" class="form-control" id="pw2" 
								placeholder="새 비밀번호 확인" required>
							</div>
							<br>
							<div class="text-center">
								<input type="submit" class="btn btn-main text-center" value="변경 요청">
							</div>
						</form>
					</div>
				</div>
			</div>
		</div>
	</section>


	<%@ include file="../include/footer.jspf"%>

</body>
</html>