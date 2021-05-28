package master.servlet;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;


import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;



/**
 * Servlet implementation class ForgotPassword
 */
public class ForgotPassword extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		try{
			response.setContentType("text/html");
			Class.forName("com.mysql.cj.jdbc.Driver");
			Connection cn=DriverManager.getConnection("jdbc:mysql://localhost:3306/exam_portal","root","Subashis1969@");
			
			int uname = Integer.parseInt(request.getParameter("uname"));
			String pass = request.getParameter("pass");
			String confpass= request.getParameter("confpass");
			
			PreparedStatement ps= cn.prepareStatement("UPDATE `exam_portal`.`user_details` SET password=? WHERE(`s_id`=?);");
			ps.setInt(2, uname);
			ps.setString(1, pass);
			int i=0;
        	i=ps.executeUpdate();
		
        	if(i>0 && pass.equals(confpass)) {
        		request.setAttribute("message", "Password has Changed Successfully!!!");
        		request.getRequestDispatcher("forpass.jsp").forward(request, response);
        		
        	}else if(i==0){
        		request.setAttribute("message1", "Please Enter Valid Userid!!!");
        		request.getRequestDispatcher("forpass.jsp").forward(request, response);
        	}else {
        		request.setAttribute("message1", "Password and Confirm Password does not match!!!");
        		request.getRequestDispatcher("forpass.jsp").forward(request, response);
        	}
		
		}catch (Exception e) {
		e.printStackTrace();
		}
	}
}
