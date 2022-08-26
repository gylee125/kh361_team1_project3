<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<title>밀슐랭 | 관리자 페이지</title>
<style type="text/css">
.pagination {
	list-style: none;
	float: left;
	padding: 6px;
}

.page-wrapper {
	padding: 0;
}

#keywordInput {
	border-radius: 0;
	box-shadow: none;
	height: 23px;
	outline: none;
	font-weight: 200;
	font-size: 12px;
}

#write_btn{
	text-align: right;
}

</style>
</head>

<body id="body">

	<!-- 취합할 때 협의해서 해당 업무 폴더로 옮기기 -->

	<%@ include file="../include/header.jspf"%>

	<section class="page-header">
		<div class="container">
			<div class="row">
				<div class="col-md-12">
					<div class="content">
						<h1 class="page-name">관리자 페이지</h1>
						<ol class="breadcrumb">
							<li><a href="index.html">Home</a></li>
							<li class="active">Admin Page</li>
						</ol>
					</div>
				</div>
			</div>
		</div>
	</section>


	<section class="user-dashboard page-wrapper">
		<div class="container">
			<div class="row">
				<div class="col-md-12">
					<ul class="list-inline dashboard-menu text-center">
						<li><a href="<%=request.getContextPath()%>/adminPage.do">Member</a></li>
						<li><a
							href="<%=request.getContextPath()%>/product/adminProduct">Product</a></li>
						<li><a href="<%=request.getContextPath()%>/adminOrder.do">Order</a></li>
						<li><a class="active"
							href="<%=request.getContextPath()%>/community/adminBoard.do">Board</a></li>
					</ul>
					<div class="dashboard-wrapper user-dashboard">

						<div class="total-order mt-20">
							<h4>Total Community</h4>
							<div class="table-responsive">
								<form role="form" method="get">
									<table class="table">
										<thead>
											<tr>
												<th>No</th>
												<th>ID</th>
												<th>Title</th>
												<th>Regdate</th>
											</tr>
										</thead>
										<tbody>
											<c:forEach var="CommunityVO" items="${adminList}">
												<tr>
													<td>${CommunityVO.CNo}</td>
													<td>${CommunityVO.MId}</td>
													<td><a
														href='<%=request.getContextPath()%>/community/read?cNo=${CommunityVO.CNo}'>${CommunityVO.title}</a></td>
													<td><fmt:formatDate pattern="yyyy-MM-dd HH:mm"
															value="${CommunityVO.regDate}" /></td>
												</tr>
											</c:forEach>
										</tbody>
									</table>

									<div class="search">
										<select type="text" name="searchType">
											<option value="n"
												<c:out value="${scri.searchType == null ? 'selected' : ''}"/>>-----</option>
											<option value="t"
												<c:out value="${scri.searchType eq 't' ? 'selected' : ''}"/>>제목</option>
											<option value="c"
												<c:out value="${scri.searchType eq 'c' ? 'selected' : ''}"/>>내용</option>
											<option value="w"
												<c:out value="${scri.searchType eq 'w' ? 'selected' : ''}"/>>작성자</option>
											<option value="tc"
												<c:out value="${scri.searchType eq 'tc' ? 'selected' : ''}"/>>제목+내용</option>
										</select> <input type="text" name="keyword" id="keywordInput"
											value="${scri.keyword}" />

										<button id="searchBtn">검색</button>


										<script>
											$(function() {
												$('#searchBtn')
														.click(
																function() {
																	self.location = "list"
																			+ '${pageMaker.makeQuery(1)}'
																			+ "&searchType="
																			+ $(
																					"select option:selected")
																					.val()
																			+ "&keyword="
																			+ encodeURIComponent($(
																					'#keywordInput')
																					.val());
																});
											});
										</script>
										<c:if test="${sessionScope.member.MId !=null}">
										<div id = "write_btn">
											<a class="btn btn-main" 
												href="<%=request.getContextPath()%>/community/write">Write</a>
												</div>
										</c:if>
									</div>

									<div class="box-footer">
										<div class="text-center">
											<ul class="pagination">

												<c:if test="${pageMaker.prev}">
													<li><a
														href="list${pageMaker.makeSearch(pageMaker.startPage - 1)}">이전</a></li>
												</c:if>

												<c:forEach begin="${pageMaker.startPage}"
													end="${pageMaker.endPage}" var="idx">
													<li><a href="list${pageMaker.makeSearch(idx)}">${idx}</a></li>
												</c:forEach>

												<c:if test="${pageMaker.next && pageMaker.endPage > 0}">
													<li><a
														href="list${pageMaker.makeSearch(pageMaker.endPage + 1)}">다음</a></li>
												</c:if>

											</ul>
										</div>
									</div>
								</form>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>


	<%@ include file="../include/footer.jspf"%>

</body>
</html>