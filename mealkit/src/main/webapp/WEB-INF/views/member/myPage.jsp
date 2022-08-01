<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<title>밀슐랭 | 마이페이지</title>
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
		              	<li><span>${member.mId}'s profile</span></li>
		              	<li><span></span></li>
		                <li><span>Name:</span>${member.mName}</li>
		                <li><span>Email:</span>${member.email}</li>
		                <li><span>Phone:</span>${member.phone}</li>
		                <li><span>Address:</span>${member.address}</li>
		              </ul>
		            </div>
		          </div>
        	 </div>
             <div class="block billing-details"> 
                  <h4 class="widget-title">개인정보 수정</h4>
                  <form class="checkout-form">
                  	 <div class="form-group">
                  	    <label>ID</label>
                        <input type="text" class="form-control" value="${member.mId}" readonly>
                  	 </div>
                     <div class="form-group">
                        <label>이름</label>
                        <input type="text" class="form-control" value="${member.mName}">
                     </div>
                     <div class="form-group">
                        <label>이메일</label>
                        <input type="email" class="form-control" value="${member.email}">
                     </div>
                     <div class="form-group">
                        <label>연락처</label>
                        <input type="text" class="form-control" value="${member.phone}">
                     </div>
                     <div class="form-group">
                        <label>주소</label>
                        <input type="text" class="form-control" value="${member.address}">
                     </div>
                     <a href="" class="btn btn-main btn-small btn-round">수정</a >
                  </form>
               </div>   
               <!-- 비밀번호 -->
               <div class="block">
                    <h4 class="widget-title">비밀번호 변경</h4>
                    <form  class="checkout-form">
                       <div class="form-group">
                          <label>비밀번호</label>
                          <input type="password" class="form-control" >
                       </div>
                       <div class="form-group">
                          <label>비밀번호 확인</label>
                          <input type="password" class="form-control" >
                       </div>
                          <a href="" class="btn btn-main btn-small btn-round">변경</a >
                   </form> 
               </div>
               <!-- 탈퇴 -->
               <div class="block">
                 	<h4 class="widget-title"></h4>
                    <a href="confirmDelete.do" class="h"> > 회원탈퇴</a >
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