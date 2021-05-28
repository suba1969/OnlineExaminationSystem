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
 * Servlet implementation class addStudentsByAdmin
 */
public class addStudentsByAdmin extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html");
		
		Random random = new Random();
		int studentId = random.nextInt(90000) + 100000;
		String pass= request.getParameter("pass");
    	String name= request.getParameter("name");
    	String email= request.getParameter("email");
    	String mobno= request.getParameter("mobno");
    	String dob= request.getParameter("dob");
    	String gender= request.getParameter("gender");
    	String add= request.getParameter("add");
    	
        
        AddDTO rdto= new AddDTO();
        rdto.setStudentId(studentId);
        rdto.setPass(pass);
        rdto.setName(name);
        rdto.setEmail(email);
        rdto.setMobno(mobno);
        rdto.setDob(dob);
        rdto.setGender(gender);
        rdto.setAdd(add);
        
        AddDAO rdao=new AddDAO();
        int i=rdao.insertData(rdto);
		if(i>0) {
			request.setAttribute("msg1","Successfully Registered!!!");
			request.setAttribute("msg2","Your User Id: ");
			request.setAttribute("msg3",rdto.getStudentId());
			
			request.getRequestDispatcher("adminView.jsp").forward(request, response);
		}else {
			response.sendRedirect("adminView.jsp");
	}
	}

}
