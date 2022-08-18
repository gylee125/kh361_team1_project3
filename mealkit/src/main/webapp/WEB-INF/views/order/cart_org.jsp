<%@page import="com.mealkit.order.OrderService"%>
<%@page import="com.mealkit.order.CartVO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.sql.SQLException"%>
<%@ page import="java.sql.DriverManager"%>
<%@ page import="java.sql.Connection"%>
<%@ page import="java.sql.PreparedStatement"%>
<%@ page import="java.sql.ResultSet"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>



<%@ include file="../include/header.jspf" %>

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
							<form id="cart_form" name="cart_form" method="post">
								<table class="table">
									<thead>
										<tr>
											<th class="">상품명</th>
											<th class="">상품가격</th>
											<th class="">상품수량</th>
											<th class="">선택</th>
										</tr>
									</thead>
									<tbody>
										<c:forEach var="cart" items="${cartList}">
											<tr class="">
												<td class="">
													<div class="product-info">
														<img width="80"
															src="<%=request.getContextPath()%>${cart.thumbnail}"
															alt="" /> <a
															href="<%=request.getContextPath()%>/shop/detail.do?pId=${cart.pId}">${cart.pName}</a>
													</div>
												</td>
												<td class=""><fmt:formatNumber value="${cart.price}"
														pattern="###,####,###" />원</td>
												<!-- <td class=""><input type=number id="stuff" value="1" min="1" max="100"></td> -->
												<td class="">
													<button type="button" onclick="fnCalCount('m',this);">-</button>
													<input type="text" id="cquantity" name="cquantity" value="${cart.cquantity}" size="1" max="">
													<button type="button" onclick="fnCalCount('p',this);">+</button>
												</td>

												<td class="">
													<%-- <a href="<%=request.getContextPath()%>/updateCart.do?mId=${member.MId}"> --%>
														<button type="submit">변경</button>
													<!-- </a> -->
												</td>
													
												<td class=""><a class="product-remove"
													href="deleteCart.do?ucId=${cart.ucId}&mId=${member.MId}">삭제</a>
												</td>
											</tr>
										</c:forEach>

									</tbody>
								</table>

								<a
									href="<%=request.getContextPath()%>/checkout.do?mId=${member.MId}"
									class="btn btn-main pull-right" onclick="cart_add()">주문하기</a>
							</form>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>

<script type="text/javascript">
function fnCalCount(type, ths){
    var $input = $(ths).parents("td").find("input[name='cquantity']");
    var tCount = Number($input.val());
    /* var tEqCount = Number($(ths).parents("tr").find("td.bseq_ea").html()); */
    
    if(type=='p'){
        if(tCount < 100) $input.val(Number(tCount)+1);
        
    }else{
        if(tCount >1) $input.val(Number(tCount)-1);    
        }
}
</script>


<%@ include file="../include/footer.jspf" %>
