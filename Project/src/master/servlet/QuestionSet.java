
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


public class QuestionSet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		HttpSession sn=request.getSession();
		int scode= ((Integer) sn.getAttribute("scode")).intValue();
		
		
		Random random = new Random();
		int quesNo= random.nextInt(900) + 1000;
		String ques= request.getParameter("ques");
		String opt1= request.getParameter("opt1");
		String opt2= request.getParameter("opt2");
		String opt3= request.getParameter("opt3");
		String opt4= request.getParameter("opt4");
		String ans= request.getParameter("ans");
		int marks= Integer.parseInt(request.getParameter("marks"));
		
		AddDTO rdto= new AddDTO();
		
		rdto.setScode(scode);
		rdto.setQuesNo(quesNo);
		rdto.setQues(ques);
		rdto.setOpt1(opt1);
		rdto.setOpt2(opt2);
		rdto.setOpt3(opt3);
		rdto.setOpt4(opt4);
		rdto.setAns(ans);
		rdto.setMarks(marks);
		
		AddDAO rdao= new AddDAO();
		 rdao.insertQues(rdto);
		 request.setAttribute("msg", "Question added Successfully!!!");
		 request.getRequestDispatcher("Question.jsp").forward(request, response);
	}

}
