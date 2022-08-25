<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.sql.DriverManager"%>
<%@ page import="java.sql.Connection"%>
<%@ page import="java.sql.PreparedStatement"%>
<%@ page import="java.sql.ResultSet"%>
<%@ page import="java.sql.SQLException"%>
<%@ page import="java.text.DecimalFormat"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<%@ include file="../include/header.jspf"%>

<c:if test="${not empty productOne}">
	<section class="single-product">
		<div class="container">
			<div class="row">
				<div class="col-md-6">
					<ol class="breadcrumb">
						<li><a href="<%=request.getContextPath()%>/index.do">Home</a></li>
						<li><a href="<%=request.getContextPath()%>/product/listAll">Shop</a></li>
						<li><a
							href="<%=request.getContextPath()%>/product/listType?typeCode=${productOne.typeCode}">${productOne.TNameEng}</a></li>
					</ol>
				</div>
			</div>
			<div class="row mt-20">
				<div class="col-md-5">
					<div class="single-product-slider">
						<div id='carousel-custom' class='carousel slide'
							data-ride='carousel'>
							<div class='carousel-outer'>
								<!-- me art lab slider -->
								<div class='carousel-inner '>
									<div class='item active'>
										<img
											src='<%=request.getContextPath()%>/product/display?fileName=${productOne.thumbnail}'
											alt='' />
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>

				<div class="col-md-7">
					<div class="single-product-details">


						<form action="<%=request.getContextPath()%>/addCart.do"
							id="addCartForm">
							<h2>${productOne.PName}</h2>
							<p class="product-price">${productOne.price}원</p>

							<p class="product-description mt-20">${productOne.description}</p>
							<div class="product-category">
								<span>브랜드</span> ${productOne.brand}
							</div>
							<div class="product-category">
								<span>배송구분</span> [택배] 3,000원
							</div>
							<div class="product-quantity">
								<span>주문 수량</span>
								<div class="product-quantity-slider">
									<input id="product-quantity" type="text" value="1"
										name="cquantity" style="border: 1px solid #e5e5e5;">
								</div>
							</div>


							<c:if test="${member == null}">
								<!-- 로그인 정보가 없을 때 -->
								<a href="<%=request.getContextPath()%>/notLoginCart.do">
									<button type="button" class="btn btn-main mt-20" id="cartBtn">Add
										To Cart</button>
								</a>
							</c:if>
							<c:if test="${member != null}">
								<!-- 로그인 정보가 있을 때 -->
								<input type="hidden" name=mId value="${member.MId}">
								<input type="hidden" name="pId" value="${productOne.PId}">
								<button type="button" class="btn btn-main mt-20" id="cartBtn"
									onclick="checkQuantity();">Add To Cart</button>
							</c:if>

						</form>



					</div>
				</div>
			</div>

			<script>
	function checkQuantity() {
		let addCartForm = document.getElementById("addCartForm");
		if (addCartForm.cquantity.value > 0)
			addCartForm.submit();
		else
			alert("수량을 하나 이상 골라주세요!!!!")
	}
</script>

			<div class="row">
				<div class="col-xs-12">
					<div class="tabCommon mt-20">
						<ul class="nav nav-tabs">
							<li class="active"><a data-toggle="tab" href="#details"
								aria-expanded="true">Details</a></li>
							<li class=""><a data-toggle="tab" href="#reviews"
								aria-expanded="false">Reviews</a></li>
						</ul>
						<div class="tab-content patternbg">
							<div id="details" class="tab-pane fade active in">
								<img src='<%=request.getContextPath()%>/product/display?fileName=${productOne.image}' class="img-responsive">
							</div>


							<div id="reviews" class="tab-pane fade">

								<!-- comment section -->

								<form class="text-left clearfix"
									action="<%=request.getContextPath()%>/comment.do?pId=${productOne.PId}"
									method="post">

									<div class="form-group">
										<input type="text" name="reviews" class="form-control"
											placeholder="Comment">
										<div class="text-center">

											<button type="submit" class="btn btn-main text-center">submit
												Comment</button>
										</div>
									</div>
								</form>
								<!-- comment section end -->
								<%
						if(session.getAttribute("member")!=null){
						%>
								<c:forEach var="review" items="${reviewPage.commentdto}">
									<div class="post-comments">
										<ul class="media-list comments-list m-bot-50 clearlist">
											<div class="media-body">
												<li class="media"><a class="pull-left" href="#!"> <img
														class="media-object comment-avatar"
														src="<%=request.getContextPath() %>/resource/images/blog/avater-1.jpg"
														alt="" width="50" height="50" />
												</a>
													<div class="comment-info">
														<h4 class="comment-author">
															<a href="#!">${review.MId} </a>
														</h4>
														<a><fmt:formatDate value='${review.regDate}'
																type='date' pattern='yy.MM.dd'></fmt:formatDate></a> <a
															class="comment-button" href="#!"><i
															class="tf-ion-chatbubbles"></i>Reply</a>
														<%--   <c:set var = "eachmId" value = "${review.mId}"> --%>
														<c:if test="${sessionScope.MId == review.MId}">
															<a class="pull-right" style="cursor: pointer;"
																<%-- href="#Update?rNo=${review.rNo}" --%>  data-toggle="collapse"
																data-target="#commentupdate${review.rNo}"
																onClick="hideReviewText(${review.rNo})"><i
																class="tf-ion-chatbubbles"></i>Update</a>
															<div id="commentupdate${review.rNo}" class="collapse">
																<form class="text-left clearfix"
																	action="<%=request.getContextPath()%>/update.do?rNo=${review.rNo}"
																	method="post">
																	<div class="form-group">
																		<input type="text" name="contentmodify"
																			class="form-control" value="${review.content}"
																			placeholder="CommentUpdate">
																		<div class="text-center">
																			<button type="submit"
																				class="btn btn-main text-center">Update
																				Comment</button>
																		</div>
																	</div>
																</form>
															</div>
															<br>
															<a class="pull-right" style="cursor: pointer;"
																onClick="deleteReview(${review.rNo})"<%-- 취소시에도 redirect될경우 user응답과 무관하게 삭제됨 href사용시 npe에러 // href="delete.test?rNo=${review.rNo}" onClick="deleteReview()" --%>><i
																class="tf-ion-chatbubbles"></i>Delete</a>
															<!-- rNo가null일경우에러 -->
														</c:if>
														<%-- <%
								                if(request.getAttribute("mId").equals((CommentDTO)pageContext.getAttribute("review").getmId())){
								                %>
								                <a class="pull-right" href="#!"><i class="tf-ion-chatbubbles"></i>Comment</a>
								                <%
								                }
								                %> --%>
														<%-- </c:set> --%>
													</div>
													<p id="reviewContent${review.rNo}">${review.content}</p>
											</div>
											</li>

										</ul>
									</div>
									<script>
//						var inputElement = document.createElement('input')
	

							function deleteReview(rNo){
							//alert(rNo);EL인식못함
							//reviewrNo를 따로받아와야함
							var ask = window.confirm("정말로 삭제하시겠습니까?");
							if(ask){
								window.alert("성공적으로 삭제되었습니다.");
								window.location.href="delete.do?rNo="+rNo;
							}
						}
						
							function hideReviewText(rNo){
								
								var temp = document.getElementById("reviewContent"+rNo);
								

								if(temp.style.visibility == "hidden"){
									temp.style=visibility = "visible";
								}else{
									temp.style.visibility = "hidden";	
								}
							}
							/* https://www.tutorialspoint.com/How-to-hide-HTML-element-with-JavaScript */
						</script>
								</c:forEach>
								<%
						}else{
						  %>
								<c:forEach var="review" items="${reviewPage.commentdto}">
									<div class="post-comments">
										<ul class="media-list comments-list m-bot-50 clearlist">
											<div class="media-body">
												<!-- Comment Item start-->
												<li class="media"><a class="pull-left" href="#!"> <img
														class="media-object comment-avatar"
														src="<%=request.getContextPath() %>/resource/images/blog/avater-1.jpg"
														alt="" width="50" height="50" />
												</a>
													<div class="comment-info">
														<h4 class="comment-author">
															<a href="#!">${review.MId} </a>
														</h4>
														<a><fmt:formatDate value='${review.regDate}'
																type='date' pattern='yy.MM.dd'></fmt:formatDate></a> <a
															class="comment-button" href="#!"><i
															class="tf-ion-chatbubbles"></i>Reply</a>
													</div>
													<p>${review.content}</p>
											</div>
											</li>
										</ul>
									</div>
								</c:forEach>
								<%
						}
						  %>
								<!--  testing code end, set switch-->
							</div>




						</div>
					</div>
				</div>
			</div>
		</div>
	</section>

</c:if>

<section class="products related-products section">
	<div class="container">
		<div class="row">
			<div class="title text-center">
				<h2>Related Products</h2>
			</div>
		</div>
		<div class="row">


			<c:forEach var="relatedList" items="${relatedList}">

				<div class="col-md-3">
					<div class="product-item">
						<div class="product-thumb">
							<img class="img-responsive"
								src="<%=request.getContextPath()%>/product/display?fileName=${relatedList.thumbnail}"
								alt="product-img" />
							<div class="preview-meta">
								<ul>
									<li><a
										href="<%=request.getContextPath()%>/product/detail?pId=${relatedList.PId}"><i
											class="tf-ion-ios-search"></i></a></li>

									<li><a href="#!"><i class="tf-ion-android-cart"></i></a></li>
								</ul>
							</div>
						</div>
						<div class="product-content">
							<h4>
								<a
									href="<%=request.getContextPath()%>/product/detail?pId=${relatedList.PId}">${relatedList.PName}</a>
							</h4>
							<p class="price">${relatedList.price}원</p>
						</div>
					</div>
				</div>

			</c:forEach>

		</div>
	</div>
</section>


<script>
				Handlebars.registerHelper("prettifyDate", function(timeValue) {
					var dateObj = new Date(timeValue);
					var year = dateObj.getFullYear();
					var month = dateObj.getMonth() + 1;
					var date = dateObj.getDate();
					return year + "/" + month + "/" + date;
				});
				//date type변환
				
				
				</script>


<!-- COMMENT-SCRIPT-SECTION -->
<script id="reviews" class="tab-pane fade">				
				{{#each .}}
				<ul class="media-list comments-list m-bot-50 clearlist">
				  <div class="media-body">
				    <li class="media">
				        <a class="pull-left" href="#!">
				            <img class="media-object comment-avatar" src="<%=request.getContextPath() %>/resource/images/blog/avater-1.jpg" alt="" width="50" height="50" />
				        </a>
				            <div class="comment-info">
				                <h4 class="comment-author">
				                    <a href="#!">${review.MId} </a>
				                </h4>
				                <a><fmt:formatDate value='${review.regDate}' type='date' pattern='yy.MM.dd'></fmt:formatDate></a>
				                <a class="comment-button" href="#!"><i class="tf-ion-chatbubbles"></i>Reply</a>
				              <c:if test="${sessionScope.MId == review.MId}">
				                <a class="pull-right" style="cursor:pointer;"  data-toggle="collapse" data-target="#commentupdate${review.rNo}" onClick="hideReviewText(${review.rNo})"><i class="tf-ion-chatbubbles"></i>Update</a>
				                <div id="commentupdate${review.rNo}" class="collapse">
				                <form class="text-left clearfix" action="<%=request.getContextPath()%>/update.do?rNo=${review.rNo}" method="post">
								<div class="form-group">
		    						<input type="text" name = "contentmodify" class="form-control" value="${review.content}"  placeholder="CommentUpdate">
		           			    <div class="text-center">
	  	    						<button type="submit" class="btn btn-main text-center">Update Comment</button>
								</div>
		   							</div>
								</form>
				                </div>
				                  <br>
				                  <a class="pull-right" style="cursor:pointer;" onClick="deleteReview(${review.rNo})" <%-- 취소시에도 redirect될경우 user응답과 무관하게 삭제됨 href사용시 npe에러 // href="delete.test?rNo=${review.rNo}" onClick="deleteReview()" --%>><i class="tf-ion-chatbubbles"></i>Delete</a>
				              </c:if>
				            </div>
				            <p id="reviewContent${review.rNo}">
				               ${review.content}
				            </p>
				        </div>
				    </li>
			</ul>
			{{/each}}	
				</script>

<%@ include file="../include/footer.jspf"%>