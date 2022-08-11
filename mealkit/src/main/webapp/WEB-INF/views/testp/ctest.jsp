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


<!DOCTYPE html>
<html lang="ko">
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
<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/plugins/animate/animate.css">
<!-- Slick Carousel -->
<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/plugins/slick/slick.css">
<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/plugins/slick/slick-theme.css">

<!-- Main Stylesheet -->
<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/style.css">

<title>TestingPage</title>
<script src="/resources/plugins/jQuery/jQuery-2.1.4.min.js"></script>

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
					aria-expanded="false">Reviews</a></li>
			</ul>
			<div class="tab-content patternbg">
				<div id="details" class="tab-pane fade active in">
					<img src='<%=request.getContextPath()%>${productOne.image}'>
				</div>
				<div id="reviews" class="tab-pane fade">
							<!-- comment section -->
						<form class="text-left clearfix" action="<%=request.getContextPath()%>/comment.do?pId=${productOne.pId}" method="post">
						<div class="form-group">
           			    <input type="text" name = "reviews" class="form-control"  placeholder="Comment">
           			    <div class="text-center">
           		  	    <button type="submit" class="btn btn-main text-center">submit Comment</button>
            			</div>
           			    </div>
						</form>
							<div class="post-comments">
						    	<ul class="media-list comments-list m-bot-50 clearlist">
								  <div class="media-body">
								    <!-- Comment Item start-->
								    <li class="media">
								        <a class="pull-left" href="#!">
								            <img class="media-object comment-avatar" src="<%=request.getContextPath() %>/resources/images/blog/avater-1.jpg" alt="" width="50" height="50" />
								        </a>
								            <div class="comment-info">
								                <h4 class="comment-author">
								                    <a href="#!">${review.mId} </a>
								                </h4>
								                <a><fmt:formatDate value='${review.regDate}' type='date' pattern='yy.MM.dd'></fmt:formatDate></a>
								                <a class="comment-button" href="#!"><i class="tf-ion-chatbubbles"></i>Reply</a>
								            </div>
								            <p>
								               ${review.content}
								            </p>
								        </div>
								    </li>
							</ul>
							</div>
			</div>
		</div>
	</div>
</div>
</div>


<!-- TESTSECTION -->


	<p>testpage</p>

	<ul class="timeline">
		<li style="cursor: pointer" class="time-label" id="reviewsDiv">
		<span class="bg-green"> reviewsListTEST 
			</span>
		</li>
	</ul>
		<div class = 'text-center'>
		<ul id = "pagination" class="pagination pagination-sm no-margin" >
		
		</ul>
		</div>

<script id="template" type="text/x-handlebars-template">
{{#each .}}
<li class="replyLi" data-rno={{rno}}>
 <div class="post-comments" >
  <span class="time">
    <i class="fa fa-clock-o"></i>regdate:{{prettifyDate regdate}}
  </span>
  <h3 class="timeline-header"><strong>{{rno}}</strong> -{{mid}}</h3>
  <div class="timeline-body">{{content}} </div>
  </div>			
</li>

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
			target.after(html);

		}

		var pid = 189;

		var replyPage = 1;

		function getPage(pageInfo) {
			$.getJSON(pageInfo, function(data) {
				printData(data.list, $("#reviewsDiv"), $('#template'));
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