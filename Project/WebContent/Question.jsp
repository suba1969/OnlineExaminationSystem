<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<!DOCTYPE html>
<html>


<head>
<meta charset="utf-8" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, maximum-scale=1" />

<title>Add Question</title>
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
					<h4 class="header-line">Add Exam Question</h4>
				</div>
			</div>
			<div class="row">
				<div class="col-md-12">

					<form action="QuestionSet" method="post">
						<h4 style="color: green">${msg }</h4>
						<div class="form-group">
							<label>Question.:</label>
							<textarea cols="48" rows="5" placeholder="Enter Question... "
								name="ques" required class="form-control"></textarea>

						</div>
						<div class="form-group">
							<label>Option-A</label>
							<textarea cols="48" rows="2" placeholder="Enter Option 1... "
								name="opt1" required class="form-control"></textarea>
						</div>
						<div class="form-group">
							<label>Option-B</label>
							<textarea cols="48" rows="2" placeholder="Enter Option 2... "
								name="opt2" required class="form-control"></textarea>
						</div>
						<div class="form-group">
							<label>Option-C</label>
							<textarea cols="48" rows="2" placeholder="Enter Option 3... "
								name="opt3" required class="form-control"></textarea>
						</div>
						<div class="form-group">
							<label>Option-D</label>
							<textarea cols="48" rows="2" placeholder="Enter Option 4... "
								name="opt4" required class="form-control"></textarea>
						</div>
						<div class="form-group">
							<label>Correct Answer.:</label> <select name="ans"
								class="form-control">
								<option>A</option>
								<option>B</option>
								<option>C</option>
								<option>D</option>
							</select>
						</div>
						<div class="form-group">
							<label>Marks Alloted</label> <input type="number" name="marks"
								class="form-control">
						</div>
						<input type="submit" value="Add Question" class="btn btn-primary">
						<input type="reset" value="Clear" class="btn btn-danger">
					</form>
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