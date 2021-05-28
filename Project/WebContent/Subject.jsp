<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<!DOCTYPE html>
<html>

<head>
<meta charset="utf-8" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, maximum-scale=1" />

<title>Add Subject</title>
<!-- BOOTSTRAP CORE STYLE  -->
<link href="assets/css/bootstrap.css" rel="stylesheet" />
<!-- FONT AWESOME STYLE  -->
<link href="assets/css/font-awesome.css" rel="stylesheet" />
<!-- DATATABLE STYLE  -->
<link href="assets/js/dataTables/dataTables.bootstrap.css"
	rel="stylesheet" />
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

.center {
	display: flex;
	justify-content: center;
	align-items: center;
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
	<!-- MENU SECTION END-->
	<div class="content-wrapper">

		<div class="container ">
			<div class="row pad-botm">
				<div class="col-md-12">
					<h4 class="header-line">Add Subject</h4>
				</div>
			</div>


			<div class="row center">
				<div class="col-md-6 col-sm-6 col-xs-12 ">
					<div class="panel panel-info">
						<div class="panel-heading">Subject Name</div>
						<div class="panel-body">
							<form action="Subjects" method="POST">
								<h4 style="color: red">${msg }</h4>
								<div class="form-group">
									<label>Subject Name.:</label> <input type="text"
										placeholder="Subject Name" name="sname" required
										class="form-control">

								</div>
								<input type="submit" value="Submit" class="btn btn-primary">

								<input type="reset" value="Clear" class="btn btn-danger">
							</form>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- FOOTER -->
	<section class="footer-section">
		<div class="container">
			<div class="row">
				<div class="col-md-12">&copy; 2021 OnlinExaminationSystem.com</div>

			</div>
		</div>
	</section>

	<script src="assets/js/jquery-1.10.2.js"></script>

	<script src="assets/js/bootstrap.js"></script>

	<script src="assets/js/custom.js"></script>
</body>

</html>