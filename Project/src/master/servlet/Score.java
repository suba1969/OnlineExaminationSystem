package master.servlet;

import java.io.IOException;
import java.sql.ResultSet;
import java.util.Random;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import master.DAO.AddDAO;

public class Score extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
			HttpSession session = request.getSession();
			
			int id = 0;
			String answer = null;
			String hitAnswer = null;
			String studentName = "";
			int countAnswer;
			int resultCorrect = 0;
			int resultWrong = 0;
			int marks = 0;
			String dateTime;
			HttpSession sn= request.getSession();
			
			AddDAO rdao= new AddDAO();
			ResultSet resultTimestamp = rdao.getResultFromSqlQuery("select distinct `sub-id`, examdate from scores where `scoreid`='"+ sn.getAttribute("scoreid") + "'");
			while (resultTimestamp.next()) {
				countAnswer = 0;
				resultCorrect = 0;
				resultWrong = 0;
				marks = 0;

				ResultSet resultCount = rdao.getResultFromSqlQuery("select count(question) from questions where `subject-code`='"+ resultTimestamp.getString("sub-id") + "'");
				resultCount.next();
				int count = resultCount.getInt(1);

				ResultSet resultSet = rdao.getResultFromSqlQuery("select * from questions where `subject-code`='" + resultTimestamp.getString("sub-id") + "'");
				while (resultSet.next()) {
					id = resultSet.getInt(2);
					answer = resultSet.getString(8);
					ResultSet rs = rdao.getResultFromSqlQuery("select * from scores where `student_id`='" + session.getAttribute("id") + "' and `qid`='"+ id + "' and  examdate='" + resultTimestamp.getTimestamp("examdate") + "'");
					if (rs.next()) {
						hitAnswer = rs.getString("hitanswer");
						dateTime = rs.getString("examdate");
					}
					if (answer.equals(hitAnswer)) {
						int rc=0;
						resultCorrect++;
						rc++;
						marks = marks + rc * resultSet.getInt(9);
					} else {
						resultWrong++;
					}
				}
				
				ResultSet rsStudentName = rdao.getResultFromSqlQuery("select name from `user_details` where `s_id`='" + session.getAttribute("id") + "'");
				
				
				if (rsStudentName.next()) {
				studentName = rsStudentName.getString("name");
				}
				
				rdao.insertUpdateFromSqlQuery("insert into result(resultid,student_id,student_name,sub_id,total_ques,correct_answer,wrong_answer,marks,examtime)values('"+sn.getAttribute("scoreid")+"','"+ session.getAttribute("id") + "','" + studentName + "','"+resultTimestamp.getString("sub-id")+"','"+count+"','" + resultCorrect + "','" + resultWrong + "','" + marks+ "','" + resultTimestamp.getTimestamp("examdate")  + "')");
				
			}

			response.sendRedirect("viewResponse.jsp");
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

}
