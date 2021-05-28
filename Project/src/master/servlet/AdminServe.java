package master.servlet;
import java.sql.*;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;



/**
 * Servlet implementation class AdminServe
 */
public class AdminServe extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		try{
			response.setContentType("text/html");
			Class.forName("com.mysql.cj.jdbc.Driver");
			Connection cn=DriverManager.getConnection("jdbc:mysql://localhost:3306/exam_portal","root","Subashis1969@");
			PreparedStatement ps= cn.prepareStatement("SELECT * FROM exam_portal.user_details");
        	ResultSet rs=ps.executeQuery();
        	
        	PrintWriter out= response.getWriter();
        	out.println("<html><body><table border='2'><tr><td>Name</td><td>Address</td><td>Email</td><td>Contact No.</td><td>Username</td><td>Password</td><td>DOB</td><td>Gender</td></tr>");
        	while(rs.next()) {
        		out.println("<tr><td>"+rs.getString(1)+"</td><td>"+rs.getString(2)+"</td><td>"+rs.getString(3)+"</td><td>"+rs.getString(4)+"</td><td>"+rs.getString(5)+"</td><td>"+rs.getString(6)+"</td><td>"+rs.getString(7)+"</td><td>"+rs.getString(8)+"</td></tr>");
        		
        	}
        	out.println("</table></body></html>");
		
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}


