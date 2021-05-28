<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>

<head>
<meta charset="utf-8" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, maximum-scale=1" />
<link href="assets/css/bootstrap.css" rel="stylesheet" />
<!-- FONT AWESOME STYLE  -->
<link href="assets/css/font-awesome.css" rel="stylesheet" />
<!-- CUSTOM STYLE  -->
<link href="assets/css/style.css" rel="stylesheet" />
<!-- GOOGLE FONT -->
<link href='http://fonts.googleapis.com/css?family=Open+Sans'
	rel='stylesheet' type='text/css' />
<link rel="icon" href="images/test.png" type="image/png">
<title>Student Login</title>
<style type="text/css">
.pad-botm {
	padding-bottom: 12px;
}

.content-wrapper {
	margin-top: 22px;
	min-height: 466px;
	padding-bottom: 22px;
}
</style>
<script type="text/javascript">
        function preventBack() { window.history.forward(); }
        setTimeout("preventBack()", 0);
        window.onunload = function () { null };
    </script>
</head>


<body>
	<!-- NAVBAR MENU -->
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



	<!-- BODY PART -->
	<div class="content-wrapper">
		<div class="container">
			<div class="row pad-botm">
				<div class="col-md-12">
					<h4 class="header-line">Student Login</h4>
				</div>
			</div>
			<div class="row">
				<div class="col-md-6 col-sm-6 col-xs-12">
					<img src="images/student.png" style="width: 250px; height: 250px;">
				</div>
				<div class="col-md-6 col-sm-6 col-xs-12">
					<div class="panel panel-info">
						<div class="panel-heading">Student Login</div>
						<div class="panel-body">

							<!-- FORM -->
							<form class="form-signin" action="LogServe" method="POST">

								<h3 style="color: red">${message }</h3>

								<div class="form-group">
									<label>User id.:</label> <input type="number" name="studentId"
										required class="form-control">

								</div>
								<div class="form-group">
									<label>Password.:</label> <input type="password" name="pass"
										required class="form-control">

								</div>

								<input type="submit" value="Login" class="btn btn-primary">

								<input type="reset" value="Clear" class="btn btn-danger">
								<br> <br> <a href="forpass.jsp" id="forgot_pswd">Forgot
									password?</a><br />

							</form>
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

	<script src="assets/js/jquery-1.10.2.js"></script>

	<script src="assets/js/bootstrap.js"></script>

	<script src="assets/js/custom.js"></script>
</body>

</html>