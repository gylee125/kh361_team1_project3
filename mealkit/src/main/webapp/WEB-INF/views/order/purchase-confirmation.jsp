<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ include file="../include/header.jspf" %>

<section class="page-header">
	<div class="container">
		<div class="row">
			<div class="col-md-12">
				<div class="content">
					<h1 class="page-name">구매 확인</h1>
					<ol class="breadcrumb">
						<li><a href="<%=request.getContextPath()%>/aviato/index.html">Home</a></li>
						<li class="active">purchase confirmation</li>
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
				                <thead>
									<tr>
					                    <th><strong>주문번호:</strong></th>
					                    <th>220621-000001</th>
				                  	</tr>
				                </thead>

				                <tbody>

				                  	<tr>
				                    	<td class=""><strong>주문 상태:</strong></td>
				                    	<td class="">주문 완료</td>
				                  	</tr>


				                  	<tr>
				                    	<td><strong>결제 수단:</strong></td>
				                    	<td>카드</td>
				                  	</tr>
				                  	<tr>
				                    	<td><strong>날짜:</strong></td>
				                    	<td>2022년 6월 21일</td>
				                  	</tr>
				                  	<tr>
				                    	<td><strong>주문 금액:</strong></td>
				                    	<td>20,000원</td>
				                    </tr>
				                    <tr>
				                    	<td><strong>포인트:</strong></td>
				                    	<td>-3,000원</td>
									</tr>
				                    <tr>
				                      	<td><strong>결제 금액:</strong></td>
				                      	<td>17,000원</td>
				                    </tr>
				                </tbody>
				            </table>
              			</div>
            		</div>
          		</div>
        	</div>
      	</div>
    </div>
</div>

<%@ include file="../include/footer.jspf" %>  