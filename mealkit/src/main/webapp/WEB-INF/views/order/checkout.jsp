<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%@ include file="../include/header.jspf" %>

<section class="page-header">
	<div class="container">
		<div class="row">
			<div class="col-md-12">
				<div class="content">
					<h1 class="page-name">주문하기</h1>
					<ol class="breadcrumb">
						<li><a href="<%=request.getContextPath()%>/index.do">메인 홈페이지</a></li>
						<li class="active">결제</li>
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
                  <h4 class="widget-title">배송지</h4>
                  <form class="checkout-form" action="/order.do" method="post">
                     <div class="form-group">
                        <label for="full_name">이름</label>
                        <input type="text" class="form-control" id="full_name" value="${member.mName}" placeholder="">
                     </div>
                     <div class="form-group">
                        <label for="user_address">주소</label>
                        <input type="text" class="form-control" name="oAddress" id="user_address" value="${member.address}" placeholder="">
                     </div>
                     <div class="checkout-country-code clearfix">
                        <div class="form-group">
                           <label for="user_post_code">우편 번호</label>
                           <input type="text" class="form-control" id="user_post_code" name="zipcode" value="">
                        </div>
                        <div class="form-group" >
                           <label for="user_city">도시</label>
                           <input type="text" class="form-control" id="user_city" name="city" value="">
                        </div>
                     </div>
                     <!-- 국가까진 필요없을 듯합니다
                     <div class="form-group">
                        <label for="user_country">국가</label>
                        <input type="text" class="form-control" id="user_country" placeholder="">
                     </div>
                      -->
                  </form>
               </div>
               <div class="block">
                  <h4 class="widget-title">결제 수단</h4>
                  <p>신용카드 정보</p>
                  <div class="checkout-product-details">
                     <div class="payment">
                        <div class="card-details">
                           <form  class="checkout-form">
                              <div class="form-group">
                                 <label for="card-number">카드 번호 <span class="required">*</span></label>
                                 <input  id="card-number" class="form-control"   type="tel" placeholder="**** **** **** ****">
                              </div>
                              <div class="form-group half-width padding-right">
                                 <label for="card-expiry">만료 기간 (MM/YY) <span class="required">*</span></label>
                                 <input id="card-expiry" class="form-control" type="tel" placeholder="MM / YY">
                              </div>
                              <div class="form-group half-width padding-left">
                                 <label for="card-cvc">CVC 번호 <span class="required">*</span></label>
                                 <input id="card-cvc" class="form-control"  type="tel" maxlength="4" placeholder="CVC" >
                              </div>
                              <a href="<%=request.getContextPath()%>/addOrder.do?mId=${member.mId}" class="btn btn-main mt-20">주문하기</a >
                           </form>
                        </div>
                     </div>
                  </div>
               </div>
            </div>
            <div class="col-md-4">
               <div class="product-checkout-details">
                  <div class="block">
                     <h4 class="widget-title">주문 내역</h4>
                     
                     <c:set var="sumPrice" value="0" />                                          
                     <c:forEach var="cart" items="${cartList}"> 
                     
                     <div class="media product-card">
                        <a class="pull-left" href="<%=request.getContextPath()%>/shop/detail.do?pId=${cart.pId}">
                           <img class="media-object" src="<%=request.getContextPath()%>${cart.thumbnail}" alt="Image" />
                        </a>
                        <div class="media-body">
                           <h4 class="media-heading"><a href="<%=request.getContextPath()%>/shop/detail.do?pId=${cart.pId}">${cart.pName}</a></h4>
                           <p class="price">${cart.cquantity} x ${cart.price}</p>
                           <a class="remove" href="<%=request.getContextPath()%>/deleteCart.do?mId=${member.mId}&ucId=${cart.ucId}">삭제하기</a>
                        </div>
                     </div>
                     
                     <c:set var="sumPrice" value="${sumPrice + cart.cquantity * cart.price}" />
                     
                     </c:forEach>   
                                      
                     <!-- 포인트 아직 미구현. 다음 프로젝트때 도입예정
                     <div class="discount-code">
                        <p> 포인트가 있으신가요? <a data-toggle="modal" data-target="#coupon-modal" href="#!">enter it here</a></p>
                     </div>
                      -->
                     <ul class="summary-prices">
                        <li>
                           <span>총가격:</span>
                           <span class="price">${sumPrice} 원</span>
                        </li>
                        <li>
                           <span>배송비:</span>
                           <span>무료</span>
                        </li>
                     </ul>
                     <div class="summary-total">
                        <span>Total</span>
                        <span>${sumPrice} 원</span>
                     </div>
                  </div>
               </div>
            </div>
         </div>
      </div>
   </div>
</div>
   <!-- Modal -->
   <div class="modal fade" id="coupon-modal" tabindex="-1" role="dialog">
      <div class="modal-dialog" role="document">
         <div class="modal-content">
            <div class="modal-body">
               <form>
                  <div class="form-group">
                     <input class="form-control" type="text" placeholder="Enter Coupon Code">
                  </div>
                  <button type="submit" class="btn btn-main">Apply Coupon</button>
               </form>
            </div>
         </div>
      </div>
   </div>
   
   <%@ include file="../include/footer.jspf" %>