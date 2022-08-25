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

<%@ page import="java.io.*"%>
<style>
input[type="file"] {
	display: none;
}

.custom-file-upload {
	position: relative;
	left: auto;
	border: 1px solid #ccc;
	display: inline-block;
	padding: 6px 12px;
	cursor: pointer;
}
</style>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.1/jquery.min.js"></script>
<script
	src="<%=request.getContextPath()%>/resources/plugins/bootstrap/js/bootstrap.min.js"></script>
<script
	src="<%=request.getContextPath()%>/resources/plugins/bootstrap-touchspin/dist/jquery.bootstrap-touchspin.min.js"></script>
	

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
						id="reviewsDiv" aria-expanded="false">Reviews</a></li>
						</ul>
						<div class="tab-content patternbg">
							<div id="details" class="tab-pane fade active in">
								<img src='<%=request.getContextPath()%>/product/display?fileName=${productOne.image}' class="img-responsive">
							</div>


							<div id="reviews" class="tab-pane fade">
						<!-- comment section -->
						<div>
							<form id="submitform">
								<input type="text" id="submitReviewWriter" name="reviews"
									class="form-control" placeholder="Comment">
								<div class="text-center">
									<label for="fileupload" class="custom-file-upload"> <i
										class="fa fa-cloud-upload"></i> Upload Image
									</label> <input type='file' id='fileupload' name="fileupload[]"
										multiple="multiple" accept=".png, .jpg, .jpeg" />

									<div id="uploadedList" class='uploadedList'></div>

									<button id="submitReview" type="submit"
										class="btn btn-main text-center">submit Comment</button>
								</div>
							</form>
						</div>
						<div class="post-comments" id="post-comments"></div>
						<div class='text-center'>
							<ul id="pagination" class="pagination pagination-sm no-margin">
							</ul>
						</div>
						<script src="https://cdnjs.cloudflare.com/ajax/libs/handlebars.js/3.0.1/handlebars.js"></script>
<!-- 동적으로 생성된 영역을 selector로 참조하기위하여 고유값(rno)를id에부여 -->
<script id="template" type="text/x-handlebars-template">

{{#each .}}
<div id = targetdiv{{rno}}>
<ui id="reviewreplyLi" class="replyLi" data-rno={{rno}}>
 <div class="post-comments" >
  <span class="time">
    <i class="fa fa-clock-o">regdate:{{prettifyDate regDate}}</i>
  </span>
  <h4 class="comment-author"> <a href="https://www.google.com/search?q={{mid}}">{{mid}}</a></h4>
  <div class="timeline-body">{{content}} </div>
<span id = "targetspan{{rno}}">
<img src onerror="imgonerrorfunction('{{rno}}')" >
</span>

<a id = "targetdelete{{rno}}" style="border:solid" class="pull-right" style="cursor:pointer;" onclick="deleteReview('{{rno}}')"><i
		class="tf-ion-chatbubbles"></i>Delete</a>
<a style="border:solid" class="pull-right" style="cursor:pointer;" data-toggle="collapse" data-target="#commentupdate${rno}"
	onClick="hideReviewText(${rno})"><i class="tf-ion-chatbubbles"></i>Update</a>
</br>
<div id="commentupdate${rno}" class="collapse">
	<form class="text-left clearfix" action="<%=request.getContextPath()%>/#" method="post">
		<div class="form-group">
			<input type="text" name="contentmodify" class="form-control" value="${content}" placeholder="CommentUpdate">
			<div class="text-center">
				<button type="submit" class="btn btn-main text-center">Update Comment</button>
			</div>
		</div>
	</form>
</div>
<br>

  </div>			
</ui>

</div>

{{/each}}

</script>

<script>
var printData = function(reviewsArr, target, templateObject) {
	var template = Handlebars.compile(templateObject.html());

	var html = template(reviewsArr);
	$(".replyLi").remove();
	target.after(html);

}

var pid = 189;

var replyPage = 1;



	function getPage(pageInfo) {
	$.getJSON(pageInfo, function(data) {
		printData(data.list, $("#post-comments"), $('#template'));
		printPaging(data.commentPageMaker, $(".pagination"));

	});
}

var printPaging = function(commentPageMaker, target) {

	var str = "";

	if (commentPageMaker.prev) {
		str += "<li><a href='" + (commentPageMaker.startPage - 1)
				+ "'> << </a></li>";
	}

	for (var i = commentPageMaker.startPage, len = commentPageMaker.endPage; i <= len; i++) {
		var strClass = commentPageMaker.cri.page == i ? 'class=active'
				: '';
		str += "<li "+strClass+"><a href='"+i+"'>" + i + "</a></li>";
	}

	if (commentPageMaker.next) {
		str += "<li><a href='" + (commentPageMaker.endPage + 1)
				+ "'> >> </a></li>";
	}

	target.html(str);
};



function deleteReview(rno){
	var ask = window.confirm("삭제하시겠습니까?");
	//file.delete() 
	//Deletes the file or directory denoted by this abstract pathname. Ifthis pathname denotes a directory, then the directory must be empty inorder to be deleted. 
		
	if(ask){
		
		$.ajax({
			type:'delete',
			url:'<%=request.getContextPath() %>/reviews/'+rno,
			headers: {"Content-Type": "application/json", "X-HTTP-Method-Override":"DELETE"},
			dataType:'text',
			success:function(result){
					
				var imgarr = [];
				
				if(result == 'SUCCESS'){
		    		alert("성공적으로 삭제되었습니다.");
		    		$("#targetspan"+rno+" a").each(function(index){
						//a태그앞공백중요
						imgarr.push($(this).attr("href"));
						imgarr.push($(this).children("img").attr("src"));
						
						
						//strict-origin-when-cross-origin
						//$.post(mealkit/deleteAllFiles,{files:imgarr},function(){});
						
						$.ajax({
							type: 'post',
							url: '<%=request.getContextPath() %>/deleteAllFiles',
							/* headers:{"Content-Type": "application/json",
							      "X-HTTP-Method-Override": "POST" }, */
							dataType:'text',
							data:({files:imgarr}),
							traditional : true,
							success:function(){}	
						});
						
						//console.log($(this).attr("href"));
					});
				}
				getPage( "<%=request.getContextPath()%>/reviews/" + pid + "/" + replyPage);
			}
		});
		
	}};


//template의 추가사용없이 동적으로 이미지를 로드하기위하여 append로처리
function imgonerrorfunction(rno){
	$.getJSON('<%= request.getContextPath() %>/reviews/getAttach/'+rno,function(list){
		$(list).each(function(){
			
			var imagetemplate = Handlebars.compile($("#template").html());
			
			var fileInfo = getFileInfo(this);
			
			var html = imagetemplate(fileInfo);
			//console.log(fileInfo);
			
			var refinestr = "<a href="+fileInfo.getLink+"><img src="+fileInfo.imgsrc+" '/>"
			
			//console.log(refinestr);
			//dynamical
			$("#targetspan"+rno).append(refinestr);
		});
		
		});
	};
	
	function getFileInfo(fullName){
		var fileName,imgsrc, getLink;
		
		var fileLink;
		
		    //staticvalue
			imgsrc = "/mealkit/displayFile?fileName="+fullName;
			fileLink = fullName.substr(14);
			
			var front = fullName.substr(0,12); // /2015/07/01/ 
			var end = fullName.substr(14);
			
			getLink = "/mealkit/displayFile?fileName="+front + end;
			
		fileName = fileLink.substr(fileLink.indexOf("_")+1);
		return  {fileName:fileName, imgsrc:imgsrc, getLink:getLink, fullName:fullName};
		
	}

$("#reviewsDiv").on("click", function() {
	//window.alert("reviewsdiv");

	if ($(".timeline li").size() > 1) {
		return;
	}
	getPage("<%=request.getContextPath()%>/reviews/" + 189 + "/1");
	// 189 = pid

});

$(".pagination").on("click", "li a", function(event) {

	window.alert("pagination");

	event.preventDefault();

	replyPage = $(this).attr("href");

	getPage("<%=request.getContextPath() %>/reviews/" + 189 + "/" + replyPage);

});

 var formData = new FormData();
 var filelist;
 
 var storeimg = new Array();
 
	$("#fileupload").on("change",function handleImgFileSelect(e) {

		filelist = document.getElementById("fileupload").files || [];
		
       	var ufiles = e.target.files;
        var filesArr = Array.prototype.slice.call(ufiles);
 
        var reg = /(.*?)\/(jpg|jpeg|png|bmp)$/;
        
        var sel_file;
        var fString = "";
 
        filesArr.forEach(function(f) {
            if (!f.type.match(reg)) {
                alert("확장자는 이미지 확장자만 가능합니다.");
                document.getElementById("fileupload").value = "";
                return;
            }

			storeimg.push(f);
			
			console.log('foundfile=' + f.name);
			
            var reader = new FileReader();
            
            reader.readAsDataURL(f);
                
            reader.onload = function(e) {
            	  var img = $('<img src="' + e.target.result + '"name="'+f.name+'" width="50px" height="50px" class="uploadedimg">');
            	  var imgname = f.name;
            	  var del = $('<small style="cursor: pointer">X</small>');
            	  var spn = $('<span></span>').append(img).append(del)
            	
            	  $(".uploadedList").append(spn);
            	  
            	  del.click(function(event){
            		var clicked = $(this);
            		
            		
            		console.log(imgname);
            		
            		clicked.parent().remove()
            		
            		storeimg = storeimg.filter(function (el){
            			return el.name != imgname;
            		});
            	  });
      	  }
        }); 
		
	});


	
 $("#submitReview").on("click", function(event) {
	 event.preventDefault();
	var vals = [];
	//savefilename as string
	var reviewtextObj = $("#submitReviewWriter");
	var reviewtext = reviewtextObj.val();
	
	if(!reviewtext.trim()){
		window.alert("reviewtext.val-ISEMPTY");
		return;
	}
	
	//testString
	var mId = 'admin';
	
	for(var i = 0; i < storeimg.length ; i ++){
/* 				var uuid = function uuidv4() {
			  return ([1e7]+-1e3+-4e3+-8e3+-1e11).replace(/[018]/g, c =>
			    (c ^ crypto.getRandomValues(new Uint8Array(1))[0] & 15 >> c / 4).toString(16)
			  );
			} */
		
		console.log('foundfile' + i + '=' + storeimg[i].name);
		formData.append("fileupload[]",storeimg[i]);
		//vals.push(storeimg[i].name);
	}

	var data = {
			"contents" : $("#contents").val()
	}
	//neverused?
	formData.append('key',new Blob([JSON.stringify(data)],{type:"application/json"}));
	
	//filename value를 받아사용하기 위하여 추가처리
	$.ajax({
		url: '<%=request.getContextPath()%>/uploadAjax',
		data : formData,
		processData: false,
		contentType: false,
		enctype: 'multipart/form-data',
		async : false,
		type: 'POST',
		success: function(result){
			console.log(result);
			
			//alert(result[0].filename);
			
			for(var i = 0 ; i < result.length ; i ++){
				
				vals.push(result[i].filename);
				console.log(result[i].filename);
				
			}
			
			//$(".uploadedList").removeChild();
			
			document.getElementById("fileupload").value = "";
					 
			 $.ajax({
					type:'post',
					url:'<%=request.getContextPath()%>/reviews/',
					headers: {
						"Content-Type" : "application/json",
						"X-HTTP-Method-Override" : "POST" },
						
						dataType:'text',
						data: JSON.stringify({pid:pid,mid:mId,content:reviewtext,regdate: 'sysdate',files:vals}),
						success:function(result){
							
							console.log("result: " + result);
							
							if(result == 'SUCCESS'){
								//alert("posted");
								replyPage = 1;
								
								getPage( "<%=request.getContextPath()%>/reviews/" + pid + "/" + replyPage);
									reviewtextObj.val("");
												}
											}
									});
			
			const mNode = document.getElementById("uploadedList");
			mNode.textContent = '';
			 formData = new FormData();
			 storeimg = new Array();
		 
			 
					 }				 
			 });
		});
</script>
<script>
		$(document).ready(function() {

			var formObj = $("form[role='form']");

			console.log(formObj);

			//static value for test
			var pid = 189;
			//

			var template = Handlebars.compile($("#templateAttach").html());
			
		});
	</script>
								
							</div><!-- divend -->
							
								<!--  testing code end, set switch-->

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


<%@ include file="../include/footer.jspf"%>