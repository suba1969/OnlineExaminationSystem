package master.servlet;

import java.io.IOException;
import java.util.Random;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import master.DAO.AddDAO;
import master.DTO.AddDTO;

/**
 * Servlet implementation class Subjects
 */
public class Subjects extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		Random random = new Random();
		int scode = random.nextInt(8000)+ 10000;
		String sname= request.getParameter("sname");
		
		AddDTO rdto =new AddDTO();
		rdto.setScode(scode);
		rdto.setSname(sname);
		
		
		AddDAO rdao= new AddDAO();
		int i=rdao.insertSubject(rdto);
		if(i>0) {
			HttpSession sn= request.getSession();
			sn.setAttribute("scode", rdto.getScode());
			response.sendRedirect("Question.jsp");
		}else {
			request.setAttribute("msg", "Subject name Already Exists! Please check existing list of subjects");
			request.getRequestDispatcher("Subject.jsp").forward(request, response);;
		}
	}

}
