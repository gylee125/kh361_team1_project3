<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ include file="../include/header.jspf"%>

<style>
.h {
	margin-top: 40px;
	margin-bottom: 20px;
	font-family: "Poppins", sans-serif;
	letter-spacing: 2.5px;
	color: #505050;
}

span {
	font-family: "Poppins", sans-serif;
	font-size: 13px;
}
</style>

<section class="alerts section">
	<div class="container">
		<div class="row">
			<div class="col-md-8 col-md-offset-2">
				<div class="h">
					<h4>회원탈퇴 안내</h4>
				</div>
				<div class="alertPart">
					<div class="alert alert-success alert-common" role="alert">
						<i class="tf-ion-alert-circled"></i> <span> 회원 탈퇴 시 고객님의
							정보는 상품 반품 및 A/S를 위해 전자상거래 등에서 소비자 보호에 관한 법률에 의거한 <br>&emsp;&ensp;
							고객정보 보호정책에 따라 관리 됩니다.
						</span><br>
						<br> <i class="tf-ion-alert-circled"></i> <span> 고객
							요구사항 처리 및 부정이용방지를 위하여 회원탈퇴 후 30일간 고객님의 개인정보를 보관합니다. </span><br>
						<br> <i class="tf-ion-alert-circled"></i> <span>탈퇴 시
							고객님께서 보유하셨던 적립금은 모두 삭제됩니다.</span>
					</div>
				</div>
				<form action="deleteAccount.do" method="post">
					<input type="checkbox" required> <span
						style="font-size: 12px; position: relative; top: -2px;"> 안내
						사항을 모두 확인하였으며, 이에 동의합니다.</span> <input type="hidden" class="form-control"
						name="mId" value="${member.MId}">
					<div class="text-center">
						<br>
						<button type="submit" class="btn btn-main btn-medium btn-round">탈퇴하기</button>
					</div>
				</form>
			</div>
		</div>
	</div>
</section>

<%@ include file="../include/footer.jspf"%>
