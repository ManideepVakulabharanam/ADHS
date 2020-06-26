

import java.io.IOException;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class AddTeacher
 */
@WebServlet("/AddTeacher")
public class AddTeacher extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AddTeacher() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//response.getWriter().append("Served at: ").append(request.getContextPath());
		String firstname = request.getParameter("firstname"); 
		String Lastname = request.getParameter("Lastname"); 
		String FatherName = request.getParameter("FatherName"); 
		String Designation = request.getParameter("Designation"); 
		System.out.print(Designation);
		String aadarno = request.getParameter("aadarno"); 
		String dob = request.getParameter("dob");
		String mobile = request.getParameter("mobile"); 
		String village = request.getParameter("village"); 
		Connection con = DBConnection.DBconnect();
		int sum = 0;
	    try {
	    	if(con.equals(null)){
	    		
	    	}else{
	    		 System.out.print("done");
	    	}
	    	int i = 0;
	    	String ret = "select id from teacher_details";
	    	Statement stt = con.createStatement();
	    	ResultSet rs = stt.executeQuery(ret);
	       while(rs.next()){
	    	   i = rs.getInt(1);
	       }
	       i++;
	       System.out.print(i);
	    	String sql = "insert into teacher_details values(?,?,?,?,?,?,?,?,?);";
	    	java.sql.PreparedStatement st = con.prepareStatement(sql);
	    	st.setInt(1, i );
			st.setString(2,firstname );
			st.setString(3,Lastname );
			st.setString(4,FatherName );
			st.setString(5,Designation );
			st.setString(6, dob);
			st.setString(7,aadarno );
			st.setString(8,mobile);
			st.setString(9,village);
			String un = firstname.substring(0,4);
			String er = Lastname.substring(0,2);
			String user = un+er;
			String pass = "1234";
			int j = st.executeUpdate();
			 long millis=System.currentTimeMillis();  
				java.sql.Date date=new java.sql.Date(millis);
			String user_login = "insert into teacher_login values('"+user+"','"+pass+"',"+i+",'"+date+"',0);";
			String salary = "insert into teachersalaries values("+i+",0,0,0,0,0,0,0,0,0,0,0,0);";
			String stl = "insert into teacher_attendence values("+i+",0,0,0,0,' ','"+date+"',2,4,0,' ','2006-02-03');";
			int k = stt.executeUpdate(user_login);
			int l = stt.executeUpdate(salary);
			int x = stt.executeUpdate(stl);
			con.close();
			if(j > 0 && k>0 && l>0 && x>0){
				request.setAttribute("result","your username and password are:" +user+" "+pass);
				RequestDispatcher rd = request.getRequestDispatcher(""
						+"AddTeacher.jsp");
				rd.forward(request, response);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
