<%@page import="com.mealkit.order.OrderService"%>
<%@page import="com.mealkit.order.CartVO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.sql.SQLException"%>
<%@ page import="java.sql.DriverManager"%>
<%@ page import="java.sql.Connection"%>
<%@ page import="java.sql.PreparedStatement"%>
<%@ page import="java.sql.ResultSet"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>



<%@ include file="../include/header.jspf"%>
<style>

#modify {
	background:transparent;
	border:none;
	color:#c7254e;
	text-align:center;
	margin-top:5px;
}

#cquantity {
	border: solid 1px;
	text-align:center;
	height:25px;
	color:#333;
	font-weight:bold;
}

#quantity {
	/* padding-left:25px; */
	text-align:center;
}

#plus_btn {
	background-color:white;
	border:none;
}
#minus_btn {
	background-color:white;
	border:none;
}

.quaninput{
	/* width:110px; */
	text-align:center;
}

.modifyinput{
/* 	background-color:black; */
}

.summary-total {
	texe-align:right;
}

.checkout_btn {
	float:right;
}
</style>

<section class="page-header">
	<div class="container">
		<div class="row">
			<div class="col-md-12">
				<div class="content">
					<h1 class="page-name">Cart</h1>
					<ol class="breadcrumb">
						<li><a href="<%=request.getContextPath()%>/index.do">Home</a></li>
						<li class="active">cart</li>
					</ol>
				</div>
			</div>
		</div>
	</div>
</section>

<div class="page-wrapper">
	<div class="cart shopping">
		<div class="container">
			<div class="row">
				<div class="col-md-8 col-md-offset-2">
					<div class="block">
						<div class="product-list">
							<!-- <form id = "cart_form" name = "cart_form" method="post"> -->

								<table class="table">
									<thead>
										<tr>
											<th class="">상품명</th>
											<th class="">상품가격</th>
											<th class="" id="quantity">상품수량</th>
											<!-- <th class="">수량수정</th> -->
											<th class="">결제금액</th>
											<th class="">선택</th>
										</tr>
									</thead>
									<tbody>
										<c:forEach var="cart" items="${cartList}">
										<form action="updateCart.do" method="get" name="updateCart" >
											<tr class="">
												<td class="">
													<div class="product-info">
														<img width="80" src="<%=request.getContextPath()%>/product/display?fileName=${cart.thumbnail}" alt="" />
														<a href="<%=request.getContextPath()%>/shop/detail.do?pId=${cart.pId}">${cart.pName}</a>

													</div>
												</td>
												<td class="">
												<fmt:formatNumber value="${cart.price}" pattern="###,####,###"/>원
												</td>

												<td class="quaninput">
													<input type="hidden" id="mId" name="mId" value="${member.MId}" />
													<input type="hidden" id="ucId" name="ucId" value="${cart.ucId}" />
													<input type="hidden" id="ucId" name="ucId" value="${cart.ucId}" />
													<button type="button" id="plus_btn" name="plus" onclick="fnCalCount('m',this);">-</button>
													<input type="text" id="cquantity" name="cquantity" value="${cart.cquantity}" size="1" max="">
													<button type="button" id="minus_btn" name="minus" onclick="fnCalCount('p',this);">+</button></br>
													<input type="submit" id="modify" class="modifybtn" value="변경"/>
													<!-- <button type="submit" id="modify">변경</button> -->
												</td>

												<%-- <td class="modifyinput">
													<a href="<%=request.getContextPath()%>/updateCart.do?mId=${member.MId}">
														<button type="submit" id="modify">변경</button>
													<!-- </a> -->
												</td> --%>
												
												<td class="">
												<fmt:formatNumber value="${cart.price * cart.cquantity}"
													pattern="###,####,###" />원</td>
									</form>
										<input type="hidden" id="mId" name="mId" value="${member.MId}" />
										<td class="">
											<a class="product-remove" href="deleteCart.do?ucId=${cart.ucId}&mId=${member.MId}">삭제</a>
										</td>
											</tr>
											
											<c:set var="sumPrice" value="${sumPrice + cart.cquantity * cart.price}" />
										</c:forEach>

									</tbody>
									<tr>
									</tr>
								</table>
							<div class="summary-total">
							<h4>
								<span style="font-weight:bold;">Total </span>
								<span><fmt:formatNumber value="${sumPrice}" pattern="###,####,###" />원</span></h4>
							</div>
							<div class="checkout_btn">
								<a href="<%=request.getContextPath()%>/checkout.do?mId=${member.MId}"
									class="btn btn-main pull-right" onclick="cart_add()">주문하기</a>
							</div>


						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>

<script type="text/javascript">


	function fnCalCount(type, ths) {
		var $input = $(ths).parents("td").find("input[name='cquantity']");
		var tCount = Number($input.val());
		/* var tEqCount = Number($(ths).parents("tr").find("td.bseq_ea").html()); */

		if (type == 'p') {
			if (tCount < 100)
				$input.val(Number(tCount) + 1);

		} else {
			if (tCount > 1)
				$input.val(Number(tCount) - 1);
		}
	}
</script>



<%@ include file="../include/footer.jspf"%>
