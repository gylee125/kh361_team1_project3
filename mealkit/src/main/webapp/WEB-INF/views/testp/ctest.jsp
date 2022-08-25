<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.io.*"%>
<%@ page import="java.sql.DriverManager"%>
<%@ page import="java.sql.Connection"%>
<%@ page import="java.sql.PreparedStatement"%>
<%@ page import="java.sql.ResultSet"%>
<%@ page import="java.sql.SQLException"%>
<%@page import="java.text.DecimalFormat"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>


<%@ page import="java.text.SimpleDateFormat"%>
<%@ page import="java.util.Date"%>


<!DOCTYPE html>
<html lang="en">
<head>

<!-- Basic Page Needs
  ================================================== -->
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="description" content="Construction Html5 Template">
<meta name="viewport"
	content="width=device-width, initial-scale=1.0, maximum-scale=5.0">
<meta name="author" content="Themefisher">
<meta name="generator" content="Themefisher Constra HTML Template v1.0">

<!-- Favicon -->
<!-- Themefisher Icon font -->
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/resources/css/style.css">
<!-- bootstrap.min css -->
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/resources/plugins/bootstrap/css/bootstrap.min.css">
<!-- Animate css -->
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/resources/plugins/animate/animate.css">
<!-- Slick Carousel -->
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/resources/plugins/slick/slick.css">
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/resources/plugins/slick/slick-theme.css">

<!-- Main Stylesheet -->
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/resources/css/style.css">

<!-- Main jQuery -->
<%--     <script src="<%=request.getContextPath()%>/resources/plugins/jquery/dist/jquery.min.js"></script> --%>
<!-- <script src="/resources/plugins/jQuery/jQuery-2.1.4.min.js"></script> -->
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.1/jquery.min.js"></script>
<!-- Bootstrap 3.1 -->
<script
	src="<%=request.getContextPath()%>/resources/plugins/bootstrap/js/bootstrap.min.js"></script>
<!-- Bootstrap Touchpin -->
<script
	src="<%=request.getContextPath()%>/resources/plugins/bootstrap-touchspin/dist/jquery.bootstrap-touchspin.min.js"></script>
<!-- Instagram Feed Js -->
<script
	src="<%=request.getContextPath()%>/resources/plugins/instafeed/instafeed.min.js"></script>
<!-- Video Lightbox Plugin -->
<script
	src="<%=request.getContextPath()%>/resources/plugins/ekko-lightbox/dist/ekko-lightbox.min.js"></script>
<!-- Count Down Js -->
<script
	src="<%=request.getContextPath()%>/resources/plugins/syo-timer/build/jquery.syotimer.min.js"></script>

<!-- slick Carousel -->
<script
	src="<%=request.getContextPath()%>/resources/plugins/slick/slick.min.js"></script>
<script
	src="<%=request.getContextPath()%>/resources/plugins/slick/slick-animation.min.js"></script>

<!-- Google Mapl -->
<script
	src="https://maps.googleapis.com/maps/api/js?key=AIzaSyCC72vZw-6tGqFyRhhg5CkF2fqfILn2Tsw"></script>
<script type="text/javascript"
	src="<%=request.getContextPath()%>/resources/plugins/google-map/gmap.js"></script>
<script src="<%=request.getContextPath()%>/resources/js/script.js"></script>


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


<title>TestingPage</title>

<script
	src="https://cdnjs.cloudflare.com/ajax/libs/handlebars.js/3.0.1/handlebars.js"></script>




</head>

<body>

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
						<img src='<%=request.getContextPath()%>/resources/images/logo.png'>

						<!-- testcode -->
						<!-- <style>
						.fileDrop {
	width: 100%;
	height: 200px;
	border: 1px dotted blue;
}
						</style>
						
						<div class='fileDrop'></div>

						<div class='uploadedList'></div>
						
						
						
						<script>
						$(".fileDrop").on("dragenter dragover", function(event) {
							event.preventDefault();
						});

						$(".fileDrop").on("drop", function(event){
							event.preventDefault();
							
							var files = event.originalEvent.dataTransfer.files;
							
							var file = files[0];

							//console.log(file);
							
							var formData = new FormData();
							
							formData.append("file", file);
							
							$.ajax({
								  url: '/uploadAjax',
								  data: formData,
								  dataType:'text',
								  processData: false,
								  contentType: false,
								  type: 'POST',
								  success: function(data){
									  
									  var str ="";
									  
									  if(checkImageType(data)){
										  str ="<div><a href=displayFile?fileName="+getImageLink(data)+">"
												  +"<img src='displayFile?fileName="+data+"'/>"
												  +"</a><small data-src="+data+">X</small></div>";
									  }else{
										  str = "<div><a href='displayFile?fileName="+data+"'>" 
												  + getOriginalName(data)+"</a>"
												  +"<small data-src="+data+">X</small></div></div>";
									  }
									  
									  $(".uploadedList").append(str);
								  }
								});	
						});
						</script> -->
						<!-- tcode -->

					</div>
					<div id="reviews" class="tab-pane fade">
						<!-- comment section -->
						<div>
							<%-- <form id="commentform" class="text-left clearfix"
								action="<%=request.getContextPath()%>/reviews/"
								method="post"> 
							<div class="form-group"> --%>
							<form id="submitform">
								<input type="text" id="submitReviewWriter" name="reviews"
									class="form-control" placeholder="Comment">

								<%-- <!--confirmed testform -->
								<form id="commentform" class="text-left clearfix"
								action="<%=request.getContextPath()%>/reviews/"
								method="post"> 
								
								<input type='file' multiple />
								<div id = "thumbs"></div>								
								</form>
								
								<!-- testform --> --%>


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



							<script>
	
							/* $('input[type="file"]').on('change',function(){
								for(var i = 0 ; i< this.files.length; i ++ ) {
									
									var fr = new FileReader();
									fr.onload = function(e){
										$('#uploadedList').append('<img src="'+e.target.result+'" width = "50px" height = "50px">')
										}
									fr.readAsDataURL(this.files[i]);
								}	
							}) */
							
							
							
								<%-- $("#fileupload").change(function(event){
									alert($(this).val());
								
								var files= event.originalEvent.dataTransfer.files;
								
								var file = files[0];
								
								console.log(file);
								
								var formData = new FormData();
								
								formData.append("file",file);
								
								$.ajax({
									
									url: '<%=request.getContextPath()%>/uploadAjax',
									data : formData,
									dataType:'text',
									processData: false,
									contentType: false,
									type: 'POST',
									success: function(data){
										
										var str = "";
										
										if(checkImageType(data)){
											str = "<div><a href=displayFile?fileName="+getImageLink(data)+">"
													+"<img src='displayFile?fileName="+data+"' />"
													+"</a><small data-src="+data+">X</small></div>";
										}else{
											  str = "<div><a href='displayFile?fileName="+data+"'>" 
											  + getOriginalName(data)+"</a>"
											  +"<small data-src="+data+">X</small></div></div>";
										  }
										  $(".uploadedList").append(str);
									}
								});
								
								}); --%>
								</script>

							<%-- <form id = 'form1' action="<%=request.getContextPath()%>/fileuploadForm" method="post" 
								target="zeroFrame"
								enctype="multipart/form-data">
								<input type='file' name='file'> <input type='submit'>
								</form>	
								<iframe name="zeroFrame"></iframe>
										
								<script>
								
								var result = '${fileSavedName}';

								parent.addFilePath(result);
								
								function addFilePath(msg){
									alert(msg);
									document.getElementById("form1").reset();
								}
								</script> --%>

							<!-- </div>
							</form> -->
						</div>

						<div class="post-comments" id="post-comments"></div>

						<div class='text-center'>
							<ul id="pagination" class="pagination pagination-sm no-margin">

							</ul>
						</div>


					</div>
				</div>
			</div>

		</div>
	</div>


<!-- TESTSECTION -->
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
		Handlebars.registerHelper("prettifyDate", function(timeValue) {
			var dateObj = new Date(timeValue);
			var year = dateObj.getFullYear();
			var month = dateObj.getMonth() + 1;
			var date = dateObj.getDate();
			return year + "/" + month + "/" + date;
		});

		var printData = function(reviewsArr, target, templateObject) {
			var template = Handlebars.compile(templateObject.html());

			var html = template(reviewsArr);
			$(".replyLi").remove();
			//$("#commentform").remove();
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
								//alert("hello");
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
					//$(this).parent().append(html);
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
		
		//deadcode
		/*  document.getElementById("submitReviewWriter").addEventListener("keypress",function(event){
				if(event.key === "Enter"){
					
					event.preventDefault();
					
					document.getElementById("submitReview").click();
				} 
		 }); */
		
		 var formData = new FormData();
		 var filelist;
		 var i = 0;
		 
		 var storeimg = new Array();
		 
			$("#fileupload").on("change",function handleImgFileSelect(e) {

				filelist = document.getElementById("fileupload").files || [];
				
/* 				for(var i = 0 ; i < filelist.length; i ++){
					
					console.log('foundfile' + i + '=' + filelist[i].name);
					
					formData.append("fileupload[]",filelist[i]);
					
				} */
				
				
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
		            
		            /* for(var i = 0 ; i< this.files.length; i ++ ) {
						var fr = new FileReader();
						fr.onload = function(e){
							$('#uploadedList').append('<img src="'+e.target.result+'" width = "50px" height = "50px">')
							}
						fr.readAsDataURL(this.files[i]);
					} */	
		 
					
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
		                /* $(".uploadedList").append('<img src="'+ e.target.result+'" width = "50px" height = "50px" class = "uploadedimg"><small class="deleteimg" style="cursor: pointer" onclick='+deleteFnc(f.name)+'>ClickHereToRemoveIMG</small>'); */
	          	  }
		        }); 
				
			});
		

			
		 $("#submitReview").on("click", function(event) {
			 event.preventDefault();
			var vals = [];
			//savefilename as string
			 
			//var reviewObj = 
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

			//document.getElementById("fileupload").removeChild();
			
			//files = document.getElementById("fileupload").files;
			
			//formData = new FormData();
			
/* 			filelist = document.getElementById("fileupload").files || [];
			
			for(var i = 0 ; i < filelist.length; i ++){
				
				console.log('foundfile' + i + '=' + filelist[i].name);
				
				formData.append("fileupload[]",filelist[i]);
				
			} */
			
			/* for(var i = 0 ; i < files.length ; i ++){
			formData.append("fileupload",$("#fileupload")[i].files[i]);
			} */
			//formData.append("fileupload",$("#fileupload")[0].files[0]);
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
					
					//resetvalues
/* 										 var resultstring = "";
					 for(){
					 resultstring = "<div><a href=displayFile?fileName="+
							 
							 
					 } */
							 
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


</body>


</html>