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

<title>Update Student</title>
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
					<h4 class="header-line">update student details</h4>
				</div>
			</div>
			<div class="row">
				<div class="col-md-8 col-sm-8 col-xs-12">
					<div class="panel panel-danger">
						<div class="panel-heading">Student Details</div>
						<div class="panel-body">
							<% 
			
			int studid= Integer.parseInt(request.getParameter("studid"));
			HttpSession hs= request.getSession();
			hs.setAttribute("studid", studid);
			
        	AddDAO d= new AddDAO();
        	ResultSet rs= d.getResultFromSqlQuery("SELECT * FROM exam_portal.user_details where `s_id`='"+studid+"'");
        	
        	while(rs.next()){
        	%>
							<form action="Update1" method="post">

								<h3 style="color: green">${message }</h3>
								<div class="form-group">
									<label>Student Id.:</label> <input type="number"
										name="studentId" class="form-control"
										value="<%=rs.getInt(1)%>" readonly>
								</div>
								<div class="form-group">
									<label>Student Name.:</label> <input type="text" name="name"
										class="form-control" value="<%=rs.getString(2)%>">
								</div>
								<div class="form-group">
									<label>Password.:</label> <input type="password" name="pass"
										class="form-control" value="<%=rs.getString(3)%>" readonly>
								</div>
								<div class="form-group">
									<label>Email Id.:</label> <input type="text" name="email"
										class="form-control" value="<%=rs.getString(4)%>">
								</div>
								<div class="form-group">
									<label>Mobile Number.:</label> <input type="number"
										name="mobno" class="form-control" value="<%=rs.getString(5)%>">
								</div>
								<div class="form-group">
									<label>Date Of Birth.:</label> <input type="date" name="dob"
										class="form-control" value="<%=rs.getString(6)%>">
								</div>
								<div class="form-group">
									<label>Gender.:</label> <input type="text" name="gender"
										class="form-control" value="<%=rs.getString(7)%>">
								</div>
								<div class="form-group">
									<label>Address.:</label> <input type="text" name="add"
										class="form-control" value="<%=rs.getString(8)%>">
								</div>
								<input type="submit" value="Update Profile"
									class="btn btn-primary">
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