<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="../include/header.jspf"%>
<script src="https://code.jquery.com/jquery-3.6.0.slim.min.js"
	integrity="sha256-u7e5khyithlIdTpu22PHhENmPcRdFiHRjhAuHcs05RI="
	crossorigin="anonymous"></script>
<script type="text/javascript">
	
</script>

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
							<form action="updateAdmin.do" method="get" id="updateAdmin"
								name="updateAdmin" role="form" >
								<table id="purchase-receipt" class="table">
									<thead>
										<tr>
											<th><h4>
													<strong>주문 정보</strong>
												</h4></th>
										</tr>
									</thead>
									<tbody>
										<tr>
											<th><strong>주문번호</strong></th>
											<th><fmt:formatDate value="${order.oDate}"
													pattern="yyMMddkkmm" />-<input type="hidden" name="oId" id="oId" value="${order.oId}">${order.oId}</input></th>
										</tr>
										<tr>
											<td><strong>주문날짜</strong></td>
											<td><fmt:formatDate value="${order.oDate}"
													pattern="yyyy-MM-dd" /></td>
										</tr>
										<tr>
											<td class=""><strong>주문 내역</strong></td>
											<td class=""><a>${order.pName}</a> <!--<img width="80" src="<%=request.getContextPath()%>${product.thumbnail}" alt="" /> -->

											</td>
										</tr>
										<tr>
											<td class=""><strong>주문 상태</strong></td>
											<td class="">
											<!-- <span class="label label-primary">${order.statusName}</span> -->
												<select class="statusCode" name="statusCode" id="statusCode">
														<option value="1">주문확인</option>
														<option value="2">상품준비중</option>
														<option value="3">배송준비중</option>
														<option value="4">배송중</option>
														<option value="5">배송완료</option>
														<option value="6">주문취소</option>
														<option value="7">반품처리</option>
														<option value="8">교환처리</option>
												</select>
											</td>
										</tr>
									</tbody>

									<tr>
										<th><h4>
												<strong>배송 정보</strong>
											</h4></th>
									</tr>

									<tbody>
										<tr>
											<td><strong>수령인</strong></td>
											<td>${order.mName}</td>
											<%-- <input type="text" class="form-control" name="mName"
												value="${order.mName}"> --%>
												
										</tr>
										<tr>
											<td><strong>연락처</strong></td>
											<td>${order.phone}</td>
											<%-- <input type="text" class="form-control" name="phone"
												value="${order.phone}"> --%>
										</tr>
										<tr>
											<td><strong>배송지</strong></td>
											<td>${order.address}</td>
											<%-- <input type="text" class="form-control" name="address"
												value="${order.address}"> --%>
										</tr>
										<!--<tr>
				                    	<td><strong>배송메모</strong></td>
				                    	<td>부재시 문 앞에 놓아주세요.</td>
				                  	</tr>  -->
									</tbody>

									<tr>
										<th><h4>
												<strong>결제 정보</strong>
											</h4></th>
									</tr>


									<tbody>
										<tr>
											<td><strong>결제 수단</strong></td>
											<td>카드</td>
										</tr>
										<tr>
											<td><strong>주문 금액</strong></td>
											<td><fmt:formatNumber value="${order.price}" pattern="###,####,###"/>원</td>
										</tr>
										<tr>
											<td><strong>포인트</strong></td>
											<td>0원</td>
										</tr>
										<tr>
											<td><strong>총 결제 금액</strong></td>
											<td><fmt:formatNumber value="${order.price}" pattern="###,####,###"/>원</td>
										</tr>

									</tbody>
								</table>
							
						</div>
								<div class="text-center">
								</br>
									<a href="<%=request.getContextPath()%>/adminOrder.do">
										<button type="button" class="btn btn-main">뒤로가기</button>
									</a>
									<button type="submit" class="btn btn-main" id="updateAdmin">정보수정</button>
									<a href="<%=request.getContextPath()%>/deleteAdmin.do?oId=${order.oId}">
										<button type="button" class="btn btn-main">주문삭제</button>
									</a>
								</div>
								</form>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>

<%@ include file="../include/footer.jspf"%>
