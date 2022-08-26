<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<%@ include file="../include/header.jspf"%>
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

#write_btn {
	text-align: right;
}
</style>


<body id="body">

	<!-- Main Menu Section -->
	<section class="page-header">
		<div class="container">
			<div class="row">
				<div class="col-md-12">
					<div class="content">
						<h1 class="page-name">Community</h1>
					</div>
				</div>
			</div>
		</div>
	</section>

	<section class="user-dashboard page-wrapper">
		<div class="container">
			<div class="row">
				<div class="col-md-12">
					<div class="dashboard-wrapper user-dashboard">
						<div class="table-responsive">
							<form role="form" method="get">
								<table class="table">
									<thead>
										<tr>
											<th>번호</th>
											<th>작성자</th>
											<th>제목</th>
											<th>작성일</th>
											<th></th>
										</tr>
									</thead>
									<tbody>
										<c:forEach var="CommunityVO" items="${list}">
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
										<div id="write_btn">
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
	</section>

	<script>
		var result = '${msg}';

		if (result == 'SUCCESS') {
			alert("처리가 완료되었습니다.");
		}
	</script>
	<%@ include file="../include/footer.jspf"%>

</body>
