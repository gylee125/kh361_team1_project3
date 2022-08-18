<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<title>밀슐랭 | 마이페이지</title>
</head>
<body id="body">

<%@ include file="../include/header.jspf"%>
	
<!-- 헤더 -->
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

<!-- 비밀번호 재확인 -->
<div class="page-wrapper">
   <div class="checkout shopping">
      <div class="container">
         <div class="row">
            <div class="col-md-8"> 
             <div class="block billing-details">
                  <h4 class="widget-title">
                 "${member.mName}님의 정보를 안전하게 보호하기 위해 비밀번호를 다시 한번 확인해주세요."
                  </h4>
                  <form class="checkout-form" action="myPage.do" method="post">
                     <div class="form-group">
                        <input type="hidden" class="form-control" name="mId" value="${member.mId}">
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
             
             <!-- 포인트 -->
             <div class="col-md-4">
               <div class="product-checkout-details">
                  <div class="block">
                     <h4 class="widget-title">POINT</h4>
                     <div class="media product-card">
                     <div class="summary-total">
                        <span>Total</span>
                        <span>250P</span>
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

</body>
</html>