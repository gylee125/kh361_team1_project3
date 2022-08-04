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
		<div class="row">





			<c:forEach var="product" items="${productList}">



				<div class="col-md-4">
					<div class="product-item">
						<div class="product-thumb">
							<img class="img-responsive"
								src="<%=request.getContextPath()%>${product.thumbnail}"
								alt="product-img" />
						</div>
						<div class="product-content">
							<h4>
								<a
									href="<%=request.getContextPath()%>/product/detail?pId=${product.pId}">${product.pName}</a>
							</h4>
							<ul class="list-inline mt-10">
				                <li class="li"><a href="<%=request.getContextPath()%>/product/update?pId=${product.pId}" class="btn btn-main btn-small btn-round">Update</a></li>
				                <li class="li"><a href="<%=request.getContextPath()%>/product/delete?pId=${product.pId}" class="btn btn-main btn-small btn-round">Delete</a></li>
				              </ul>
						</div>
					</div>
				</div>
			</c:forEach>


		</div>
	</div>
</section>


<%@ include file="../include/footer.jspf"%>