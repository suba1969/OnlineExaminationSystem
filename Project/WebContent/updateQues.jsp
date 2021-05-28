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

<title>Update Question</title>
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


	<div class="container">
		<div class="row pad-botm">
			<div class="col-md-12">
				<h4 class="header-line">UPDATE QUESTION</h4>
			</div>
		</div>
		<div class="row">
			<div class="col-md-8 col-sm-8 col-xs-12">
				<div class="panel panel-danger">
					<div class="panel-heading">Update Question</div>
					<div class="panel-body">

						<% 
			
			int qid= Integer.parseInt(request.getParameter("qid"));
			HttpSession hs= request.getSession();
			hs.setAttribute("sid", qid);
			
        	AddDAO d= new AddDAO();
        	ResultSet rs= d.getResultFromSqlQuery("SELECT * FROM exam_portal.questions where `qid`='"+qid+"'");
        	
        	while(rs.next()){
        	%>

						<form action="editQuestion" method="post">

							<div class="form-group">
								<label>Subject Id.:</label> <input type="text" name="sid"
									class="form-control" value="<%=rs.getInt(1)%>" readonly>
							</div>
							<div class="form-group">
								<label>Question Id.:</label> <input type="text" name="qid"
									class="form-control" value="<%=rs.getInt(2)%>" readonly>
							</div>
							<div class="form-group">
								<label>Question.:</label>
								<textarea cols="48" rows="4" name="ques" required
									class="form-control"><%=rs.getString(3)%>
                         			</textarea>

							</div>
							<div class="form-group">
								<label>Option-A.:</label> <input type="text" name="opt1"
									class="form-control" value="<%=rs.getString(4)%>">
							</div>
							<div class="form-group">
								<label>Option-B.:</label> <input type="text" name="opt2"
									class="form-control" value="<%=rs.getString(5)%>">
							</div>
							<div class="form-group">
								<label>Option-C.:</label> <input type="text" name="opt3"
									class="form-control" value="<%=rs.getString(6)%>">
							</div>
							<div class="form-group">
								<label>Option-D.:</label> <input type="text" name="opt4"
									class="form-control" value="<%=rs.getString(7)%>">
							</div>
							<div class="form-group">
								<label>Correct Option.:</label> <select name="ans"
									class="form-control">
									<option><%=rs.getString(8)%></option>
									<option>A</option>
									<option>B</option>
									<option>C</option>
									<option>D</option>
								</select>

							</div>
							<div class="form-group">
								<label>Marks.:</label> <input type="number" name="marks"
									class="form-control" value="<%=rs.getString(9)%>">
							</div>
							<input type="submit" value="Update Question"
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
