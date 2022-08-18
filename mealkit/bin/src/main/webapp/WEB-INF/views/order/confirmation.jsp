<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ include file="../include/header.jspf" %>

<!-- Page Wrapper -->
<section class="page-wrapper success-msg">
  <div class="container">
    <div class="row">
      <div class="col-md-6 col-md-offset-3">
        <div class="block text-center">
        	<i class="tf-ion-android-checkmark-circle"></i>
          <h2 class="text-center">이용해주셔서 감사합니다!</h2>
          <p>밀키트 조리시간처럼 빠른 속도로 배송해드리겠습니다!</p>
          <a href="<%=request.getContextPath()%>/index.do" class="btn btn-main mt-20">쇼핑 계속하기</a>
        </div>
      </div>
    </div>
  </div>
</section><!-- /.page-warpper -->

<%@ include file="../include/footer.jspf" %>