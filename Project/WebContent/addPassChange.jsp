<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="master.DAO.*"%>
<%@ page import="java.sql.*"%>
<!DOCTYPE html>
<html>

<head>
<meta charset="utf-8" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, maximum-scale=1" />

<title>Password Change</title>
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

<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<style type="text/css">
.content-wrapper {
	margin-top: 22px;
	min-height: 466px;
	padding-bottom: 35px;
}

.header\-line {
	padding-bottom: 12px;
}

.pad-botm {
	padding-bottom: 5px;
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
					<h4 class="header-line">Change Password</h4>

				</div>
			</div>

			<div class="row">
				<%
				AddDAO rdao= new AddDAO();
				
				ResultSet resultSet = rdao.getResultFromSqlQuery("select * from `admin` where `admin_id`='" + session.getAttribute("id")+"'");
						
				while (resultSet.next()) {
				%>
				<div class="col-md-8 col-sm-8 col-xs-12">
					<div class="panel panel-danger">
						<div class="panel-heading">Change Password</div>
						<div class="panel-body">
							<form action="AdminPassChange" method="post">
								<h3 style="color: green">${msg }</h3>
								<h3 style="color: red">${msg1 }</h3>
								<div class="form-group">
									<label>Current Password.:</label> <input type="text"
										name="cpassword" class="form-control"
										value="<%=resultSet.getString(3)%>" readonly>
								</div>
								<div class="form-group">
									<label>New Password.:</label> <input type="password"
										name="password" class="form-control" required value="">
								</div>
								<div class="form-group">
									<label>Re Type Password.:</label> <input type="password"
										name="confpass" class="form-control" required value="">
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
							<%
								}
							 %>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- CONTENT-WRAPPER SECTION END-->
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