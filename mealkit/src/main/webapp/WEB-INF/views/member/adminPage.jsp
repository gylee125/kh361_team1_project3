<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%@ include file="../include/header.jspf"%>

<style>
.search {
	margin-top: 25px;
}
</style>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script>
	$(document).ready(function() {
		
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
				<div class="search text-center">
					<select name="searchType">
						<option value="n"
							<c:out value="${cri.searchType == null?'selected':''}"/>>---</option>
						<option value="i"
							<c:out value="${cri.searchType eq 'i'?'selected':''}"/>>ID</option>
						<option value="n"
							<c:out value="${cri.searchType eq 'n'?'selected':''}"/>>NAME</option>
					</select> 
					<input type="search" name='keyword' id="keywordInput" value='${cri.keyword }'>
					<button id='searchBtn'><i class="tf-ion-ios-search-strong"></i></button>
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
										<th>Since</th>
										<th>Point</th>	
										<th>Level</th>
									</tr>
								</thead>
								<c:if test="${memberlist.size() != 0}">
									<tbody>
										<c:forEach var="list" items="${memberlist}">
											<tr onclick="searchMember('${list.MId}');" style="cursor:pointer;">
												<td>${list.rn}</td>
												<td>${list.MId}</td>
												<td>${list.MName}</td>	
												<td>  
												<fmt:formatDate value="${list.regDate}" pattern="yyyy-MM-dd"/>
												</td>		
												<td> ${list.currentPoint} </td>
												<td>
													<c:choose>
														<c:when test="${list.MLevel == 2}">관리자</c:when>
														<c:when test="${list.MLevel == -1}">탈퇴</c:when>
														<c:otherwise>일반회원</c:otherwise>
													</c:choose>
												</td>												
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
				<li><a href="adminPage.do${pageMaker.makeSearch(pageMaker.startPage - 1)}">Prev</a></li>
			</c:if>
			<c:forEach begin="${pageMaker.startPage }" end="${pageMaker.endPage }" var="idx">
				<li class="active"
					<c:out value="${pageMaker.cri.page == idx?'class =active':''}"/>>
					<a href="adminPage.do${pageMaker.makeSearch(idx)}">${idx}</a>
				</li>
			</c:forEach>
			<c:if test="${pageMaker.next && pageMaker.endPage > 0}">
				<li><a href="listPage${pageMaker.makeSearch(pageMaker.endPage +1) }">Next</a></li>
			</c:if>
		</ul>				
	</div>
</section>

<script>

	let showMemberDetail = document.getElementById("showMemberDetail");
	let withdrawalButton = document.getElementById("withdrawalButton");
	showMemberDetail.style.display = 'none';
	

	//alert("js 작동 테스트 57");
	
	function searchMember(inputId){	
		
		fetch('<%=request.getContextPath()%>/showMemberDetail.do?mId=' + inputId, 
			 {headers: { 'Accept': 'application/json'} }
			)
			.then(response => response.json())		
			.then((data) => 
			{
				//console.log(data);
				alert("회원 비밀번호가 노출됩니다. 보안에 주의하시기 바랍니다.");				
				memberNo.innerHTML = data.mno;
				memberId.innerHTML = data.mid;
				memberName.innerHTML = data.mname;
				memberPw.innerHTML = data.pw;
				memberPhone.innerHTML = data.phone;
				memberEmail.innerHTML = data.email;
				memberAddress.innerHTML = data.address;
				memberRegDate.innerHTML = data.regDate;				
				memberCurrentPoint.innerHTML = data.pointDTO.currentPoint;				
				memberUpdateDate.innerHTML = data.pointDTO.updateDate;	
				divideMemberDisplayAboutLevel(data.mlevel);
				showMemberDetail.style.display = 'block';
			})
			.catch(function(){
				alert("ID 확인바랍니다...");
				showMemberDetail.style.display = 'none';
			});	
	}
	
	function divideMemberDisplayAboutLevel(memberLevel){
		if(memberLevel == 2)					
			memberFontColorAndWithdrawalButtonAboutLevel("관리자", "blue", "block");
		else if(memberLevel == -1)		
			memberFontColorAndWithdrawalButtonAboutLevel("탈퇴", "grey", "none");
		else				
			memberFontColorAndWithdrawalButtonAboutLevel("일반회원", "black", "block");	
	}
	
	function memberFontColorAndWithdrawalButtonAboutLevel(levelName, color, displayButton){
		memberMlevel.innerHTML = levelName;	
		showMemberDetail.style.color= color;
		withdrawalButton.style.display= displayButton;
	}
	
	function modifyMemberByAdmin(){
		location.href='<%=request.getContextPath()%>/modifyMemberByAdmin.do?mId=' + memberId.innerHTML;
	}
	
	function closeAccountByAdmin(){
		confirm("정말로 해당 계정을 탈퇴 처리하시겠습니까?")
		location.href='<%=request.getContextPath()%>/closeAccountByAdmin.do?mId=' + memberId.innerHTML;
	}
	
	function closeMemberDetail(){
		showMemberDetail.style.display = 'none';
	}
	
</script>

<%@ include file="../include/footer.jspf"%> 