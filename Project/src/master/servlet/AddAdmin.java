package master.servlet;

import java.io.IOException;
import java.util.Random;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import master.DAO.AddDAO;
import master.DTO.AddDTO;

/**
 * Servlet implementation class AddAdmin
 */
public class AddAdmin extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html");
		
		Random random = new Random();
		int adminId = random.nextInt(90000) + 100000;
		String name= request.getParameter("name");
		String pass= request.getParameter("pass");
		
		 AddDTO rdto= new AddDTO();
		 rdto.setAddId(adminId);;
         rdto.setAddName(name);
         rdto.setAddPass(pass);
		
         AddDAO rdao=new AddDAO();
         rdao.insertAdmin(rdto);
		
				request.setAttribute("msg1","Successfully Registered!!!");
				request.setAttribute("msg2","Your Admin Id: ");
				request.setAttribute("msg3",rdto.getAddId());
				request.getRequestDispatcher("adminRegistration.jsp").forward(request, response);
			
	}

}
