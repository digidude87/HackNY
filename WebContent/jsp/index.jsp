
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>


<html lang="en">

<head>

<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description" content="">
<meta name="author" content="">

<!-- jQuery -->
<%-- <script src="js/jquery.js"></script> --%>
<script
	src="//ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>

<!-- Bootstrap Core JavaScript -->
<script src="js/bootstrap.min.js"></script>

<title>Peogle - Google People</title>
<!-- Bootstrap Core CSS -->
<link href="css/bootstrap.min.css" rel="stylesheet">

<!-- Custom CSS -->
<link href="css/peogle.css" rel="stylesheet">

<!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
<!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
<!--[if lt IE 9]>
        <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
        <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->

<script>
	var fb_results;
	var insta_results;
	var twit_results;
	var lin_results;
	var pin_results;
	var gplus_results;
	var fbcount;
	var instacount;
	var twitcount;
	var lincount;
	var pincount;
	var gpluscount;
	var totalResults;

	/* $('#searchButton').click(function() {
	    $('#spinner').show();
	}); */

	function show(element) {
		if (document.getElementById(element).style.display == "none") {
			document.getElementById(element).style.display = "inline";
		}
	}

	function checkKey(e, textarea) {
		var code = (e.keyCode ? e.keyCode : e.which);
		if (code == 13) { //Enter keycode
			e.preventDefault();
			loadResults();
		}
	}
	
	$(document).ready(function(){
		if($("fullname").val()!=''){
			$("unamediv").hide();
			$("passdiv").hide();
			$("welcomediv").hide();
		}
	});
	function showIcons() {
		$('#fbico').css("display", "inline");
		$('#linico').css("display", "inline");
		$('#pinico').css("display", "inline");
		$('#twitico').css("display", "inline");
		$('#instaico').css("display", "inline");
		$('#googico').css("display", "inline");
	}

	function loadResults() {
		$('#displayTxt').css("display", "none");
		if (document.getElementById('displayImgBox').style.display == 'block') {
			$('#displayImgBox').css("display", "none");
		}
		showIcons();
		var searchField = $("#search").val();
		fb_results = "";
		insta_results = "";
		twit_results = "";
		lin_results = "";
		pin_results = "";
		gplus_results = "";
		totalResults = "";
		fbcount = 0;
		instacount = 0;
		twitcount = 0;
		lincount = 0;
		pincount = 0;
		gpluscount = 0;
		var json;

		$.getJSON('getVal', {
			searchText : searchField
		}, function(jsonResponse) {
			json = $.parseJSON(jsonResponse.fbString);
			count = 0;
			$(json).each(
					function(i, val) {
						d = "<div class='title'><a href='" + val.completeUrl
								+ "' onmouseover='setSrc(\" " + val.imgUrl
								+ " \")' target='_blank'>" + val.title
								+ "</a></div>";
						d += "<div>" + val.content + "</div>";
						fb_results += d;
						fb_results += "<br/>";
						count++;
					});
			if (count == 0) {
				$("#fbico").fadeOut("slow", function() {
				});
			}
			fbcount = count;
			count = 0;

			json = $.parseJSON(jsonResponse.twitString);
			$(json).each(
					function(i, val) {
						d = "<div class='title'><a href='" + val.completeUrl
								+ "' onmouseover='setSrc(\" " + val.imgUrl
								+ " \")' target='_blank'>" + val.title
								+ "</a></div>";
						d += "<div>" + val.content + "</div>";
						twit_results += d + "<br/>";
						count++;
					});
			if (count == 0) {
				$("#twitico").fadeOut("slow", function() {
				});
			}
			twitcount = count;
			count = 0;

			json = $.parseJSON(jsonResponse.googString);
			$(json).each(
					function(i, val) {
						d = "<div class='title'><a href='" + val.completeUrl
								+ "' onmouseover='setSrc(\" " + val.imgUrl
								+ " \")' target='_blank'>" + val.title
								+ "</a></div>";
						d += "<div>" + val.content + "</div>";
						gplus_results += d + "<br/>";
						//}); 
						count++;
					});
			if (count == 0) {
				$("#googico").fadeOut("slow", function() {
				});
			}
			gpluscount = count;
			count = 0;

			json = $.parseJSON(jsonResponse.linString);
			$(json).each(
					function(i, val) {
						d = "<div class='title'><a href='" + val.completeUrl
								+ "' onmouseover='setSrc(\" " + val.imgUrl
								+ " \")' target='_blank'>" + val.title
								+ "</a></div>";
						d += "<div>" + val.content + "</div>";
						lin_results += d + "<br/>";
						count++;
					});
			if (count == 0) {
				$("#linico").fadeOut("slow", function() {
				});
			}
			lincount = count;
			count = 0;

			json = $.parseJSON(jsonResponse.pinString);
			$(json).each(
					function(i, val) {
						d = "<div class='title'><a href='" + val.completeUrl
								+ "' onmouseover='setSrc(\" " + val.imgUrl
								+ " \")' target='_blank'>" + val.title
								+ "</a></div>";
						d += "<div>" + val.content + "</div>";
						pin_results += d + "<br/>";
						count++;
					});
			if (count == 0) {
				$("#pinico").fadeOut("slow", function() {
				});
			}
			pincount = count;
			count = 0;

			json = $.parseJSON(jsonResponse.instaString);
			$(json).each(
					function(i, val) {
						d = "<div class='title'><a href='" + val.completeUrl
								+ "' onmouseover='setSrc(\" " + val.imgUrl
								+ " \")' target='_blank'>" + val.title
								+ "</a></div>";
						d += "<div>" + val.content + "</div>";
						insta_results += d + "<br/>";
						count++;
					});
			if (count == 0) {
				$("#instaico").fadeOut("slow", function() {
				});
			}
			instacount = count;
			count = 0;
			$("#displayTxt").empty();
			cumulativeResult();
			addCount();
			$('#displayTxt').css("display", "block");
			$("#displayTxt").append(totalResults);
		});
	}

	function setSrc(imgUrl) {
		imgspc = "displayImg";
		$('#displayImgBox').css("display", "block");
		document.getElementById(imgspc).src = imgUrl;
	}

	function cumulativeResult() {
		totalCount = fbcount + lincount + pincount + instacount + gpluscount
				+ twitcount;
		resBeg = "Query returned ";
		resEnd = " results .... <br/><br/>";
		totalResults = resBeg + totalCount + resEnd + fb_results + lin_results
				+ pin_results + insta_results + gplus_results + twit_results;

	}

	function addCount() {
		resBeg = "Query returned ";
		resEnd = " results .... <br/><br/>";
		fb_results = resBeg + fbcount + resEnd + fb_results;
		lin_results = resBeg + lincount + resEnd + lin_results;
		pin_results = resBeg + pincount + resEnd + pin_results;
		insta_results = resBeg + instacount + resEnd + insta_results;
		gplus_results = resBeg + gpluscount + resEnd + gplus_results;
		twit_results = resBeg + twitcount + resEnd + twit_results;
	}

	function displayC(elementId) {
		//$("#displayTxt").replaceWith(divClone);
		$("#displayTxt").empty();
		if (elementId == "fbcontent" && fb_results != null) {
			$('#displayTxt').css("display", "block");
			$("#displayTxt").append(fb_results);
		} else if (elementId == "lincontent" && lin_results != null) {
			$('#displayTxt').css("display", "block");
			$("#displayTxt").append(lin_results);
		} else if (elementId == "twitcontent" && twit_results != null) {
			$('#displayTxt').css("display", "block");
			$("#displayTxt").append(twit_results);
		} else if (elementId == "gcontent" && gplus_results != null) {
			$('#displayTxt').css("display", "block");
			$("#displayTxt").append(gplus_results);
		} else if (elementId == "instacontent" && insta_results != null) {
			$('#displayTxt').css("display", "block");
			$("#displayTxt").append(insta_results);
		} else if (elementId == "pincontent" && pin_results != null) {
			$('#displayTxt').css("display", "block");
			$("#displayTxt").append(pin_results);
		}
	}
</script>

</head>

<body>
	<input type="hidden" value="<%=session.getAttribute("fullname")%>" id="fullname"/>
	<div id="bg">
		<img src="images/peogle_bg.jpg" alt="">
	</div>
	<div id="spinner" class="spinner" style="display: none;">
		<img src="images/loading.gif" alt="Loading" />
	</div>
	<div id="wrapper">

		<!-- Sidebar -->
		<div id="sidebar-wrapper">
			<ul class="sidebar-nav">
				<!-- <li class="sidebar-brand"><a href="#"> Start Bootstrap </a>
				</li> -->

				<li><a href="#" onclick="displayC('fbcontent')"><img
						src="images/fb.png" style="width: 90px; height: 90px;" id="fbico" />
				</a>
				</li>
				<li><a href="#" onclick="displayC('twitcontent')"><img
						src="images/twitter.png" style="width: 90px; height: 90px;"
						id="twitico" /> </a>
				</li>
				<li><a href="#" onclick="displayC('gcontent')"><img
						src="images/gplus.png" style="width: 90px; height: 90px;"
						id="googico" /> </a>
				</li>
				<li><a href="#" onclick="displayC('instacontent')"><img
						src="images/insta.png" style="width: 90px; height: 90px;"
						id="instaico" /> </a>
				</li>
				<li><a href="#" onclick="displayC('lincontent')"><img
						src="images/lin_2.png" style="width: 90px; height: 90px;"
						id="linico" /> </a></li>
				<li><a href="#" onclick="displayC('pincontent')"><img
						src="images/pin.png" style="width: 90px; height: 90px;"
						id="pinico" /> </a></li>
			</ul>
		</div>
		<!-- /#sidebar-wrapper -->

		<!-- Page Content -->
		<div id="page-content-wrapper">
			<div class="container-fluid">

				<div class="row" align="center" style="height: 5%">

					<form action="login">
						<div class="col-md-3 col-lg-offset-6" id="unamediv">
							<div class="input-group">
								<input type="text" class="form-control"
									placeholder="Enter Username" name="userName"><span
									class="input-group-btn"></span>
							</div>
						</div>
						<div class="col-md-3" id="passdiv">
							<div class="input-group">
								<input type="password" class="form-control"
									placeholder="Enter Password" name="password"> <span
									class="input-group-btn">
									<button type="submit" class="btn btn-search">Sign-In</button> </span>
							</div>
						</div>
						<div class="col-md-3 col-lg-offset-9" id="welcomediv"
							style="display: none;">
							<div class="input-group">
								<input type="text" class="form-control"
									placeholder="Enter Username" name="userName"><span
									class="input-group-btn"></span>
							</div>
						</div>
					</form>
					<div class="row" align="center" style="height: 40%">
						<div class="col-lg-12">
							<h1>
								<div class="circlenav"
									style="color: grey; background: white; border: solid black;">
									<a href="#menu-toggle" id="menu-toggle"
										title="Click to Access Sidebar"> <img
										src="images/toggle.jpg" style="width: 43px; height: 33px;" />
									</a>
								</div>
								<div class="circle"
									style="color: black; background: #E3E3E3; border: solid black;">
									P</div>
								<div class="circle"
									style="color: grey; background: white; border: solid grey;">
									E</div>
								<div class="circle"
									style="color: black; background: #E3E3E3; border: solid black;">
									O</div>
								<div class="circle"
									style="color: grey; background: white; border: solid grey;">
									G</div>
								<div class="circle"
									style="color: black; background: #E3E3E3; border: solid black;">
									L</div>
								<div class="circle"
									style="color: grey; background: white; border: solid grey;">
									E</div>
							</h1>
							<br>
							<form action="#">
								<div class="input-group">
									<input type="text" class="form-control"
										placeholder=" Type a name to PEOGLE ...." name="searchText"
										id="search" onkeydown="checkKey(event, this)"> <span
										class="input-group-btn">
										<button type="button" class="btn btn-search"
											onclick="loadResults();" id="searchButton">Search</button> </span>
								</div>
							</form>
							<br>
							<!-- <div align="left">
							<a href="#menu-toggle" class="btn btn-default" id="menu-toggle">Toggle
								Menu</a>
						</div> -->
						</div>
					</div>
					<div class="row" align="center" style="height: 50%">
						<div class="col-lg-12">
							<div class="row" align="center" style="height: 100%">
								<div class="col-lg-5">
									<div class="textContainer"
										style="height: 320px; text-align: center; display: none;"
										id="displayImgBox">
										<img src="" class="fillwidth" style="height: 280px;"
											id="displayImg" alt="Image Not Available" />
									</div>
								</div>
								<div class="col-lg-6  col-lg-offset-1">
									<div class="textContainer" style="height: 320px; display: none"
										id="displayTxt"></div>
								</div>
							</div>
						</div>
					</div>
					<div class="row" align="center" style="height: 5%">
						<div class="col-lg-12">
							<div class="copyright" style="width: 100%; text-align: center;">Copyright&copy;AbhiHackNY15</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		<!-- /#page-content-wrapper -->
		<script>
			$("#menu-toggle").click(function(e) {
				e.preventDefault();
				toggle();
			});

			function toggle() {
				$("#wrapper").toggleClass("toggled");
			}
		</script>
		<!-- /#wrapper -->
</body>

</html>
