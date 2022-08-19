<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.sql.SQLException"%>
<%@ page import="java.sql.DriverManager"%>
<%@ page import="java.sql.Connection"%>
<%@ page import="java.sql.PreparedStatement"%>
<%@ page import="java.sql.ResultSet"%>
<%@page import="java.text.DecimalFormat"%>

<%@ include file="../include/header.jspf"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<section class="products section bg-gray">
	<div class="container">
		<div class="row">
			<div class="title text-center">
				<h2>Lists of foods</h2>
			</div>
		</div>
		<div class="row" id="paginationProduct">
			<ul class="post-pagination">

				<!-- href값을 페이지 번호로 대체하여 이를 자바스크립트에서 href값을 통해 form 태그 내 input hidden에 값을 대체하여 form으로 submit -->
				<c:if test="${pageMaker.prev}">
					<li class="paginate_button previous"><a
						href="<%=request.getContextPath()%>/product/listAll?page=${pageMaker.startPage-1}"> prev </a></li>
				</c:if>

				<c:forEach var="num" begin="${pageMaker.startPage}"
					end="${pageMaker.endPage}">
					<li
						class="paginate_button ${pageMaker.cri.page == num ? 'active' :''}">
						<a
						href="<%=request.getContextPath()%>/product/listAll?page=${num}">${num}</a>
					</li>
				</c:forEach>

				<c:if test="${pageMaker.next}">
					<li class="paginate_button next"><a
						href="<%=request.getContextPath()%>/product/listAll?page=${pageMaker.endPage+1}"> next </a></li>
				</c:if>

			</ul>


			<form id='actionForm' action="/board/list" method='get'>
				<input type='hidden' name='pageNum' value='${pageMaker.cri.page}'>
				<input type='hidden' name='amount'
					value='${pageMaker.cri.perPageNum}'>
			</form>

		</div>
		<div class="row">


			<c:forEach var="product" items="${productList}">



				<div class="col-md-4">
					<div class="product-item">
						<div class="product-thumb">
							<img class="img-responsive"
								src="<%=request.getContextPath()%>/product/display?fileName=${product.thumbnail}"
								alt="product-img" />
							<div class="preview-meta">
								<ul>
									<li><a
										href="<%=request.getContextPath()%>/product/detail?pId=${product.PId}"><i
											class="tf-ion-ios-search-strong"></i></a></li>
									<c:if test="${member == null}">
										<!-- 로그인 정보가 없을 때 -->
										<li><a
											href="<%=request.getContextPath()%>/notLoginCart.do"
											class="dropdown-toggle"><i class="tf-ion-android-cart"></i></a>
										</li>
									</c:if>
									<c:if test="${member != null}">
										<!-- 로그인 정보가 있을 때 -->
										<input type="hidden" name=mId value="${member.MId}">
										<input type="hidden" name="pId" value="${product.PId}">
										<li><a
											href="<%=request.getContextPath()%>/addCart.do?mId=${member.MId}&pId=${product.PId}&cquantity=1"><i
												class="tf-ion-android-cart"></i></a></li>
									</c:if>
								</ul>
							</div>
						</div>
						<div class="product-content">
							<h4>
								<a
									href="<%=request.getContextPath()%>/product/detail?pId=${product.PId}">${product.PName}</a>
							</h4>
							<p class="price">${product.price}원</p>
						</div>
					</div>
				</div>
			</c:forEach>

		</div>
	</div>
</section>


<script>
	var actionForm = $("#acionForm");

	$(".pagination_button a").on("click", function(e) {

		e.preventDefault();
		actionForm.find("input[name='page']").val($(this).attr("href"));
		actionForm.submit();
	});
</script>


<%@ include file="../include/footer.jspf"%>