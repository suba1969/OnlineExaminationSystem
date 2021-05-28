package master.DAO;
import java.sql.*;


import master.DTO.AddDTO;
import master.utilities.ConnectionFactory;



public class AddDAO {
	static Connection cn=null;
	PreparedStatement ps=null;
	
    String INSERT_USERS_SQL= "insert into user_details values(?,?,?,?,?,?,?,?) ";
    String INSERT_ADMIN_SQL= "insert into admin values(?,?,?) ";
	String delete_sql="DELETE FROM `exam_portal`.`user_details` WHERE (`s_id` = ?);";
	String delete_sub="DELETE FROM `exam_portal`.`subjects` WHERE (`subject-code` = ?);";
	String delete_ques="DELETE FROM `exam_portal`.`questions` WHERE (`qid` = ?);";
    String select_sql= "SELECT * FROM exam_portal.user_details WHERE `s_id`=? and password=?";
    String select_admin= "SELECT * FROM exam_portal.admin WHERE `admin_id`=? and password=?";
    String insert_exam_sql="insert into exams values(?,?)";
    String insert_sub_sql="insert into  subjects values(?,?)";
    String insert_question="INSERT INTO `exam_portal`.`questions` VALUES (?,?,?,?,?,?,?,?,?);";
    String show_questions= "select * from questions where `subject-code`=?";
    
    public  int ShowQuestions(AddDTO rdto)
	{
    	int i=0;
		try
		{
			ConnectionFactory con=new ConnectionFactory();
			cn=con.getConn();
			ps=cn.prepareStatement(show_questions);
			
			ps.setInt(1, rdto.getScode());
			
			ResultSet rs=ps.executeQuery();
			while(rs.next()) {
				i=1;
			}
			 
			 cn.close();
		}
		catch(SQLException e)
		{
			e.printStackTrace();
			//System.out.println(e);
			
		}
		return i;
	}
    
    public void insertQues(AddDTO rdto) {
    	
    	try {
    		ConnectionFactory con= new ConnectionFactory();
        	cn=con.getConn();
        	ps= cn.prepareStatement(insert_question);
        	ps.setInt(1, rdto.getScode());
        	ps.setInt(2, rdto.getQuesNo());
        	ps.setString(3, rdto.getQues());
        	ps.setString(4, rdto.getOpt1());
        	ps.setString(5, rdto.getOpt2());
        	ps.setString(6, rdto.getOpt3());
        	ps.setString(7, rdto.getOpt4());
        	ps.setString(8, rdto.getAns());
        	ps.setInt(9, rdto.getMarks());
        	
        	
        	ps.executeUpdate();
        	cn.close();
        	
    	}catch(SQLException se) {
    		se.printStackTrace();
    	}
    }
    
    
    public int insertSubject(AddDTO rdto) {
    	int i=0;
    	try {
    		ConnectionFactory con= new ConnectionFactory();
        	cn=con.getConn();
        	ps= cn.prepareStatement(insert_sub_sql);
        	ps.setInt(1, rdto.getScode());
        	ps.setString(2, rdto.getSname());
        	
        	i=ps.executeUpdate();
        	
        	
    	}catch(SQLException se) {
    		se.printStackTrace();
    	}
    	return i;
    }
    
	
	public int insertData(AddDTO rdto){
		int i=0;
			try{
				
        	ConnectionFactory con= new ConnectionFactory();
        	cn=con.getConn();
        	ps= cn.prepareStatement(INSERT_USERS_SQL);
        	ps.setInt(1, rdto.getStudentId());
            ps.setString(2, rdto.getName());
            ps.setString(3, rdto.getPass());
            ps.setString(4, rdto.getEmail());
            ps.setString(5, rdto.getMobno() );
            ps.setString(6, rdto.getDob());
            ps.setString(7, rdto.getGender());
            ps.setString(8, rdto.getAdd());

            
            // Step 3: Execute the query or update query
           i= ps.executeUpdate();
            cn.close();
        } catch (SQLException e) {
            // process sql exception
            e.printStackTrace();
        }
		return i;
    }
	
	
	public void insertAdmin(AddDTO rdto){
		
			try{
				
        	ConnectionFactory con= new ConnectionFactory();
        	cn=con.getConn();
        	ps= cn.prepareStatement(INSERT_ADMIN_SQL);
        	ps.setInt(1, rdto.getAddId());
            ps.setString(2, rdto.getAddName());
            ps.setString(3, rdto.getAddPass());
            

            
            // Step 3: Execute the query or update query
           ps.executeUpdate();
            cn.close();
        } catch (SQLException e) {
            // process sql exception
            e.printStackTrace();
        }
		
    }
	
	public void deleteData(AddDTO rdto)
	{
		
		try
		{
			ConnectionFactory con=new ConnectionFactory();
			cn=con.getConn();
			ps=cn.prepareStatement(delete_sql);
			ps.setInt(1,rdto.getStudentId());
			ps.executeUpdate();
			cn.close();
			
		}
		catch(SQLException se)
		{
			se.printStackTrace();
			
		}
		
	}
	
	public void deleteQues(AddDTO rdto)
	{
		
		try
		{
			ConnectionFactory con=new ConnectionFactory();
			cn=con.getConn();
			ps=cn.prepareStatement(delete_ques);
			ps.setInt(1,rdto.getQuesNo());
			ps.executeUpdate();
			cn.close();
			
		}
		catch(SQLException se)
		{
			se.printStackTrace();
			
		}
		
	}
	
	public void deleteSub(AddDTO rdto)
	{
		
		try
		{
			ConnectionFactory con=new ConnectionFactory();
			cn=con.getConn();
			ps=cn.prepareStatement(delete_sub);
			ps.setInt(1,rdto.getScode());
			ps.executeUpdate();
			cn.close();
			
		}
		catch(SQLException se)
		{
			se.printStackTrace();
			
		}
		
	}

	
	public  AddDTO validate(int studentId, String pass)
	{
		
		AddDTO rdto= new AddDTO();
		try
		{
			ConnectionFactory con=new ConnectionFactory();
			cn=con.getConn();
			ps=cn.prepareStatement(select_sql);
			
			ps.setInt(1, studentId);
			ps.setString(2, pass);
			
			 ResultSet rs= ps.executeQuery();
			 
			 
			 while(rs.next()) {
					rdto.setName(rs.getString(2)); 
				}
			 cn.close();
		}
		catch(SQLException e)
		{
			e.printStackTrace();
			
		}
		return rdto;
	}
	
	public  AddDTO validateAdmin(int addid, String pass)
	{
		
		AddDTO rdto= new AddDTO();
		try
		{
			ConnectionFactory con=new ConnectionFactory();
			cn=con.getConn();
			ps=cn.prepareStatement(select_admin);
			
			ps.setInt(1, addid);
			ps.setString(2, pass);
			
			 ResultSet rs= ps.executeQuery();
			 
			 
			 while(rs.next()) {
					rdto.setAddName(rs.getString(2)); 
				}
			 cn.close();
		}
		catch(SQLException e)
		{
			e.printStackTrace();
			
		}
		return rdto;
	}
	
	public  ResultSet getResultFromSqlQuery(String SqlQueryString) {
		ResultSet rs = null;
		try {
			ConnectionFactory con=new ConnectionFactory();
			cn=con.getConn();
			rs = cn.createStatement().executeQuery(SqlQueryString);
			
		} catch (Exception ex) {
			ex.printStackTrace();
		}
		return rs;
	}
	
	public  int insertUpdateFromSqlQuery(String SqlQueryString) {
		int result=0;
		try {
			ConnectionFactory con=new ConnectionFactory();
			cn=con.getConn();
			ps=cn.prepareStatement(SqlQueryString);
			result=ps.executeUpdate();
			
		} catch (SQLException ex) {
			ex.printStackTrace();
		}
		return result;
	}

}
