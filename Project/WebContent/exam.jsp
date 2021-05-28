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

<title>Online Exam</title>
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
.pad-botm {
	padding-bottom: 17px;
}

.content-wrapper {
	margin-top: 22px;
	min-height: 545px;
	padding-bottom: 35px;
}

.center {
	display: flex;
	justify-content: center;
	align-items: center;
}
</style>

<script>
        var tim;
        var min = 5;
        var sec = 0;

        function customSubmit(someValue) {
            document.questionForm.minute.value = min;
            document.questionForm.second.value = sec;
            document.getElementById("questionForm").submit();
        }
        function examTimer() {
            if (parseInt(sec) > 0) {
                document.getElementById("showtime").innerHTML = "Time Remaining : "
                    + " " + +min + " Minutes, " + sec + " Seconds";
                sec = parseInt(sec) - 1;
                tim = setTimeout("examTimer()", 1000);
            } else {
                if (parseInt(min) == 0 && parseInt(sec) == 0) {
                    document.getElementById("showtime").innerHTML = "Time Remaining : "
                        + " " + +min + " Minutes, " + sec + " Seconds";
                    window.location.href = "timeValidity.jsp";
                    document.getElementById("questionForm").submit();
                }
                if (parseInt(sec) == 0) {
                    document.getElementById("showtime").innerHTML = "Time Remaining : "
                        + " " + +min + " Minutes, " + sec + " Seconds";
                    min = parseInt(min) - 1;
                    sec = 59;
                    tim = setTimeout("examTimer()", 1000);
                }
            }
        }
    </script>


</head>

<body onload="examTimer()">

	<%
		response.setHeader("Cache-Control", "no-cache, no-store , must-revalidate");
		response.setHeader("Pragma", "no-cache");
		response.setDateHeader("Expire", 0);
		
		if (session.getAttribute("id") == null) {
			response.sendRedirect("index.jsp");
			}
	%>

	<div class="content-wrapper">
		<div class="container">
			<div class="row pad-botm">
				<div class="col-md-12">
					<%
								String selectTopic = request.getParameter("selectTopicid");
								
								AddDAO dao= new AddDAO();
								ResultSet r = dao.getResultFromSqlQuery("select * from subjects where `subject-name`='"+selectTopic+"' ");
								while(r.next()){
									session.setAttribute("selectTopic", r.getInt(1));
								
					%>
					<h4 class="header-line center"><%= r.getString(2) %>
						EXAMINATION
					</h4>

				</div>
				<div id="showtime" style="float: right; color: red"></div>
			</div>
			<div class="row">
				<div class="col-md-12">
					<div class="alert alert-default">
						<form id="questionForm" name="questionForm" action="Examination"
							method="post">


							<% 	
								
								ResultSet rs = dao.getResultFromSqlQuery("select * from questions where `subject-code`='"+r.getInt(1)+"' ");
								int i=0;
							
								
								while(rs.next()){	
									i++;
								
									int id = rs.getInt(2);
									
							%>

							<div class="form-group">
								<label><%=i%>. <%=rs.getString(3)%></label>
							</div>

							<div class="radio">
								<input type="radio" name="<%=id%>" value="A"><%=rs.getString(4)%></div>

							<div class="radio">
								<input type="radio" name="<%=id%>" value="B"><%=rs.getString(5)%></div>

							<div class="radio">
								<input type="radio" name="<%=id%>" value="C"><%=rs.getString(6)%></div>

							<div class="radio">
								<input type="radio" name="<%=id%>" value="D"><%=rs.getString(7)%></div>




							<%
                           			}
                           		}
                           		
                            %>


							<input type="submit" value="Finish" class="btn btn-primary"
								onclick="customSubmit() ">&nbsp;


						</form>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- CONTENT-WRAPPER SECTION END-->
	<section class="footer-section">
		<div class="container">
			<div class="row">
				<div class="col-md-12">&copy; 2021 OnlineExaminationSystem.com
				</div>

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