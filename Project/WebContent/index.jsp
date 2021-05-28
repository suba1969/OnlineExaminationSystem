<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*"%>
<!DOCTYPE html>
<html>


<head>
<meta charset="utf-8" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, maximum-scale=1" />

<title>Online Exam System</title>
<!-- BOOTSTRAP CORE STYLE  -->
<link href="assets/css/bootstrap.css" rel="stylesheet" />
<!-- FONT AWESOME STYLE  -->
<link href="assets/css/font-awesome.css" rel="stylesheet" />
<!-- CUSTOM STYLE  -->
<link href="assets/css/style.css" rel="stylesheet" />
<!-- GOOGLE FONT -->
<link href='http://fonts.googleapis.com/css?family=Open+Sans'
	rel='stylesheet' type='text/css' />

<link rel="icon" href="images/test.png" type="image/png">

<style type="text/css">
.content-wrapper {
	margin-top: 13px;
	min-height: 466px;
	padding-bottom: 19px;
}

.header-line {
	padding-bottom: 10px;
}

.pad-botm {
	padding-bottom: 1px;
}
</style>

</head>

<body>

	<section class="menu-section">
		<div class="container">
			<div class="row">
				<div class="col-md-12">
					<button type="button" class="navbar-toggle" data-toggle="collapse"
						data-target=".navbar-collapse">
						<span class="icon-bar" style="background: white"> </span> <span
							class="icon-bar" style="background: white"></span> <span
							class="icon-bar" style="background: white"></span>

					</button>
					<div class="navbar-collapse collapse ">
						<ul id="menu-top" class="nav navbar-nav navbar-left">
							<li><a href="index.jsp">Home</a></li>
							<li><a href="Registration.jsp">Registration</a></li>
							<li><a href="login.jsp">Login</a></li>
							<li><a href="adminRegistration.jsp">Admin Registration</a></li>
							<li><a href="adminlog.jsp">Admin Login</a></li>
						</ul>

					</div>

				</div>
			</div>
		</div>
	</section>
	<div class="content-wrapper">
		<div class="container">
			<div class="row pad-botm">
				<div class="col-md-12">
					<center>
						<h2 class="header-line">Online Examination System</h2>
				</div>
			</div>
			<div class="row">
				<div>
					<div id="carousel-example" class="carousel slide slide-bdr"
						data-ride="carousel">

						<div class="carousel-inner">
							<div class="item active">
								<img src="images/Online-Exam-Portal.jpeg"
									style="height: 500px; width: 1500px;" />
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>



	<section class="footer-section">
		<div class="container">
			<div class="row">
				<div class="col-md-12">&copy; 2021 OnlineExaminationSystem.com</div>

			</div>
		</div>
	</section>
	<!-- JAVASCRIPT FILES PLACED AT THE BOTTOM TO REDUCE THE LOADING TIME  -->
	<!-- CORE JQUERY  -->
	<script src="assets/js/jquery-1.10.2.js"></script>
	<!-- BOOTSTRAP SCRIPTS  -->
	<script src="assets/js/bootstrap.js"></script>
	<!-- CUSTOM SCRIPTS  -->
	<script src="assets/js/custom.js"></script>

</body>


</html>