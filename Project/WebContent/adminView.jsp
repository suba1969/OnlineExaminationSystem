<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>

<head>
<meta charset="utf-8" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, maximum-scale=1" />

<title>Add Student</title>
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
	margin-top: 22px;
	min-height: 466px;
	padding-bottom: 35px;
}
</style>
</head>



<body>
	<%
		response.setHeader("Cache-Control", "no-cache, no-store , must-revalidate");
		response.setHeader("Pragma", "no-cache");
		response.setDateHeader("Expire", 0);
		
		if (session.getAttribute("id") == null) {
			response.sendRedirect("index.jsp");
			}
	%>

	<jsp:include page="AdminHome.jsp"></jsp:include>

	<div class="content-wrapper">
		<div class="container">
			<div class="row pad-botm">
				<div class="col-md-12">
					<h4 class="header-line">ADD STUDENT</h4>
				</div>
			</div>
			<div class="row">
				<div class="col-md-6 col-sm-6 col-xs-12">
					<img src="images/student.png" style="width: 250px; height: 250px;">
				</div>
				<div class="col-md-6 col-sm-6 col-xs-12">
					<div class="panel panel-danger">
						<div class="panel-heading">STUDENT FORM</div>
						<div class="panel-body">
							<!-- FORM SECTION -->

							<form class="form-signin " action="addStudentsByAdmin"
								method="POST">
								<h3 style="color: green">${msg1}</h3>
								<h4 style="color: green">${msg2}${msg3}</h4>

								<input type="text" placeholder="Enter your name" name="name"
									required="" autofocus="" class="form-control"><br>
								<input type="password" class="form-control"
									placeholder="Password" required="" autofocus="" name="pass" /><br>
								<input type="text" placeholder="Enter Email" name="email"
									required="" autofocus="" class="form-control"><br>
								<input type="number" placeholder="Mobile Number" name="mobno"
									class="form-control"><br> <input type="date"
									placeholder="mm/dd/yyyy" name="dob" class="form-control"><br>
								<label>Gender:</label> <input type="radio" name="gender"
									value="male">Male <input type="radio" name="gender"
									value="female">Female <input type="radio" name="gender"
									value="others">Others <br> <label>Address:</label>

								<textarea cols="48" rows="5" placeholder="Enter Address "
									name="add" class="form-control"></textarea>
								<br> <input type="submit" value="REGISTER NOW"
									class="btn btn-success"> <input type="reset"
									value="Clear" class="btn btn-danger">

							</form>
						</div>
					</div>
				</div>
			</div>
			<!--/.ROW-->
		</div>
	</div>


	<section class="footer-section">
		<div class="container">
			<div class="row">
				<div class="col-md-12">&copy; 2021 OnlineExaminationSystem.com</div>

			</div>
		</div>
	</section>
	<!-- FOOTER SECTION END-->
	<!-- JAVASCRIPT FILES PLACED AT THE BOTTOM TO REDUCE THE LOADING TIME  -->
	<!-- CORE JQUERY  -->
	<script src="assets/js/jquery-1.10.2.js"></script>
	<!-- BOOTSTRAP SCRIPTS  -->
	<script src="assets/js/bootstrap.js"></script>
	<!-- CUSTOM SCRIPTS  -->
	<script src="assets/js/custom.js"></script>


</body>

</html>