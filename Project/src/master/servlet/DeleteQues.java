package master.servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import master.DAO.AddDAO;
import master.DTO.AddDTO;

/**
 * Servlet implementation class DeleteQues
 */
public class DeleteQues extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		
		response.setContentType("text/html");
		int id=Integer.parseInt(request.getParameter("qid"));
		
		
		
		AddDTO rdto=new AddDTO();
		rdto.setQuesNo(id);
		
		AddDAO rdao=new AddDAO();
		rdao.deleteQues(rdto);
		request.setAttribute("msg", "Quesion id: "+id+" Deleted Successfully !!!");
		request.getRequestDispatcher("addSub.jsp").forward(request, response);
	}

}
