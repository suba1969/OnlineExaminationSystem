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

<title>Responses</title>
<!-- BOOTSTRAP CORE STYLE  -->
<link href="assets/css/bootstrap.css" rel="stylesheet" />
<!-- FONT AWESOME STYLE  -->
<link href="assets/css/font-awesome.css" rel="stylesheet" />
<!-- CUSTOM STYLE  -->
<link href="assets/css/style.css" rel="stylesheet" />
<!-- GOOGLE FONT -->
<link href='http://fonts.googleapis.com/css?family=Open+Sans'
	rel='stylesheet' type='text/css' />
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<link rel="icon" href="images/test.png" type="image/png">
<style type="text/css">
.content-wrapper {
	margin-top: 22px;
	min-height: 466px;
	padding-bottom: 23px;
}

.pad-botm {
	padding-bottom: 6px;
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
				<div class="col-md-12">
					<h4 class="header-line">Exam Result</h4>

				</div>
			</div>
			<div class="row">
				<div class="col-md-12">
					<div class="panel panel-default">
						<div class="panel-heading">Test Results</div>
						<div class="panel-body">
							<div class="table-responsive">
								<table class="table table-striped table-bordered table-hover">
									<thead>
										<tr>

											<th>Subject Name</th>
											<th>Total Questions</th>
											<th>Test Correct Answer</th>
											<th>Test Wrong Answer</th>
											<th>Test Marks</th>
											<th>Date & Time</th>
										</tr>
									</thead>
									<%
								AddDAO rdao = new AddDAO();
								HttpSession sn= request.getSession();
								ResultSet result = rdao.getResultFromSqlQuery("select * from result where `resultid`='"+ sn.getAttribute("scoreid") + "'");
								while (result.next()) {
									ResultSet rs= rdao.getResultFromSqlQuery("select `subject-name` from subjects where `subject-code`='"+result.getString(4)+"'");
									while(rs.next()){
								%>
									<tbody>
										<tr class="success">
											<td><%=rs.getString(1)%></td>
											<td><%=result.getInt(5)%></td>
											<td><%=result.getInt(6)%></td>
											<td><%=result.getInt(7)%></td>
											<td><%=result.getInt(8)%></td>
											<td><%=result.getString(9)%></td>
										</tr>
									</tbody>
									<%
										}
									}
								%>
								</table>
							</div>
						</div>
					</div>
				</div>
				<!--  end  Context Classes  -->
			</div>
		</div>


		<div class="container">
			<div class="row pad-botm">
				<div class="col-md-12">
					<h4 class="header-line">Response Sheet</h4>

				</div>
			</div>
			<div class="row">
				<div class="col-md-12">
					<div class="panel panel-default">
						<div class="panel-heading">Responses</div>
						<div class="panel-body">
							<div class="table-responsive">
								<table class="table table-striped table-bordered table-hover">
									<thead>
										<tr>

											<th>Question</th>
											<th>Hit Answer</th>
											<th>Correct Answer</th>
											<th>Marks</th>
											<th>Exam Date & time</th>


										</tr>
									</thead>
									<%

								ResultSet results = rdao.getResultFromSqlQuery("select * from scores where `scoreid`='"+ sn.getAttribute("scoreid") + "'");
								while(results.next()){
									ResultSet r = rdao.getResultFromSqlQuery("select * from questions where `qid`='"+ results.getInt(3)+ "'");
									while(r.next()){

								%>
									<tbody>
										<tr class="success">

											<td><%=r.getString(3)%></td>
											<td><%=results.getString(4)%></td>
											<td><%=results.getString(5)%></td>
											<td><%=r.getInt(9)%></td>
											<td><%=results.getString(6)%></td>

										</tr>
									</tbody>
									<%
										}
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