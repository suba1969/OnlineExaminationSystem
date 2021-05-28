package master.servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import master.DAO.AddDAO;
import master.DTO.AddDTO;

/**
 * Servlet implementation class DeleteSub
 */
public class DeleteSub extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html");
		int sid= Integer.parseInt(request.getParameter("sid"));
		
		AddDTO rdto= new AddDTO();
		rdto.setScode(sid);
		
		AddDAO rdao=new AddDAO();
		rdao.deleteSub(rdto);
		request.setAttribute("msg", "Subject id: "+sid+" Deleted Successfully !!!");
		request.getRequestDispatcher("addSub.jsp").forward(request, response);
		
	}

}
