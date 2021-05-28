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

<title>Question List</title>
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

.btn-success {
	margin-bottom: 14px;
}

.form {
	width: 20%;
	float: right;
	border-radius: 7px;
}
</style>

<script>
	function myFunction() {
		var selectTopic = document.getElementById("mySelect").value;
		document.location.href = "examTest.jsp?selectTopic=" + selectTopic;
		
	}
</script>
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
					<h4 class="header-line">All Questions</h4>

				</div>
				<div align="right"></div>
			</div>

			<!-- BODY PART -->
			<div class="row">
				<div class="col-md-12">
					<!-- Advanced Tables -->
					<div class="panel panel-default">
						<div class="panel-heading">All Questions</div>
						<div class="panel-body">
							<a class="btn btn-success" href="Question.jsp">ADD QUESTION</a> <input
								type="text" name="search" placeholder="Search" id="search"
								class="form" />
							<div class="table-responsive">
								<h4 style="color: green">${msg}</h4>

								<table class="table table-striped table-bordered table-hover"
									id="employee_table">

									<thead>
										<tr>

											<th>Sub-code</th>
											<th>Ques-id</th>
											<th>Ques-No.</th>
											<th>Question</th>
											<th>Option-1</th>
											<th>Option-2</th>
											<th>Option-3</th>
											<th>Option-4</th>
											<th>Answer</th>
											<th>Marks</th>
											<th>Actions</th>
										</tr>
									</thead>
									<%
			int id= Integer.parseInt(request.getParameter("sid"));
			
			HttpSession sn=request.getSession();
			sn.setAttribute("scode", id);
        	AddDAO d= new AddDAO();
        	ResultSet rs= d.getResultFromSqlQuery("SELECT * FROM exam_portal.questions where `subject-code`='"+id+"'");
        	int i=0;

        	while(rs.next()) {
        	i++;
	 %>

									<tbody>
										<tr class="odd gradeX">

											<td><%=rs.getString(1)%></td>
											<td><%=rs.getString(2)%></td>
											<td><%=i %>
											<td><%=rs.getString(3)%></td>
											<td><%=rs.getString(4)%></td>
											<td><%=rs.getString(5)%></td>
											<td><%=rs.getString(6)%></td>
											<td><%=rs.getString(7)%></td>
											<td><%=rs.getString(8)%></td>
											<td><%=rs.getString(9)%></td>
											<td><a class="btn btn-primary"
												href="updateQues.jsp?qid=<%=rs.getString(2) %>">Update</a>
												&nbsp; &nbsp; <br> <a class="btn btn-primary"
												href="DeleteQues?qid=<%=rs.getString(2) %>">Delete</a>
										</tr>
									</tbody>
									<%
										}
									
									%>
								</table>
							</div>

						</div>
					</div>
					<!--End Advanced Tables -->
				</div>
			</div>
			<!-- /. ROW  -->
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
	<!-- DATATABLE SCRIPTS  -->
	<script src="assets/js/dataTables/jquery.dataTables.js"></script>
	<script src="assets/js/dataTables/dataTables.bootstrap.js"></script>
	<!-- CUSTOM SCRIPTS  -->
	<script src="assets/js/custom.js"></script>

	<script>  
      $(document).ready(function(){  
           $('#search').keyup(function(){  
                search_table($(this).val());  
           });  
           function search_table(value){  
                $('#employee_table tr').each(function(){  
                     var found = 'false';  
                     $(this).each(function(){  
                          if($(this).text().toLowerCase().indexOf(value.toLowerCase()) >= 0)  
                          {  
                               found = 'true';  
                          }  
                     });  
                     if(found == 'true')  
                     {  
                          $(this).show();  
                     }  
                     else  
                     {  
                          $(this).hide();  
                     }  
                });  
           }  
      });  
 </script>
</body>
</html>