<%@ taglib uri="http://www.opensymphony.com/sitemesh/decorator"
	prefix="decorator"%>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title><decorator:title default="Volunteer Management System" /></title>

<meta name="description" content="" />
<meta name="keywords" content="" />
<link rel="icon" href="<%=request.getContextPath()%>/sys/favicon.ico"
	type="image/x-icon" />
<link rel="shortcut icon" href="favicon.ico"
	type="<%=request.getContextPath()%>/sys/image/x-icon" />

<link href="<%=request.getContextPath()%>/sys/css/global.css"
	rel="stylesheet" type="text/css" />
<link href="<%=request.getContextPath()%>/sys/css/reset.css"
	rel="stylesheet" type="text/css" />

<!--[if lte IE 6]>
<script type="text/javascript" src="<%=request.getContextPath()%>/sys/js/supersleight.js"></script>
<![endif]-->

</head>

<body>
	<div id="wrapper">
		<div id="wrap-top">
			<div id="loginInfo">
				<ul>
					<li><a href="#">My Account</a></li>
					<li class="last"><a href="#">Logout</a></li>
				</ul>
			</div>
		</div>
		<!-- end of wrap-top -->
		<div id="header">
			<h1>Volunteer Management System</h1>
		</div>
		<!-- end of header -->
		<div id="container">
			<div id="leftCol">
				<ul id="info">
					<li><h3>
							Chris Goh<br />Project Manager
						</h3></li>
					<li>Last login : 20/07/2011 15:40</li>
				</ul>
				<ul id="membership">
					<li class="header">Membership</li>
					<li><a href="#">Search Member</a></li>
					<li><a href="#">Manage Profile</a></li>
					<li><a href="#">Review Request</a></li>
				</ul>
				<ul id="project">
					<li class="header">Project</li>
					<li><a href="#">New</a></li>
					<li><a href="#">Manage</a></li>
				</ul>
				<ul id="cert">
					<li class="header">Certificate</li>
					<li><a href="#">Request Cert</a></li>
					<li><a href="#">Generate Cert</a></li>
				</ul>
				<ul id="itinerary">
					<li class="header">Itinerary</</li>
					<li><a href="#">Prepare Plan</a></li>
					<li><a href="#">Review Plan</a></li>
				</ul>
			</div>
			<!-- end of leftCol -->
			<div id="main">
				<decorator:body />
			</div>
			<!-- end of main -->
		</div>
		<!-- end of container -->
	</div>

</body>
</html>
