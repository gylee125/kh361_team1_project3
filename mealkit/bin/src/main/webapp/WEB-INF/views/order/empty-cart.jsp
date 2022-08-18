<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ include file="../include/header.jspf" %>

<section class="empty-cart page-wrapper">
  <div class="container">
    <div class="row">
      <div class="col-md-6 col-md-offset-3">
        <div class="block text-center">
        	<i class="tf-ion-ios-cart-outline"></i>
          	<h2 class="text-center">장바구니가 비어있습니다.</h2>
          	<!-- <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Inventore, sed.</p>-->
          	<a href="<%=request.getContextPath()%>/index.do" class="btn btn-main mt-20">메인으로 돌아가기</a>
      </div>
    </div>
  </div>
</section>

<%@ include file="../include/footer.jspf" %>  </html>