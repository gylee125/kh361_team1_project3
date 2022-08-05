<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>	
	
<%@ include file="../include/header.jspf"%>

<body id="body">

	<!-- Main Menu Section -->
	<section class="page-header">
		<div class="container">
			<div class="row">
				<div class="col-md-12">
					<div class="content">
						<h1 class="page-name">Community</h1>
						<ol class="breadcrumb">
							<li><a href="#">Home</a></li>
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
						<li><a class="active" href="address.html">공지사항</a></li>
						<li><a class="active" href="address.html">자유게시판</a></li>
					</ul>
					<div class="dashboard-wrapper user-dashboard">
						<div class="table-responsive">
							<table class="table">
								<thead>
									<tr>
										<th>CNO</th>
										<th>MID</th>
										<th>TITLE</th>
										<th>REGDATE</th>
										<th></th>
									</tr>
								</thead>
								<tbody>
									<c:forEach var="CommunityVO" items="${list}">
										<tr>
											<td>${CommunityVO.cNo}</td>
											<td>${CommunityVO.mId}</td>
											<td><a href='/community/read?cNo=${CommunityVO.cNo}'>${CommunityVO.title}</a></td>
											<td><fmt:formatDate pattern="yyyy-MM-dd HH:mm"
													value="${CommunityVO.regDate}"/></td>
											<!-- <td>
												<div class="btn-group" role="group">
													<button type="button" class="btn btn-default">
														<i class="tf-pencil2" aria-hidden="true"></i>
													</button>
													<button type="button" class="btn btn-default">
														<i class="tf-ion-close" aria-hidden="true"></i>
													</button>
												</div>
											</td> -->
										</tr>
									</c:forEach>
								</tbody>
							</table>
						</div>
					</div>
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
