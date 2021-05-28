package master.servlet;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;

import java.sql.ResultSet;
import java.sql.Statement;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


/**
 * Servlet implementation class studentPasswordChange
 */
public class studentPasswordChange extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String cpassword = request.getParameter("cpassword");
		String password = request.getParameter("password");
		String confpass = request.getParameter("confpass");
		String pass = "";
		HttpSession session = request.getSession();
		try {
			response.setContentType("text/html");
			Class.forName("com.mysql.cj.jdbc.Driver");
			Connection cn=DriverManager.getConnection("jdbc:mysql://localhost:3306/exam_portal","root","Subashis1969@");
			Statement statement = cn.createStatement();
			ResultSet resultset = statement.executeQuery("select password from `user_details` where password='" + cpassword+ "' and `s_id`='" + session.getAttribute("id") + "'");
			if (resultset.next()) {
				pass = resultset.getString(1);
			}
			if (password.equals(confpass)) {
				if (pass.equals(cpassword)) {
					statement.executeUpdate("UPDATE `exam_portal`.`user_details` SET password='"+password+"' WHERE(`s_id`='"+ session.getAttribute("id") + "'); ");
					request.setAttribute("msg", "Successfully changed password!!!");
					request.getRequestDispatcher("passwordChange.jsp").forward(request, response);
					statement.close();
					cn.close();
				} else {
					request.setAttribute("msg1", "Password change unsuccessful!!!");
					request.getRequestDispatcher("passwordChange.jsp").forward(request, response);
				}
			} else {
				request.setAttribute("msg1", "Password change unsuccessful!!!");
				request.getRequestDispatcher("passwordChange.jsp").forward(request, response);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

}
