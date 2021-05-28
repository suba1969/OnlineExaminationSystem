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
 * Servlet implementation class AdminLogin
 */
public class AdminLogin extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int addid=Integer.parseInt(request.getParameter("adminid"));
		String pass= request.getParameter("pass");
		
		AddDAO rdao =new AddDAO();
		AddDTO rdto = rdao.validateAdmin(addid, pass);
		if (rdto!= null && rdto.getAddName()!=null)
		{
			HttpSession session = request.getSession();
            session.setAttribute("id", addid);
            
			response.sendRedirect("afterAdminLogin.jsp");
			
		}
		else 
		{
			
			request.setAttribute("msg", "Invalid Login credentials");
			request.getRequestDispatcher("adminlog.jsp").forward(request, response);
			
			
		}
		
		
	}

}
