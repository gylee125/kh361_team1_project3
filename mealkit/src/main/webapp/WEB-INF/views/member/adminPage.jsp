<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../include/header.jspf"%>
<style>
.h {
	font-family: "Poppins", sans-serif;
	color: #888783;
	font-size: 14px;
	letter-spacing: 2px;
}
.search-wrap {
	margin-top: 35px;
	margin-left: 375px;
}
.search-wrap input {
	height: 25px;
	width: 290px;
}
.search-wrap button {
	height: 25px;
	width: 25px;
}
</style>
</head>
<body id="body">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script>
	$(document).ready(
			function() {
				$('#searchBtn').on("click", function(event) {
					location.href = "adminPage.do"
									+ '${pageMaker.makeQuery(1)}'
									+ "&searchType="
									+ $("select option:selected").val()
									+ "&keyword=" + $('#keywordInput').val();
				});
		});
	
</script>
	
<section class="page-header">
	<div class="container">
		<div class="row">
			<div class="col-md-12">
				<div class="content">
					<h1 class="page-name">관리자 페이지</h1>
					<ol class="breadcrumb">
						<li><a href="/">Home</a></li>
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
					<li><a class="active" href="<%=request.getContextPath()%>/adminPage.do">Member</a></li>
					<li><a href="<%=request.getContextPath()%>/product/adminProduct">Product</a></li>
					<li><a href="<%=request.getContextPath()%>/adminOrder.do">Order</a></li>
					<li><a href="<%=request.getContextPath()%>/community/adminBoard.do">Board</a></li>
				</ul>
				<div class="search-wrap">
					<select name="searchType">
						<option value="n"
							<c:out value="${cri.searchType == null?'selected':''}"/>>---</option>
						<option value="i"
							<c:out value="${cri.searchType eq 'i'?'selected':''}"/>>ID</option>
						<option value="n"
							<c:out value="${cri.searchType eq 'n'?'selected':''}"/>>NAME</option>
					</select> <input type="text" name='keyword' id="keywordInput"
						value='${cri.keyword }'>
					<button id='searchBtn'>
						<i class="tf-ion-ios-search-strong"></i>
					</button>
				</div>
				<div class="dashboard-wrapper user-dashboard">
					
					<div class="total-order mt-20">
						<h4>Total Members</h4>
						<div class="table-responsive">
							<table class="table">
								<thead>
									<tr>
										<th>No</th>
										<th>ID</th>
										<th>Name</th>	
										<th>Level</th>	
										<th>Point</th>																
										<th>Since</th>
										
									</tr>
								</thead>
								<c:if test="${memberlist.size() != 0}">
									<tbody>
										<c:forEach var="list" items="${memberlist}">
											<tr>
												<td>${list.MNo}</td>
												<td>${list.MId}</td>
												<td>${list.MName}</td>
												<td>${list.email}</td>
												<td>${list.regDate}</td>
												<td>${list.currentPoint}</td>
											</tr>
										</c:forEach>
									</tbody>
								</c:if>
								<c:if test="${memberlist.size() == 0}">
									<tr>
										<td colspan="6" align="center">
												<h4>조회된 결과가 없습니다.</h4>
										</td>
									</tr>
								</c:if>
							</table>
														
														
							<div class="dashboard-wrapper dashboard-user-profile" id="showMemberDetail">
								<div class="media">								
									<div class="media-body">
										<ul class="user-profile-list">
											<li> <span>No:</span> <span id="memberNo"></span> </li>
											<li> <span>ID:</span> <span id="memberId"></span> </li>
											<li> <span>Name:</span><span id="memberName"></span></li>
											<li> <span>Password:</span><span id="memberPw"></span></li>
											<li> <span>Phone:</span> <span id="memberPhone"></span> </li>
											<li> <span>Email:</span> <span id="memberEmail"></span> </li>
											<li> <span>Address:</span> <span id="memberAddress" style="width:50%;"></span> </li>
											<li> <span>Since:</span> <span id="memberRegDate"></span> </li>
											<li> <span>Level:</span> <span id="memberMlevel"></span> </li>
											<li> <span>Point:</span> <span id="memberCurrentPoint"></span> </li>
											<li> <span>Point Update:</span> <span id="memberUpdateDate"></span> </li>
										</ul>										
									</div>									
								</div>
								<br>								
								<button type="button" class="btn btn-main text-center" onclick="modifyMemberByAdmin();">수정</button>														
								<button type="button" class="btn btn-main text-center" onclick="closeMemberDetail();">닫기</button><br><br>
								<button type="button" class="btn btn-main text-center" id="withdrawalButton" onclick="closeAccountByAdmin();">탈퇴</button>	
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<div class="text-center">
		<ul class="pagination post-pagination">
			<c:if test="${pageMaker.prev}">
				<li><a
					href="adminPage.do${pageMaker.makeQuery(pageMaker.startPage - 1)}">Prev</a></li>
			</c:if>
			<c:forEach begin="${pageMaker.startPage }"
				end="${pageMaker.endPage }" var="idx">
				<li class="active"
					<c:out value="${pageMaker.cri.page == idx?'class =active':''}"/>>
					<a href="adminPage.do${pageMaker.makeQuery(idx)}">${idx}</a>
				</li>
			</c:forEach>
			<c:if test="${pageMaker.next && pageMaker.endPage > 0}">
				<li><a
					href="listPage${pageMaker.makeQuery(pageMaker.endPage +1) }">Next</a></li>
			</c:if>
		</ul>
	</div>
</section>


<%@ include file="../include/footer.jspf"%> 