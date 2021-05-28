<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>

<head>
<meta charset="utf-8" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, maximum-scale=1" />
<!-- BOOTSTRAP -->
<link href="assets/css/bootstrap.css" rel="stylesheet" />
<!-- FONT AWESOME STYLE  -->
<link href="assets/css/font-awesome.css" rel="stylesheet" />
<!-- CUSTOM STYLE  -->
<link href="assets/css/style.css" rel="stylesheet" />
<!-- GOOGLE FONT -->
<link href='http://fonts.googleapis.com/css?family=Open+Sans'
	rel='stylesheet' type='text/css' />
<link rel="icon" href="images/test.png" type="image/png">
<title>Reset Password</title>
<style type="text/css">
.content-wrapper {
	margin-top: 22px;
	min-height: 466px;
	padding-bottom: 35px;
}

.pad-botm {
	padding-bottom: 8px;
}

.header-line {
	padding-bottom: 8px;
}

.form-group {
	margin-bottom: 0px;
}
</style>
</head>

<body>

	<!-- NAVBAR MENU -->
	<section class="menu-section">
		<div class="container">
			<div class="row">
				<div class="col-md-12">
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
					<h4 class="header-line">Reset Password</h4>

				</div>
			</div>
			<div class="row">
				<div class="col-md-8 col-sm-8 col-xs-12">
					<div class="panel panel-danger">
						<div class="panel-heading">Reset Password</div>
						<div class="panel-body">
							<form action="ForgotPassword" method="post">
								<h3 style="color: green">${message}</h3>
								<h3 style="color: red">${message1}</h3>
								<div class="form-group">
									<label>User Id.:</label> <input type="number" name="uname"
										required class="form-control">
								</div>
								<div class="form-group">
									<label>New Password.:</label> <input type="password"
										name="pass" class="form-control" required>
								</div>
								<div class="form-group">
									<label>Confirm Password.:</label> <input type="password"
										name="confpass" class="form-control" required>
								</div>
								<div class="form-group">
									<label for="message" class="col-4 col-form-label"></label>
									<div class="col-8">
										<input type="submit" value="Change Password"
											class="btn btn-primary"> <input type="reset"
											value="Reset" class="btn btn-danger">
									</div>
								</div>
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