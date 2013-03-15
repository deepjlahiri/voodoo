<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<!--[if lt IE 7]> <html class="lt-ie9 lt-ie8 lt-ie7" lang="en"> <![endif]-->
<!--[if IE 7]> <html class="lt-ie9 lt-ie8" lang="en"> <![endif]-->
<!--[if IE 8]> <html class="lt-ie9" lang="en"> <![endif]-->
<!--[if gt IE 8]><!-->
<html lang="en">
<!--<![endif]-->
<script type="text/javascript" src="js/jquery.min.js"></script>
<script type="text/javascript">
	$(function() {
		$(".update_button").click(function() {

			var boxval = $("#status").val();
			var dataString = 'status=' + boxval;

			if (boxval == '') {
				alert("Please Enter Some Text");
			} else {
				$("#flash").show();
				//$("#flash").fadeIn(400).html('<img src="ajax-loader.gif" align="absmiddle"> <span class="loading">Loading Comment...</span>');

				$.ajax({
					type : "POST",
					url : "postUpdate_logic.jsp",
					data : dataString,
					cache : false,
					
					success : function(html) {
						$("#status").attr("value", '');
						$("#status").focus();
						$("#flash").hide();
					}
				});
			}
			return false;
		});
	});
</script>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">

<script type="text/javascript" src="js/jquery.min.js"></script>


<script>
	$(document)
			.ready(
					function() {
						$
						.getJSON(
								"http://localhost:9292/localhost:5984/posts/_changes?since=0&limit=50&descending=true&include_docs=true",
								{},
										function(data) {
											var listOfDocs = data.results;
											//alert( listOfDocs.length );
											for ( var i = listOfDocs.length - 1; i >= 0; i--) {

												//alert(listOfDocs.seq );
												if (listOfDocs[i].doc != null) {
													if (listOfDocs[i].doc.author != null) {

														var ap = listOfDocs[i].doc.author;
														var bp = listOfDocs[i].doc.post_body;

														var post_template = "<br><li>"+ap+"<br>"+bp+"<br><a href=\"#\">like</a>&nbsp&nbsp&nbsp&nbsp<a href=\"#\">comment</a></li><br>";

																
																//$("#posts").after(post_template);
																$("ol").prepend(post_template);
																$("ol li:first").slideDown("slow");

													}
												}
											}
										}

								);

					}); // End eventlistener
</script>

<script type="text/javascript">
			var auto = setInterval(	function ()
			{
				$('#polling').load('postWall_logic.jsp').prepend(html);
				$("ol#polling li:first").slideDown("slow");
			
			}, 30000); // refresh in milliseconds ()
	</script>	
<title>Home</title>
<link href="style2.css" rel="stylesheet" type="text/css" />

<!--[if lt IE 9]><script src="//html5shim.googlecode.com/svn/trunk/html5.js"></script><![endif]-->
</head>

<body>
	<div id="wrap">
		<div id="header">
			<div id="topbar">
				<div id="navigation">
					<ul>
						<li class="active"><a href="#">Home</a></li>
						<li><a href="#">Profile</a></li>
						<li><a href="#">Settings</a></li>
						<li><a href="#">Link</a></li>
						<li><a href="#">Link</a></li>
					</ul>
				</div>
				<div id="searchbar">
					<form action="#">
						<div>
							<input type="text" id="keyword" placeholder="Enter Keyword" /> <span><input
								type="image" src="images/gobutton.jpg" id="button" alt="Go" /></span>
						</div>
					</form>
				</div>

			</div>
			<div id="subnav">
						<a href="logoutServlet">Logout</a>
			</div>

			<h1 id="sitename">VooDoo</h1>
		</div>
		<div id="content">

			<div id="left">

				<div class="clear2"></div>
				<div id="sidebar">

					<h3 class="clear2"></h3>
					<p>
						<img class="leftalign" src="images/img2.jpg" alt="img1" width="50"
							height="50" />
					</p>

					<%
						String user = request.getParameter("Username");
					%>
					<% session.setAttribute("username", user) ; %>
					<h2><%=user%></h2>
					<br> <br>

					<h3>
						<ul>
							<li><a href="#">Friends</a></li>
							<li><a href="#">Groups </a></li>
							<li><a href="#">Images </a></li>
							<li><a href="#">Videos </a></li>
							<li><a href="#">Posts </a></li>
						</ul>
					</h3>
				</div>

			</div>

			<div id="middle">
				<div class="post">
					<br>

					<div id="navigation" style="margin-left: 0px;">
						<ul>
							<li class="active"><a href="#">Post Status</a></li>
							<li><a href="#">Post Files</a></li>
						</ul>
					</div>


					<div>
						<form method="post" name="form" action="">
							<textarea cols="50" rows="5" name="status" id="status"
								maxlength="145" placeholder="Hey !! speak up"></textarea>
							<br> <input style="border-radius: 3px;" type="submit" value="Update" name="submit"
								class="update_button" />
						</form>
					</div>
					<br>

					<div>
						<h3>Recent Posts</h3>
						<div><ol id="posts" class="timeline"></ol></div>
					</div>
					<div id="polling">
						<ol id="timeline"></ol>
					</div>
					
				 

				</div>
			</div>

			<div id="right">
				<div>
					<h2>Active Feeds</h2>
					<br>
					<p>Active feeds will appear here.</p>
				</div>
			</div>


			<div class="clear"></div>
		</div>
		<div id="footer">
			<br>
			<p>
				<a href="#">Back to top</a>
			</p>
		</div>
	</div>
</body>
</html>
