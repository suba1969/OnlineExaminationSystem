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


	<jsp:include page="studentSideHeader.jsp"></jsp:include>

	<div class="content-wrapper">
		<div class="container">
			<div class="row pad-botm">
				<div class="col-md-12 ">
					<%
                    		AddDAO rdao= new AddDAO();
							ResultSet r = rdao.getResultFromSqlQuery("select * from `user_details` where `s_id`='"+session.getAttribute("id")+"' ");
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
							<li>You can Update your personal informations going to
								Profile.</li>
							<li>Take test by going to Exam Test.</li>
							<li>View all previous results from Results.</li>
							<li>Change your password from Change Password.</li>
							<li>Read the Exam Instructions carefully.
							<li>After exam your result and response sheet will be
								available on the screen.
						</ul>
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
