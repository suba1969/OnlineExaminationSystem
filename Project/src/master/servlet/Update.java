package master.servlet;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import master.utilities.ConnectionFactory;

/**
 * Servlet implementation class Update
 */
public class Update extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		try {
		response.setContentType("text/html");
		HttpSession session= request.getSession();
		String name=request.getParameter("name");
		String email=request.getParameter("email");
		String mobno=request.getParameter("mobno");
		String dob = request.getParameter("dob");
		String gender=request.getParameter("gender");
		String add=request.getParameter("add");
		
		Connection cn=null;
		PreparedStatement ps=null;
		ConnectionFactory con=new ConnectionFactory();
		cn=con.getConn();
		int tid= ((Integer)session.getAttribute("id")).intValue();
		ps=cn.prepareStatement("UPDATE `exam_portal`.`user_details` SET `name` = '"+name+"', `email-id` = '"+email+"', `mobile no.` = '"+mobno+"', `date of birth` = '"+dob+"', `gender` = '"+gender+"', `address` = '"+add+"' WHERE (`s_id` = '"+tid+"');");
		int i= ps.executeUpdate();

		
		if(i>0) {
		request.setAttribute("message", "Data Update Successfully !!!");
		request.getRequestDispatcher("editStudentProfile.jsp").forward(request, response);
		}
		else {
			response.sendRedirect("editStudentProfile.jsp");
		}
		}catch(Exception e){
			e.printStackTrace();
		}
		
	}

}
