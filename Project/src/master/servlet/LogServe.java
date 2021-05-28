package master.servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import master.DAO.AddDAO;
import master.DTO.AddDTO;

/**
 * Servlet implementation class LogServe
 */
public class LogServe extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		HttpSession session = request.getSession();
		
		AddDAO loginDao = new AddDAO();
		
		int studentId = Integer.parseInt(request.getParameter("studentId"));
		String pass = request.getParameter("pass");
		
		
		AddDTO rdto = loginDao.validate(studentId, pass);
		
		
		if (rdto!= null && rdto.getName()!=null)
		{
			
            session.setAttribute("id", studentId);
			
			response.sendRedirect("afterStudentLogin.jsp");
			
		}
		else 
		{
			
			request.setAttribute("message", "Invalid Username or Password");
			request.getRequestDispatcher("login.jsp").forward(request, response);
			
			
		}
	}

}
