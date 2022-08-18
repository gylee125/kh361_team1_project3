<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="../include/header.jspf" %>


<section class="page-header">
	<div class="container">
		<div class="row">
			<div class="col-md-12">
				<div class="content">
					<h1 class="page-name">주문 상세</h1>
					<ol class="breadcrumb">
						<li><a href="index.html">Home</a></li>
						<li class="active">order detail</li>
					</ol>
				</div>
			</div>
		</div>
	</div>
</section>


<div class="page-wrapper">
  	<div class="purchase-confirmation shopping">
    	<div class="container">
      		<div class="row">
        		<div class="col-md-8 col-md-offset-2">
          			<div class="block ">
            			<div class="purchase-confirmation-details">
				            <table id="purchase-receipt" class="table">
				             <c:forEach var="order" items="${orderList}">
				                <thead>
									<tr>
					                    <th><h4><strong>주문 정보</strong></h4></th>
				                  	</tr>
				                </thead>
				                <tbody>
				                	<tr>
					                    <th><strong>주문번호</strong></th>
					                    <th>${order.oDate}-${order.oId}</th>
				                  	</tr>
				                  	<tr>
				                    	<td><strong>주문날짜</strong></td>
				                    	<td>${order.oDate}</td>
				                  	</tr>
									<tr>
				                    	<td class=""><strong>주문 내역</strong></td>
				                    	<td class="">
				                    		<a>${order.pName}</a>
							                <!--<img width="80" src="<%=request.getContextPath()%>${product.thumbnail}" alt="" /> -->
					                    	
				                    	</td>
				                  	</tr>
				                  	<tr>
				                    	<td class=""><strong>주문 상태</strong></td>
				                    	<td class=""><span class="label label-primary">${order.statusName}</span></td>
				                  	</tr>
				                  	</tbody>
				                  	
				                  	<tr>
					                    <th><h4><strong>배송 정보</strong></h4></th>
				                  	</tr>
				                
				        		<tbody>
				        			<tr>
				                    	<td><strong>수령인</strong></td>
				                    	<td>${member.mName}</td>
				                  	</tr>
				                  	<tr>
				                    	<td><strong>연락처</strong></td>
				                    	<td>${member.phone}</td>
				                  	</tr>
				                  	<tr>
				                    	<td><strong>배송지</strong></td>
				                    	<td>${member.address}</td>
				                  	</tr>
				                  	<!--<tr>
				                    	<td><strong>배송메모</strong></td>
				                    	<td>부재시 문 앞에 놓아주세요.</td>
				                  	</tr>  -->
				                  	</tbody>
				                  	
				                  	<tr>
						                    <th><h4><strong>결제 정보</strong></h4></th>
					                  	</tr>
					                  	
					               
					              	<tbody>
					        			<tr>
					                    	<td><strong>결제 수단</strong></td>
					                    	<td>카드</td>
					                  	</tr>
					                  	<tr>
					                    	<td><strong>주문 금액</strong></td>
					                    	<td>${order.price}</td>
					                    </tr>
					                    <tr>
					                    	<td><strong>포인트</strong></td>
					                    	<td>0원</td>
										</tr>
					                    <tr>
					                      	<td><strong>총 결제 금액</strong></td>
					                      	<td>${order.price}</td>
					                    </tr>
					                    
				                </tbody>
				                </c:forEach>
				            </table>
						</div>
				   
              			
            		</div>
          		</div>
        	</div>
      	</div>
    </div>
</div>

<%@ include file="../include/footer.jspf" %>  