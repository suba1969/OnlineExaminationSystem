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

<title>Home</title>
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

	<div class="content-wrapper">
		<div class="container">
			<div class="row pad-botm">
				<div class="col-md-12">
					<%
                    		AddDAO rdao= new AddDAO();
							ResultSet r = rdao.getResultFromSqlQuery("select * from admin where `admin_id`='"+session.getAttribute("id")+"' ");
							while(r.next()){
                    	 %>
					<h2 class="header-line center">
						WELCOME
						<%=r.getString(2) %></h2>
					<%
                        	}
                         %>
				</div>
			</div>
			<div class="row">
				<div class="col-md-12">
					<div class="alert alert-info">
						<ul>
							<li>Here You can View and Add, Delete or Update students</li>
							<li>Give unique name for each subject</li>
							<li>Set up questions for each subject.</li>
							<li>You can View and Add,Delete or Update questions of a
								subject</li>
							<li>You can View and Add or Delete subjects</li>
							<li>View results of all students who gave exams
							<li>Change your password when ever needed
						</ul>
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