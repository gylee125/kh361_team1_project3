<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ include file="../include/header.jspf"%>

<section class="page-header">
	<div class="container">
		<div class="row">
			<div class="col-md-12">
				<div class="content">
					<h1 class="page-name">마이페이지</h1>
					<ol class="breadcrumb">
						<li><a href="/">Home</a></li>
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
					<div class="block billing-details">
						<h4 class="widget-title">"${member.MName}님의 정보를 안전하게 보호하기 위해
							비밀번호를 다시 한번 확인해주세요."</h4>
						<form class="checkout-form" action="myPage.do" method="post">
							<div class="form-group">
								<input type="hidden" class="form-control" name="mId" value="${member.MId}">
							</div>
							<div class="form-group">
								<label>비밀번호</label> 
								<input type="password" class="form-control" name="pw" required>
							</div>
							<div style="position: relative; top: 7px;">
								<button type="submit" class="btn btn-small btn-solid-border">확인</button>
							</div>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>

<%@ include file="../include/footer.jspf"%>