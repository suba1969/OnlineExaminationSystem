package master.servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import master.DAO.AddDAO;
import master.DTO.AddDTO;

/**
 * Servlet implementation class Delete
 */
public class Delete extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html");
		int id=Integer.parseInt(request.getParameter("sid"));
		
		AddDTO rdto=new AddDTO();
		rdto.setStudentId(id);;
		
		AddDAO rdao=new AddDAO();
		rdao.deleteData(rdto);
		request.setAttribute("message", "User id: "+id+" Deleted Successfully !!!");
		request.getRequestDispatcher("viewStudents.jsp").forward(request, response);
		}

}
