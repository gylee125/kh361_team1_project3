<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.sql.DriverManager"%>
<%@ page import="java.sql.Connection"%>
<%@ page import="java.sql.PreparedStatement"%>
<%@ page import="java.sql.ResultSet"%>
<%@ page import="java.sql.SQLException"%>
<%@page import="java.text.DecimalFormat"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>


<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="java.util.Date" %>


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
<!-- 	<script src="/resources/plugins/jQuery/jQuery-2.1.4.min.js"></script> -->
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
					</div>
					<div id="reviews" class="tab-pane fade">
						<!-- comment section -->
						<div>
							<%-- <form id="commentform" class="text-left clearfix"
								action="<%=request.getContextPath()%>/comment.do?pId=${productOne.pId}"
								method="post"> 
							<div class="form-group"> --%>
								<input type="text" id="submitReviewWriter" name="reviews"
									class="form-control" placeholder="Comment">
								<div class="text-center">
									<button id="submitReview" type="submit"
										class="btn btn-main text-center">submit Comment</button>
								</div>
							
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


<script id="template" type="text/x-handlebars-template">

{{#each .}}
<ui id="reviewreplyLi" class="replyLi" data-rno={{rno}}>
 <div class="post-comments" >
  <span class="time">
    <i class="fa fa-clock-o"></i>regdate:{{prettifyDate regdate}}
  </span>
  <h4 class="comment-author"> <a href="https://www.google.com/search?q={{mId}}">{{mId}}</a></h4>
  <div class="timeline-body">{{content}} </div>
  </div>			
</ui>

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

		$("#reviewsDiv").on("click", function() {
			window.alert("reviewsdiv");

			if ($(".timeline li").size() > 1) {
				return;
			}
			getPage("/reviews/" + 189 + "/1");
			// 189 = pid

		});

		$(".pagination").on("click", "li a", function(event) {

			window.alert("pagination");

			event.preventDefault();

			replyPage = $(this).attr("href");

			getPage("/reviews/" + 189 + "/" + replyPage);

		});

		 $("#submitReview").on("click", function() {
			//var reviewObj = 
			var reviewtextObj = $("#submitReviewWriter");
			var reviewtext = reviewtextObj.val();
			
			//testString
			var mId = 'admin';
			
			$.ajax({
				
				type:'post',
				url:'/reviews/',
				headers: {
					"Content-Type" : "application/json",
					"X-HTTP-Method-Override" : "POST" },
					
					dataType:'text',
					data: JSON.stringify({pid:pid,mId:mId,content:reviewtext,regdate:'1659524489000'}),
					success:function(result){
						
						console.log("result: " + result);
						if(result == 'SUCCESS'){
							alert("posted");
							replyPage = 1;
							getPage("/reviews/"+pid+"/"+replyPage);
							reviewtextObj.val("");
						}
					}});
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

		})
	</script>


</body>


</html>