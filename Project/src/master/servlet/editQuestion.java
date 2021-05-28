package master.servlet;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import master.utilities.ConnectionFactory;

/**
 * Servlet implementation class editQuestion
 */
public class editQuestion extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
			response.setContentType("text/html");
			HttpSession hs= request.getSession();

			String ques = request.getParameter("ques");
			String opt1=request.getParameter("opt1");
			String opt2=request.getParameter("opt2");
			String opt3=request.getParameter("opt3");
			String opt4=request.getParameter("opt4");
			String ans=request.getParameter("ans");
			String marks=request.getParameter("marks");
			
			
			Connection cn=null;
			PreparedStatement ps=null;
			ConnectionFactory con=new ConnectionFactory();
			cn=con.getConn();
			
			
			
			int sid= ((Integer)hs.getAttribute("sid")).intValue();
			ps=cn.prepareStatement("UPDATE `exam_portal`.`questions` SET `question` = '"+ques+"', `opt1` = '"+opt1+"', `opt2` = '"+opt2+"', `opt3` = '"+opt3+"', `opt4` = '"+opt4+"', `ans` = '"+ans+"', `marks` = '"+marks+"' WHERE (`qid` = '"+sid+"');");
			int i=0;
			i= ps.executeUpdate();

			
			if(i>0) {
			request.setAttribute("msg", "Question Id: "+sid+" Successfully updated!!!");
			request.getRequestDispatcher("Qlist.jsp").forward(request, response);
			}
			else {
				response.sendRedirect("Qlist.jsp");
			}
			}catch(Exception e){
				e.printStackTrace();
			}
	}

}
