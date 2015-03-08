<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ page import="com.TO.ResultTO"%>

<!DOCTYPE HTML>
<!--
	Overflow by HTML5 UP
	html5up.net | @n33co
	Free for personal and commercial use under the CCA 3.0 license (html5up.net/license)
-->
<html>
<head>
<title>PEOGLE</title>
<meta http-equiv="content-type" content="text/html; charset=utf-8" />
<meta name="description" content="" />
<meta name="keywords" content="" />
<!--[if lte IE 8]><script src="/css/ie/html5shiv.js"></script><![endif]-->
<script src="js/jquery.min.js"></script>
<script src="js/jquery.scrolly.min.js"></script>
<script src="js/jquery.poptrox.min.js"></script>
<script src="js/skel.min.js"></script>
<script src="js/init.js"></script>

<noscript>
	<link rel="stylesheet" href="css/skel.css" />
	<link rel="stylesheet" href="css/style.css" />
</noscript>
<!--[if lte IE 8]><link rel="stylesheet" href="css/ie/v8.css" /><![endif]-->

<style>
h1 {
	position: absolute;
	left: 380px;
	top: 0px;
}

input {
	position: relative;
	top: 50px;
}

h1.rel {
	position: absolute;
	left: 0px;
	top: 0px;
}

img.googleplus {
	position: absolute;
	left: 20px;
	top: 150px;
}

img.twitter {
	position: absolute;
	left: 20px;
	top: 250px;
}

img.instagram {
	position: absolute;
	left: 20px;
	top: 350px;
}

img.facebook {
	position: absolute;
	right: 20px;
	top: 150px;
}

img.linkedin {
	position: absolute;
	right: 20px;
	top: 250px;
}

img.pinterest {
	position: absolute;
	right: 20px;
	top: 350px;
}

.circle_googleplus {
	position: absolute;
	left: 55px;
	top: 120px;
	width: 50px;
	height: 50px;
	border-radius: 100px;
	font-size: 15px;
	color: #1aa;
	line-height: 20px;
	text-align: center;
	background: #000
}

.circle_twitter {
	position: absolute;
	left: 55px;
	top: 220px;
	width: 50px;
	height: 50px;
	border-radius: 100px;
	font-size: 15px;
	color: #1aa;
	line-height: 20px;
	text-align: center;
	background: #000
}

.circle_instagram {
	position: absolute;
	left: 55px;
	top: 320px;
	width: 50px;
	height: 50px;
	border-radius: 100px;
	font-size: 15px;
	color: #1aa;
	line-height: 20px;
	text-align: center;
	background: #000
}

.circle_facebook {
	position: absolute;
	right: 55px;
	top: 120px;
	width: 50px;
	height: 50px;
	border-radius: 100px;
	font-size: 15px;
	color: #1aa;
	line-height: 20px;
	text-align: center;
	background: #000
}

.circle_linkedin {
	position: absolute;
	right: 55px;
	top: 220px;
	width: 50px;
	height: 50px;
	border-radius: 100px;
	font-size: 15px;
	color: #1aa;
	line-height: 20px;
	text-align: center;
	background: #000
}

.fillwidth {
    min-width: 100%;
    height: auto;
}
.circle_pinterest {
	position: absolute;
	right: 55px;
	top: 320px;
	width: 50px;
	height: 50px;
	border-radius: 100px;
	font-size: 15px;
	color: #1aa;
	line-height: 20px;
	text-align: center;
	background: #000
}

#table_wrapper {
	position: absolute;
	right: 250px;
	top: 50px;
	border: solid 1px #000000;
	background: 	#E6E6B8;
}

#dispImage {
	height: 420px;
	width: 100%;
	overflow: auto;
	display: block;
    margin-left: auto;
    margin-right: auto
}

#datawrapper {
	overflow: auto;
	top:15px;
	height: 420px;
	background: 	#E6E6B8;
}


#tbody {
	height: 450px;
	overflow-y: hidden;
	width: 850px;
}

table {
	width: 100%;
}

td {
	padding: 1px; /* pixels */
}

.td1 {
	position: absolute;
	left: 30px;
	top: 10px;
	width: 55%;
	white-space: nowrap;
}

.td2 {
	width: 30%;
}

.td3 {
	border-right-width: 0;
}

.searchResult {
	color : black;
	text-align: left;
	font-size: medium;
	line-height: 1.5em;
}

a {
	font-weight: bold;
}

a:VISITED {
	font-weight: bold;
}

a:HOVER {
	text-decoration: none;
	color: blue;
}
</style>

<script>
	function handle(e) {
		if (e.keyCode === 13) {
			//location.href = "#banner";

		}
	}
</script>

<script type="text/javascript">
	var el;
	$(document)
			.ready(
					function() {
						$("#search")
								.focusout(
										function() {
											if ($("#search").val() == "") {
												document
														.getElementById("search").value = "Enter a name to search for"
											}
										});
					});

	function erasetext() {
		if (document.getElementById("search").value == "Enter a name to search for") {
			document.getElementById("search").value = "";
		}
	}

	/* var txt = "askljhakjlsfha<br>askljhakjlsfha<br>askljhakjlsfha<br>askljhakjlsfha<br>askljhakjlsfha<br>askljhakjlsfha<br>askljhakjlsfha<br>askljhakjlsfha<br>askljhakjlsfha<br>askljhakjlsfha<br>askljhakjlsfha<br>askljhakjlsfha<br>askljhakjlsfha<br>askljhakjlsfha<br>askljhakjlsfha<br>askljhakjlsfha<br>askljhakjlsfha<br>askljhakjlsfha<br>askljhakjlsfha<br>askljhakjlsfha<br>askljhakjlsfha<br>askljhakjlsfha<br>askljhakjlsfha<br>askljhakjlsfha<br>askljhakjlsfha<br>askljhakjlsfha<br>askljhakjlsfha<br>askljhakjlsfha<br>askljhakjlsfha<br>askljhakjlsfha<br>askljhakjlsfha<br>askljhakjlsfha<br>askljhakjlsfha<br>askljhakjlsfha<br>askljhakjlsfha<br>askljhakjlsfha<br>askljhakjlsfha<br>askljhakjlsfha<br>askljhakjlsfha<br>askljhakjlsfha<br>askljhakjlsfha<br>askljhakjlsfha<br>askljhakjlsfha<br>askljhakjlsfha<br>askljhakjlsfha<br>askljhakjlsfha<br>askljhakjlsfha<br>askljhakjlsfha<br>askljhakjlsfha<br>askljhakjlsfha<br>";
	window.onload = function() {
		document.getElementById("fbcontent").innerHTML += txt;
	}; */

	function switchVisibility(element) {
		if (document.getElementById(element).style.display == "none") {
			document.getElementById(element).style.display = "inline";
		} else {
			document.getElementById(element).style.display = "none";
		}
	}
	
	var elements = [ "pincontent", "fbcontent", "instacontent",
	 				"lincontent", "twitcontent", "googcontent" ];

	function displayC(elementId) {
		imgspc = "imgresult";
		document.getElementById(imgspc).style.display = "none";
		
		for ( var i = 0; i < elements.length; i++) {
			//alert(elements[i]+"->"+elementId+"??"+(elements[i]==elementId));
			if (elements[i] == elementId && document.getElementById(elementId).style.display != "inline") {
				document.getElementById(elementId).style.display = "inline";
				//el = elementId;
			} else {
				document.getElementById(elements[i]).style.display = "none";
			}
		}

	}

	function loadResults() {
		var searchField = $("#search").val();
		var json;
		$.getJSON('getVal', {
			searchText : searchField
		}, function(jsonResponse) {
			json = $.parseJSON(jsonResponse.fbString);
			count = 0;
			$(json).each(

					function(i, val) {

						//alert(val.imgUrl);
						d = "<div class='title'><a href='" + val.completeUrl
								+ "' onmouseover='setSrc(\" " + val.imgUrl
								+ " \")'>" + val.title + "</a></div>";
						d += "<div>" + val.content + "</div>";
						/*$.each(val,function(k,v){
						if(k=="title"){
							val = "<div class = 'title'>"+v+"</div>";
						} else {
							val = "<div>"+v+"</div>";
						}*/
						$("#fbcontent").append(d);
						//}); 
						$("#fbcontent").append("<br/>");
						count++;
					});
			document.getElementById("fbCount").innerHTML += count;
			if (count > 0) {
				switchVisibility("fbCount");
			}
			count = 0;

			json = $.parseJSON(jsonResponse.twitString);
			$(json).each(
					function(i, val) {
						//alert(val.imgUrl);
						d = "<div class='title'><a href='" + val.completeUrl
								+ "' onmouseover='setSrc(\" " + val.imgUrl
								+ " \")'>" + val.title + "</a></div>";
						d += "<div>" + val.content + "</div>";
						/*$.each(val,function(k,v){
						if(k=="title"){
							val = "<div class = 'title'>"+v+"</div>";
						} else {
							val = "<div>"+v+"</div>";
						}*/
						$("#twitcontent").append(d);
						//}); 
						$("#twitcontent").append("<br/>");
						count++;
					});
			document.getElementById("twitCount").innerHTML += count;
			if (count > 0) {
				switchVisibility("twitCount");
			}
			count = 0;

			json = $.parseJSON(jsonResponse.googString);
			$(json).each(
					function(i, val) {
						//alert(val.imgUrl);
						d = "<div class='title'><a href='" + val.completeUrl
								+ "' onmouseover='setSrc(\" " + val.imgUrl
								+ " \")'>" + val.title + "</a></div>";
						d += "<div>" + val.content + "</div>";
						/*$.each(val,function(k,v){
						if(k=="title"){
							val = "<div class = 'title'>"+v+"</div>";
						} else {
							val = "<div>"+v+"</div>";
						}*/
						$("#googcontent").append(d);
						//}); 
						$("#googcontent").append("<br/>");
						count++;
					});
			document.getElementById("googCount").innerHTML += count;
			if (count > 0) {
				switchVisibility("googCount");
			}
			count = 0;

			json = $.parseJSON(jsonResponse.linString);
			$(json).each(
					function(i, val) {
						//alert(val.imgUrl);
						d = "<div class='title'><a href='" + val.completeUrl
								+ "' onmouseover='setSrc(\" " + val.imgUrl
								+ " \")'>" + val.title + "</a></div>";
						d += "<div>" + val.content + "</div>";
						/*$.each(val,function(k,v){
						if(k=="title"){
							val = "<div class = 'title'>"+v+"</div>";
						} else {
							val = "<div>"+v+"</div>";
						}*/
						$("#lincontent").append(d);
						//}); 
						$("#lincontent").append("<br/>");
						count++;
					});
			document.getElementById("linCount").innerHTML += count;
			if (count > 0) {
				switchVisibility("linCount");
			}
			count = 0;

			json = $.parseJSON(jsonResponse.pinString);
			$(json).each(
					function(i, val) {
						//alert(val.imgUrl);
						d = "<div class='title'><a href='" + val.completeUrl
								+ "' onmouseover='setSrc(\" " + val.imgUrl
								+ " \")'>" + val.title + "</a></div>";
						d += "<div>" + val.content + "</div>";
						/*$.each(val,function(k,v){
						if(k=="title"){
							val = "<div class = 'title'>"+v+"</div>";
						} else {
							val = "<div>"+v+"</div>";
						}*/
						$("#pincontent").append(d);
						//}); 
						$("#pincontent").append("<br/>");
						count++;
					});
			document.getElementById("pinCount").innerHTML += count;
			if (count > 0) {
				switchVisibility("pinCount");
			}
			count = 0;

			json = $.parseJSON(jsonResponse.instaString);
			$(json).each(
					function(i, val) {
						//alert(val.imgUrl);
						d = "<div class='title'><a href='" + val.completeUrl
								+ "' onmouseover='setSrc(\" " + val.imgUrl
								+ " \")'>" + val.title + "</a></div>";
						d += "<div>" + val.content + "</div>";
						/*$.each(val,function(k,v){
						if(k=="title"){
							val = "<div class = 'title'>"+v+"</div>";
						} else {
							val = "<div>"+v+"</div>";
						}*/
						$("#instacontent").append(d);
						//}); 
						$("#instacontent").append("<br/>");
						count++
					});
			document.getElementById("instaCount").innerHTML += count;
			if (count > 0) {
				switchVisibility("instaCount");
			}
			count = 0;
			//hndlr(jsonResponse);
		});
	}

	function setSrc(imgUrl) {
		imgspc = "imgresult";
		document.getElementById(imgspc).style.display = "inline";
		document.getElementById(imgspc).src = imgUrl;
	}
</script>


</head>
<body>
</head>
<body>

	<!-- Header -->
	<section id="header">
		<header>
			<div>

				<h1>
					<img src="images/peogle.png" height="350" width="750">
				</h1>

				<form action="#">
					<input type="text" placeholder=" Type a name to PEOGLE ...."
						style="width: 723px;" name="searchText" id="search" />
				</form>



			</div>
		</header>
		<footer>
			<a href="#banner" class="button style2 scrolly-middle"
				onclick="loadResults();">SEARCH</a>
		</footer>
	</section>

	<!-- Banner -->
	<section id="banner">
		<header>
			<a href="#" id="fbIcon" onclick="displayC('fbcontent')"><img
				class="facebook"
				src="lg_icon_kit/Flat Minimalistic Circles/64x64 PNG/facebook.png"
				height="64" width="64"> </a> <a href="#" id="twitIcon"
				onclick="displayC('twitcontent')"><img class="twitter"
				src="lg_icon_kit/Flat Minimalistic Circles/64x64 PNG/twitter.png"
				height="64" width="64"> </a> <a href="#" id="instaIcon"
				onclick="displayC('instacontent')"><img class="instagram"
				src="lg_icon_kit/Flat Minimalistic Circles/64x64 PNG/instagram.png"
				height="64" width="64"> </a> <a href="#" id="googIcon"
				onclick="displayC('googcontent')"><img class="googleplus"
				src="lg_icon_kit/Flat Minimalistic Circles/64x64 PNG/googleplus.png"
				height="64" width="64"> </a> <a href="#" id="linIcon"
				onclick="displayC('lincontent')"><img class="linkedin"
				src="lg_icon_kit/Flat Minimalistic Circles/64x64 PNG/linkedin.png"
				height="64" width="64"> </a> <a href="#" id="pinIcon"
				onclick="displayC('pincontent')"><img class="pinterest"
				src="lg_icon_kit/Flat Minimalistic Circles/64x64 PNG/pinterest.png"
				height="64" width="64"> </a>

			<div class="circle_googleplus" id="googCount" style="display: none"></div>
			<div class="circle_linkedin" id="linCount" style="display: none"></div>
			<div class="circle_twitter" id="twitCount" style="display: none"></div>
			<div class="circle_instagram" id="instaCount" style="display: none"></div>
			<div class="circle_pinterest" id="pinCount" style="display: none"></div>
			<div class="circle_facebook" id="fbCount" style="display: none"></div>

			<h2></h2>
		</header>


		<div id="table_wrapper">
			<div id="tbody">
				<table>
					<tr>
						<td class="td1">
							<div id="datawrapper">
							<div id="fbcontent" class="searchResult" style="display: none;"></div>
							<div id="twitcontent" class="searchResult" style="display: none;"></div>
							<div id="instacontent" class="searchResult" style="display: none;"></div>
							<div id="pincontent" class="searchResult" style="display: none;"></div>
							<div id="lincontent" class="searchResult" style="display: none;"></div>
							<div id="googbcontent" class="searchResult" style="display: none;"></div>
							</div>
						</td>
						<td class="td2">
							<img src="" class="fillwidth" id="imgresult"
							style="display: none; width: 300px; height: 500px;" /></td>
					</tr>
				</table>
			</div>
		</div>


		<br> <br> <br> <br> <br> <br> <br>
		<br> <br> <br>


		<footer>
			<a href="#header" class="button style2 scrolly">Back to Search</a>
		</footer>
	</section>



</body>
</html>