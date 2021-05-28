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

<title>Results</title>
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
	padding-bottom: 23px;
}

.pad-botm {
	padding-bottom: 6px;
}

.form {
	width: 20%;
	float: right;
	border-radius: 7px;
	margin-bottom: 10px;
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

		<div class="container">
			<div class="row pad-botm">
				<div class="col-md-12">

					<h4 class="header-line">All Students</h4>

				</div>

			</div>

			<!-- BODY PART -->
			<div class="row">
				<div class="col-md-12">
					<!-- Advanced Tables -->
					<div class="panel panel-default">
						<div class="panel-heading">All Students</div>
						<div class="panel-body">

							<input type="text" name="search" placeholder="Search" id="search"
								class="form" />
							<div class="table-responsive">



								<table class="table table-striped table-bordered table-hover"
									id="employee_table">
									<thead>
										<tr>
											<th>Result Id</th>
											<th>Student Id</th>
											<th>Student Name</th>
											<th>Subject Code</th>
											<th>Total Questions</th>
											<th>Test Correct Answer</th>
											<th>Test Wrong Answer</th>
											<th>Test Marks</th>
											<th>Date & Time</th>
										</tr>
									</thead>
									<%
								
								AddDAO rdao= new AddDAO();
								ResultSet result = rdao.getResultFromSqlQuery("select * from result ");
								while (result.next()) {

								%>
									<tbody>
										<tr class="success">

											<td><%=result.getInt(1)%></td>
											<td><%=result.getInt(2)%></td>
											<td><%=result.getString(3)%></td>
											<td><%=result.getInt(4)%></td>
											<td><%=result.getInt(5)%></td>
											<td><%=result.getInt(6)%></td>
											<td><%=result.getInt(7)%></td>
											<td><%=result.getInt(8)%></td>
											<td><%=result.getString(9)%></td>
										</tr>
									</tbody>
									<%
									}
								%>
								</table>
							</div>
						</div>
					</div>
					<!--  end  Context Classes  -->
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