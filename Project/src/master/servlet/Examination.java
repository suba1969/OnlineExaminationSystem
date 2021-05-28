package master.servlet;

import java.io.IOException;
import java.sql.ResultSet;
import java.sql.Timestamp;
import java.util.Random;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


import master.DAO.AddDAO;

/**
 * Servlet implementation class Examination
 */
public class Examination extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
		HttpSession session = request.getSession();
		int studentId = (Integer) session.getAttribute("id");
		int qid = 0;
		int submitAnswer = 0;
		Random random = new Random();
		int scoreId = random.nextInt(80000) + 900000;
		
		AddDAO rdao= new AddDAO();
		ResultSet resultSet= rdao.getResultFromSqlQuery("select * from questions where `subject-code`='"+session.getAttribute("selectTopic")+"'");
		Timestamp timestamp = new Timestamp(System.currentTimeMillis());
		
		while (resultSet.next()) {
			qid = resultSet.getInt(2);
			
			submitAnswer = rdao.insertUpdateFromSqlQuery(
					"insert into scores values('"+scoreId+"','" + studentId + "','"
							+ qid + "','" + request.getParameter(resultSet.getString(2)) + "','"+resultSet.getString(8)+"','"+timestamp+"','"+session.getAttribute("selectTopic")+"')");
		
		}
		if (submitAnswer > 0) {
			HttpSession sn= request.getSession();
			sn.setAttribute("scoreid", scoreId);
			response.sendRedirect("thanksSubmitingExam.jsp");
		} else {
			response.sendRedirect("examTest.jsp");
		}
		}catch (Exception e) {
			e.printStackTrace();
		}
	}

}
